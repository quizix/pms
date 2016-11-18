package com.dxw.pms.dal;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.PigLog;
import com.dxw.pms.models.Shed;
import com.dxw.pms.models.ShedLog;
import com.dxw.pms.models.Sty;
import com.pms.utils.TimeUtil;

@Repository
public class PigLogDaoImpl implements PigLogDao {
	private final SessionFactory sessionFactory;

	@Autowired
	StyDao styDao;
	
	@Autowired
	ShedDao shedDao;
	
	@Autowired
	ShedLogDao shedLogDao;

	@Autowired
	public PigLogDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void add(PigLog pigLog) throws DbException {
		try {
			Session session = sessionFactory.getCurrentSession();
			Date date = TimeUtil.getNormalizedDate(new Date());
			switch (pigLog.getOperation()) {
			case 1:
			// 入栏，需要调整目标栏位的数量
			{
				Sty sty = styDao.findById(pigLog.getStyIdTo());
				Long shedId = sty.getShedId();
				addShedLog(shedId, date, pigLog.getNumber(), 0, 0, 0);
				
				sty.setCurrentNumber(sty.getCurrentNumber() + pigLog.getNumber());
				session.persist(sty);
				pigLog.setDetail("入栏");
			}

				break;
			case 2:
			// 转栏，需要同时调整源栏位和目标栏位的数量
			{
				Sty styFrom = styDao.findById(pigLog.getStyIdFrom());
				styFrom.setCurrentNumber(styFrom.getCurrentNumber() - pigLog.getNumber());
				session.persist(styFrom);
				Sty styTo = styDao.findById(pigLog.getStyIdTo());
				styTo.setCurrentNumber(styTo.getCurrentNumber() + pigLog.getNumber());
				session.persist(styTo);
				pigLog.setDetail(String.format("从%s移到%s", styFrom.getName(),
						styTo.getName()));
			}
				break;
			case 3: {
				Sty sty = styDao.findById(pigLog.getStyIdFrom());
				Long shedId = sty.getShedId();
				addShedLog(shedId, date, 0, 0, 0, pigLog.getNumber());
				
				sty.setCurrentNumber(sty.getCurrentNumber() - pigLog.getNumber());
				session.persist(sty);
				pigLog.setDetail("健康猪出栏");
				
				
			}
				break;
			case 4: {
				Sty sty = styDao.findById(pigLog.getStyIdFrom());
				Long shedId = sty.getShedId();
				addShedLog(shedId, date, 0, 0, pigLog.getNumber(), 0);
				
				sty.setCurrentNumber(sty.getCurrentNumber() - pigLog.getNumber());
				session.persist(sty);
				pigLog.setDetail("病猪出栏");
			}
				break;
			case 5:
			// 出栏：需要调整源栏位的数量
			{
				Sty sty = styDao.findById(pigLog.getStyIdFrom());
				Long shedId = sty.getShedId();
				addShedLog(shedId, date, 0, pigLog.getNumber(), 0, 0);
				
				sty.setCurrentNumber(sty.getCurrentNumber() - pigLog.getNumber());
				session.persist(sty);
				pigLog.setDetail("死猪出栏");
			}
				break;
			}
			session.persist(pigLog);
			
			session.flush();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new DbException(ex.getMessage());
		}
	}
	
	private void addShedLog(Long shedId, Date date, int entryNumber, 
			int deadDeliveryNumber, int illDeliveryNumber, int heathyDeliveryNumber){
		ShedLog shedLog = shedLogDao.findByShedIdAndDate(shedId, date);
		
		if(shedLog == null){
			Shed shed = shedDao.findById(shedId);
			shedLog = new ShedLog();
			shedLog.setCreateTime(date);
			shedLog.setModifyTime(date);
			shedLog.setDate(date);
			shedLog.setShedId(shedId);
			shedLog.setIllDeliveryNumber(illDeliveryNumber);
			shedLog.setDeadDeliveryNumber(deadDeliveryNumber);
			shedLog.setEntryNumber(entryNumber);
			shedLog.setHealthyDeliveryNumber(heathyDeliveryNumber);
			shedLog.setStockNumber(shed.getStockNumber() + entryNumber-deadDeliveryNumber-illDeliveryNumber
					-heathyDeliveryNumber);
		}
		else{
			shedLog.setModifyTime(date);
			shedLog.setIllDeliveryNumber(shedLog.getIllDeliveryNumber() + illDeliveryNumber);
			shedLog.setDeadDeliveryNumber(shedLog.getDeadDeliveryNumber() + deadDeliveryNumber);
			shedLog.setEntryNumber(shedLog.getEntryNumber() + entryNumber);
			shedLog.setHealthyDeliveryNumber(shedLog.getHealthyDeliveryNumber() +heathyDeliveryNumber);
			shedLog.setStockNumber(shedLog.getStockNumber()+entryNumber-deadDeliveryNumber-illDeliveryNumber
					-heathyDeliveryNumber);
		}
		shedLogDao.addOrUpdate(shedLog);
	}

	@Override
	public List findAll(Long styId, int operation) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(PigLog.class);

		Criterion c1 = Restrictions.or(Restrictions.eq("styIdFrom", styId), Restrictions.eq("styIdTo", styId));

		if (operation == 0) {
			criteria.add(c1);
		} else {
			Criterion c2 = Restrictions.eq("operation", operation);
			criteria.add(Restrictions.and(c1, c2));
		}
		return criteria.list();
	}
}

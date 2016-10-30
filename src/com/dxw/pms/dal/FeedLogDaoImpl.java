package com.dxw.pms.dal;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.FeedLog;
import com.dxw.pms.models.Warehouse;

@Repository
public class FeedLogDaoImpl implements FeedLogDao {
	SessionFactory sessionFactory;

	@Autowired
	WarehouseDao warehouseDao;

	@Autowired
	public FeedLogDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void add(FeedLog feedLog) throws DbException {
		try {
			Session session = sessionFactory.getCurrentSession();

			session.persist(feedLog);

			Warehouse warehouse = warehouseDao.findById(feedLog.getWarehouseId());
			warehouse.setQuantity(warehouse.getQuantity() + feedLog.getQuantity());

			session.persist(warehouse);
			session.flush();
		} catch (Exception ex) {
			throw new DbException(ex.getMessage());
		}
		
	}
	
	@Override
	public List findAll(Long warehouseId) {
		Session session = sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(FeedLog.class);
		criteria.add(Restrictions.eq("warehouseId", warehouseId));
		return criteria.list();
	}

	

}

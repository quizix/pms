package com.dxw.pms.dal;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.ShedLog;
import com.pms.utils.TimeUtil;

@Repository
public class ShedLogDaoImpl implements ShedLogDao{
	SessionFactory sessionFactory;

	@Autowired
	public ShedLogDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<ShedLog> findByShedId(Long id) {
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from ShedLog where shedId=:id");
		query.setParameter("id", id);
		return query.list();
	}

	@Override
	public ShedLog findByShedIdAndDate(Long shedId,Date date) {
		Session session = sessionFactory.getCurrentSession();
		Date normalizedDate = TimeUtil.getNormalizedDate(date);
		
		Query query = session.createQuery("from ShedLog where shedId=:shedId, date=:date");
		query.setParameter("shedId", normalizedDate);
		query.setParameter("date", normalizedDate);
		return (ShedLog)query.uniqueResult();
	}

	@Override
	public void addOrUpdate(ShedLog shedLog) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(shedLog);
	}

	@Override
	public void add(ShedLog shedLog) {
		Session session = sessionFactory.getCurrentSession();
		session.save(shedLog);
	}
}

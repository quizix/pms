package com.dxw.pms.dal;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.Update;

@Repository
public class UpdateDaoImpl implements UpdateDao {

	SessionFactory sessionFactory;

	@Autowired
	public UpdateDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Update findById(Long id) {
		Session session = 
				sessionFactory.getCurrentSession();
		return (Update) session.get(Update.class, id);
	}
}

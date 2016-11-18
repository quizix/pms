package com.dxw.pms.dal;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.Shed;
import com.dxw.pms.models.Sty;

@Repository
public class ShedDaoImpl implements ShedDao {

	SessionFactory sessionFactory;

	@Autowired
	public ShedDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

	@Override
	public List findAll() {
		Session session = 
				sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Shed");
		return query.list();
	}


	@Override
	public Shed findById(Long id) {
		Session session = 
				sessionFactory.getCurrentSession();
		return (Shed) session.get(Shed.class, id);
	}

}

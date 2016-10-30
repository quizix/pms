package com.dxw.pms.dal;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.Sty;

@Repository
public class StyDaoImpl implements StyDao {

	SessionFactory sessionFactory;

	@Autowired
	public StyDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public Sty findById(Long id) {
		Session session = 
				sessionFactory.getCurrentSession();
		return (Sty) session.get(Sty.class, id);
	}
	
	@Override
	public Sty findByNaturalId(String code) {
		Session session = 
				sessionFactory.getCurrentSession();
		return (Sty) session.bySimpleNaturalId(Sty.class)
					.load(code);
	}

	@Override
	public List findAll() {
		Session session = 
				sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Sty");
		return query.list();
	}

}

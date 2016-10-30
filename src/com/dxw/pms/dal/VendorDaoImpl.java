package com.dxw.pms.dal;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.Vendor;

@Repository
public class VendorDaoImpl implements VendorDao{
	SessionFactory sessionFactory;

	@Autowired
	public VendorDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List findAll() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Vendor.class);
		return criteria.list();
	}

}

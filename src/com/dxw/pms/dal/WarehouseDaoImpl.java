package com.dxw.pms.dal;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.Sty;
import com.dxw.pms.models.Warehouse;

@Repository
public class WarehouseDaoImpl implements WarehouseDao {

	SessionFactory sessionFactory;

	@Autowired
	public WarehouseDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Warehouse findById(Long id) {
		Session session = 
				sessionFactory.getCurrentSession();
		return (Warehouse) session.get(Warehouse.class, id);
	}

	@Override
	public List findAll() {
		Session session = 
				sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Warehouse");
		return query.list();
	}


	@Override
	public Warehouse findByNaturalId(String code) {
		Session session = 
				sessionFactory.getCurrentSession();
		return (Warehouse)session.bySimpleNaturalId(Warehouse.class)
			.load(code);
	}

}

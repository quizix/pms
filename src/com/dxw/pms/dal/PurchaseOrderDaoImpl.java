package com.dxw.pms.dal;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxw.pms.models.PurchaseOrder;
import com.dxw.pms.models.Sty;

@Repository
public class PurchaseOrderDaoImpl implements PurchaseOrderDao{
	SessionFactory sessionFactory;

	@Autowired
	public PurchaseOrderDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public PurchaseOrder findByCode(String code) throws DbException{
		try {
			Session session = 
					sessionFactory.getCurrentSession();
			
			PurchaseOrder purchaseOrder = (PurchaseOrder) 
					session.bySimpleNaturalId(PurchaseOrder.class)
					.load(code);
			return purchaseOrder;
		}catch(Exception ex){
			throw new DbException(ex.getMessage());
		}
	}

	@Override
	public PurchaseOrder findById(Long id) throws DbException {
		try {
			Session session = 
					sessionFactory.getCurrentSession();
			
			return (PurchaseOrder) session.get(PurchaseOrder.class, id);
		}catch(Exception ex){
			throw new DbException(ex.getMessage());
		}
	}

	@Override
	public void update(PurchaseOrder purchaseOrder) throws DbException {
		try {
			Session session = 
					sessionFactory.getCurrentSession();
			
			session.update(purchaseOrder);
			session.flush();
		}catch(Exception ex){
			throw new DbException(ex.getMessage());
		}
		
	}
}

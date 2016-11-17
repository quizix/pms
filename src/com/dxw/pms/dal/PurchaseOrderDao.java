package com.dxw.pms.dal;

import com.dxw.pms.models.PurchaseOrder;

public interface PurchaseOrderDao {
	PurchaseOrder findByCode(String code) throws DbException;
	
	PurchaseOrder findById(Long id) throws DbException;
	
	void update(PurchaseOrder purchaseOrder) throws DbException;
}

package com.dxw.pms.dal;

import java.util.List;

import com.dxw.pms.models.Sty;
import com.dxw.pms.models.Warehouse;

public interface WarehouseDao {
	Warehouse findById(Long id);
	Warehouse findByNaturalId(String code);
	List findAll();
}

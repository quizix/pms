package com.dxw.pms.dal;

import java.util.List;

import com.dxw.pms.models.Shed;

public interface ShedDao {
	List findAll();
	
	Shed findById(Long id);
}

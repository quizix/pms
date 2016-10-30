package com.dxw.pms.dal;

import java.util.List;

import com.dxw.pms.models.Sty;

public interface StyDao {
	Sty findById(Long id);
	
	Sty findByNaturalId(String code);
	
	List findAll();
}

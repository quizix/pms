package com.dxw.pms.dal;

import java.util.List;

import com.dxw.pms.models.FeedLog;

public interface FeedLogDao {
	void add(FeedLog feedLog) throws DbException;
	
	List findAll(Long warehouseId);
}

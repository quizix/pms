package com.dxw.pms.dal;

import java.util.List;

import com.dxw.pms.models.PigLog;


public interface PigLogDao {
	/**
	 * 添加猪转栏记录
	 * @param pigLog
	 * @throws DbException
	 */
	void add(PigLog pigLog) throws DbException;
	
	/**
	 * 查找所有转栏记录
	 * @param styId
	 * @param operation
	 * @return
	 */
	List findAll(Long styId, int operation);
}

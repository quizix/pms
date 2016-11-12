package com.dxw.pms.dal;

import java.util.List;

import com.dxw.pms.models.User;

public interface UserDao {
	User findById(Long id);
	
	User findByNaturalId(String code);
	
	User findByName(String name);
	
	List findAll();
	
	void updateUser(User user);
}

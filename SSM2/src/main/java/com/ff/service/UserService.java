package com.ff.service;

import java.util.List;

import com.ff.model.User;

public interface UserService {
	 	int deleteByPrimaryKey(Integer userId);

	    int insert(User record);

	    User selectByPrimaryKey(Integer userId);

	    List<User> selectAll(String name);

	    int updateByPrimaryKey(User record);
	    
	    User login(User user);
	    
}

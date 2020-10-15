package com.ff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ff.mapper.UserMapper;
import com.ff.model.User;
import com.ff.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper  userMapper;
	
	
	public int deleteByPrimaryKey(Integer userId) {
		
		return userMapper.deleteByPrimaryKey(userId);
	}

	public int insert(User record) {
		
		return userMapper.insert(record);
	}

	public User selectByPrimaryKey(Integer userId) {
		
		return userMapper.selectByPrimaryKey(userId);
	}

	public List<User> selectAll(String name) {
		if(name==null||name.equals("")){
			return userMapper.selectAll();
		}
		name = "%"+name+"%";
		return userMapper.selectDim(name);
	}

	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKey(record);
	}

	public User login(User user) {
		User user2 = userMapper.login(user);
		return user2;
	}


	

}

package com.ff.mapper;

import com.ff.model.User;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    User selectByPrimaryKey(Integer userId);

    List<User> selectAll();

    int updateByPrimaryKey(User record);
    
    User login(User user);
    
    List<User> selectDim(String name);
}
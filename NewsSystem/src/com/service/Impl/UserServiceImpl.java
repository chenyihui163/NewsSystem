package com.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserMapper;
import com.pojo.User;
import com.service.UserService;

/**
 * 服务层接口实现类
 * @Service("newsService")用于将当前类注释为一个Spring的bean，名为newsService
 * */

@Service("userService")  
@Transactional  
//此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;
	
	public boolean insertUser(User user)
	{
		return userMapper.insertUser(user);
	}
	
	public boolean updateUser(int userId)
	{
		return userMapper.updateUser(userId);
	}
	
	public boolean deleteUser(int userId)
	{
		return userMapper.deleteUser(userId);
	}
	
	public List<User> findAllUser()
	{
		return userMapper.findAllUser();
	}
	
	public User selectUserById(int userId)
	{
		return userMapper.selectUserById(userId);
	}
	

}

package com.mapper;

import java.util.List;

import com.pojo.User;

public interface UserMapper {
	boolean insertUser(User user);
	boolean updateUser(int userId);
	boolean deleteUser(int userId);
	List<User> findAllUser();
	User selectUserById(int userId);

	

}

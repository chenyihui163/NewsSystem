package com.pojo;

import java.io.Serializable;

public class User implements Serializable {
	/*
	 * 
	 * 编号:userId
                 账号userName
                  密码password
*/
	private int userId;

	private String password;
	private String userType;
	public User()
	{
		super();
	}
	public User(int userId,String password)
	{
		super();
		this.userId=userId;
		this.password=password;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}



	

}

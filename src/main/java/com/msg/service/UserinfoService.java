package com.msg.service;

import java.util.List;

import com.msg.entity.User;

public interface UserinfoService {
	// 用户注册
	public int registerUser(User user);

	// 用户登录
	public User loginUser(String username, String password);

	// 查询除了自己以外的其他用户
	public List<User> listUser(String username);

	// 查询用户是否存在
	public int getUser(String username);
}

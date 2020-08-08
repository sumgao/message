package com.msg.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msg.entity.User;
import com.msg.mapper.UserinfoMapper;
import com.msg.service.UserinfoService;

@Service
public class UserinfoServiceImpl implements UserinfoService {
	@Autowired
	private UserinfoMapper userinfoMapper;

	// 用户注册
	@Override
	public int registerUser(User user) {
		int i = this.userinfoMapper.insert(user);
		return i;
	}

	// 用户登录
	@Override
	public User loginUser(String username, String password) {
		User user = this.userinfoMapper.selectLogin(username, password);
		return user;
	}

	// 查询除了自己以外的其他用户
	@Override
	public List<User> listUser(String username) {
		List<User> list = this.userinfoMapper.selectOtherUser(username);
		return list;
	}

	// 查询用户是否存在
	@Override
	public int getUser(String username) {
		int i = this.userinfoMapper.selectExistUser(username);
		return i;
	}

}

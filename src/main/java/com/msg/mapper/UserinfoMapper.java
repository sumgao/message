package com.msg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.msg.entity.User;

public interface UserinfoMapper {

	User selectLogin(@Param("username") String username, @Param("password") String password);

	List<User> selectOtherUser(String username);

	int selectExistUser(String username);

	int insert(User user);

}
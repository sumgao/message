package com.msg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.msg.entity.Msg;

public interface MsgMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Msg record);

	Msg selectByPrimaryKey(Integer id);

	List<Msg> selectAll(@Param("receiveuser") String receiveuser, @Param("status") Integer status);

	int updateByPrimaryKey(@Param("id") Integer id, @Param("status") Integer status);

}
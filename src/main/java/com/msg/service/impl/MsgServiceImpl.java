package com.msg.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msg.entity.Msg;
import com.msg.mapper.MsgMapper;
import com.msg.service.MsgService;

@Service
//进行事务处理，自动扫描
public class MsgServiceImpl implements MsgService {

	@Autowired
	// 按照类型 自动注入
	private MsgMapper msgMapper;

	@Override
	public List<Msg> msgList(String receiveuser, int status) {
		List<Msg> selectAll = this.msgMapper.selectAll(receiveuser, status);
		return selectAll;
	}

	@Override
	public int readMessage(int id, int status) {
		int i = this.msgMapper.updateByPrimaryKey(id, status);
		return i;
	}

	@Override
	public Msg getMsgById(int id) {
		Msg msg = this.msgMapper.selectByPrimaryKey(id);
		return msg;
	}

	@Override
	public int sendMsg(Msg msg) {
		int i = this.msgMapper.insert(msg);
		return i;
	}

	@Override
	public int deleteMsgById(int id) {
		int i = this.msgMapper.deleteByPrimaryKey(id);
		return i;
	}

}

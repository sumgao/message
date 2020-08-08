package com.msg.service;

import java.util.List;

import com.msg.entity.Msg;

public interface MsgService {
	// 查询所有已读/未读信息 status==0为未读，status==1为已读
	public List<Msg> msgList(String receiveuser, int status);

	// 阅读信息（未读变已读）
	public int readMessage(int id, int status);

	// 根据id查询信息
	public Msg getMsgById(int id);

	// 发送信息（增加一条）
	public int sendMsg(Msg msg);

	// 根据id删除
	public int deleteMsgById(int id);
}

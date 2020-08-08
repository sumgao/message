package com.msg.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.msg.entity.Msg;
import com.msg.entity.User;
import com.msg.service.MsgService;
import com.msg.service.UserinfoService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private MsgService msgService;
	@Resource
	private UserinfoService userinfoService;

	@RequestMapping("/msgList")
	public String msgList(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginuser");
		// 已读消息列表

		List<Msg> ydmsgList = null;
		ydmsgList = this.msgService.msgList(user.getUsername(), 0);// list==null和list is empty

		request.setAttribute("ydmsgList", ydmsgList);

		// 未读消息列表
		List<Msg> wdmsgList = new ArrayList<Msg>();
		wdmsgList = this.msgService.msgList(user.getUsername(), 1);

		request.setAttribute("wdmsgList", wdmsgList);
		return "user/message";

	}

	@RequestMapping("/exit")
	public String exit(HttpServletRequest request) {
		request.getSession().removeAttribute("loginuser");
		return "redirect:../go.do?url=login";
//		return new ModelAndView("redirect:/login");

	}

	@RequestMapping("/deleteMsg")
	public String deleteMsg(HttpServletRequest request) {
		int msgId = Integer.parseInt(request.getParameter("msgid"));
		int i = this.msgService.deleteMsgById(msgId);
		return "redirect:msgList.do?delI=" + i;

	}

	@RequestMapping("/getMsgById")
	public String getMsgById(HttpServletRequest request) {
		int msgId = Integer.parseInt(request.getParameter("msgid"));
		Msg msg = this.msgService.getMsgById(msgId);
		request.setAttribute("msg", msg);
		return "user/readMessage";
	}

	@RequestMapping("/readMessage")
	public String readMessage(HttpServletRequest request) {
		int msgId = Integer.parseInt(request.getParameter("msgid"));
		int status = Integer.parseInt(request.getParameter("status"));
		this.msgService.readMessage(msgId, (status == 1 ? 0 : 1));
		return "redirect:msgList.do";

	}

	@RequestMapping("/sendMessage")
	public String sendMessage(HttpServletRequest request) {

		String receiveUser = request.getParameter("toUser");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		User user = (User) request.getSession().getAttribute("loginuser");
		String sendUser = user.getUsername();

		Msg msg = new Msg();
		msg.setSenduser(sendUser);
		msg.setReceiveuser(receiveUser);
		msg.setTitle(title);
		msg.setContent(content);

		int i = this.msgService.sendMsg(msg);
		return "redirect:msgList.do?sendI=" + i;

	}

	@RequestMapping("/getUserList")
	public String getUserList(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginuser");
		List<User> listUser = new ArrayList<User>();
		listUser = this.userinfoService.listUser(user.getUsername());

		String reply = request.getParameter("replyMsgId");
		if (reply != null && reply != "") {
			int replyMsgId = Integer.parseInt(reply);
			int replyMsgI = this.msgService.readMessage(replyMsgId, 0);
		}

		request.setAttribute("listUser", listUser);
		return "user/sendMessage";

	}

}

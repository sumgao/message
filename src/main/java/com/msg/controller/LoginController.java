package com.msg.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.msg.entity.User;
import com.msg.service.MsgService;
import com.msg.service.UserinfoService;

@Controller

public class LoginController {

	@Resource
	private UserinfoService userinfoService;
	@Resource
	private MsgService msgService;

	@RequestMapping("/go")
	public String go(String url) {
		return url;
	}

	@RequestMapping("/login")
	public String login(String username, String password, HttpSession session) {
		String md5Pwd = MD5.getMD5(password);
		User user = this.userinfoService.loginUser(username, md5Pwd);
		if (user != null) {
			session.setAttribute("loginuser", user);
			return "redirect:user/msgList.do";
		} else {
			return "redirect:go.do?url=login&loginError=error1";
		}

	}

	@RequestMapping("/checkLoginId")
	@ResponseBody
	/*public String checkLoginId(HttpServletRequest request, HttpServletResponse response) {
	String loginId = request.getParameter("loginId");
	int i = this.userinfoService.getUser(loginId);
	response.getWriter().print(i);
	return null;
	}*/

	public Map<String, Integer> checkLoginId(HttpServletRequest request) {
		String loginId = request.getParameter("loginId");
		int i = this.userinfoService.getUser(loginId);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("i", i);
		return map;
	}

	@RequestMapping("/register")
	public String register(HttpServletRequest request) {
		/*int i = this.userinfoService.registerUser(user);
		if (i > 0) {
			return "redirect:go.do?url=login&regMsg=regSuccess";// 注册成功，跳转登录界面
		
		} else {
			return "redirect:go.do?url=register&regMsg=regError";// 注册失败，返回注册界面
		
		}*/

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		User user = new User();
		user.setUsername(username);
		user.setPassword(MD5.getMD5(password));
		user.setEmail(email);

		int i = this.userinfoService.registerUser(user);
//		response.sendRedirect("login.jsp?regMsg=");
		if (i > 0) {
			return "redirect:go.do?url=login&regMsg=regSuccess";// 注册成功，跳转登录界面

		} else {
			return "redirect:go.do?url=register&regMsg=regError";// 注册失败，返回注册界面

		}
	}

}

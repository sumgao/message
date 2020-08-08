package com.msg.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class upload {

	@RequestMapping("/upload")
	public String upload(HttpServletRequest request, MultipartFile upload) throws IllegalStateException, IOException {

		// 创建目录保存上传的文件
		String path = request.getSession().getServletContext().getRealPath("/uploads/");
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}

		// 服务器中保存的文件名
		String filename = UUID.randomUUID().toString().replace("-", "") + "_" + upload.getOriginalFilename();
		// 上传文件
		upload.transferTo(new File(path, filename));

		String name = request.getParameter("name");
		System.out.println(name + "--------------11111111111111111");
		return "success.jsp";

	}
}

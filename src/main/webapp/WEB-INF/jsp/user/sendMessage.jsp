<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发消息</title>
<link type="text/css" rel="stylesheet" href="../css/sms.css" />
</head>
<body>
 <form  method="post" action="sendMessage.do">
	<div id="main">
		<div class="mainbox">			
			<div class="menu">
				<span>当前用户：<a href="msgList.do">${loginuser.username }</a></span>
				<span><a href="">发短消息</a></span>
				<span><a href="exit.do">退出</a></span>
			</div>
			<div class="content">
				<div class="message">
					<form method="post" >
						<div class="tmenu">
							<ul class="clearfix">
								<li>
									发送给：
									<select name="toUser">	
										<c:forEach items="${listUser }" var="u">
											<option <c:if test="${u.username eq param.sendUser }">selected="selected"</c:if>> ${u.username }	</option>
										</c:forEach>			  	 										  	 
					  	 			</select>
								</li>								
								标题：<input type="text" name="title"/>
							</ul>
						</div>
						<div class="view">
							<textarea name="content"></textarea>
							<div class="send"><input type="submit" name="submit" value=" " /></div>
						</div>
							<input type="hidden" name="replyMsgId" value="${param.replyMsgId }">
					</form>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>阅读短信息</title>
<link type="text/css" rel="stylesheet" href="../css/sms.css" />
</head>
<body>

	<div id="main">
		<div class="mainbox">			
			<div class="menu">
				<span>当前用户：<a href="msgList.do">${loginuser.username }</a></span>
				<span><a href="">发短消息</a></span>
				<span><a href="exit.do">退出</a></span>
			</div>
			<div class="content">
				<div class="message">
					 <form  method="post" action="readMessage.do">
						<div class="tmenu">
							<ul class="clearfix">
								<li>
									发件人：
									<select name="fromUser">																				
											<option>${msg.senduser}	</option>									
					  	 			</select>
								</li>
								
								标题：<input type="text" name="title"  value="${msg.title }"/>
							</ul>
						</div>
						<div class="view">
							<textarea name="content">${msg.content }</textarea>
							
						</div>
						<input type="hidden" name="msgid" value="${msg.id }">
						<input type="hidden" name="status" value="${msg.status }">
						<c:if test="${msg.status=='1' }">
							<div class=""><input type="submit" id="confirmRead" value="确认已读" /></div>
						</c:if>
						<c:if test="${msg.status=='0' }">
							<div class=""><input type="submit" id="unRead" value="标为未读" /></div>
						</c:if>						
										
						<a id="returnIndex" href="msgList.do">返回首页</a>
						
					</form>	
				</div>
			</div>
		</div>
	</div>

</body>
</html>
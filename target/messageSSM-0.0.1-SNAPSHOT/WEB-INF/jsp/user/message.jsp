<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link type="text/css" rel="stylesheet" href="../css/sms.css" />
<style>
.tips{
position:absolute;
top:50px;
left:45%;
color:red;
font-size:22px;
}
</style>
<script>
	function checkDel(msgid){
		var flag=confirm("确认删除该条信息吗？")
		if(flag==true){
			window.location="deleteMsg.do?msgid="+msgid
		}
		
	}

</script>
</head>
<body>
<div id="main">
	
	<div class="mainbox">
		<span class="tips">
			<c:if test="${!empty param.sendI }">
				${param.sendI==1?"发送成功":"发送失败" }
			</c:if>
			<c:if test="${!empty param.delI }">
				${param.delI==1?"删除成功":"删除失败" }
			</c:if>
		</span>
		<div class="title myMessage png"></div>
		<div class="menu">
			<span>当前用户：<a href="msgList.do">${loginuser.username }</a></span>
			<span><a href="getUserList.do">发短消息</a></span>
			<span><a href="exit.do">退出</a></span>
		</div>
		<div class="content messageList">
			<ul>
			<c:if test="${!empty wdmsgList }">
				<c:forEach items="${wdmsgList }" var="wdmsg">
					<li class="unReaded line-limit-length ">		  	 		
			  	 		<em><fmt:formatDate value="${wdmsg.sendtime }" type="both"/></em>

			  	 		<em><a href="getUserList.do?replyMsgId=${wdmsg.id }&sendUser=${wdmsg.senduser }">回信</a></em>
						<em><a href="javascript:checkDel(${wdmsg.id })">删除</a></em>
						<p >
							<strong><a href="getMsgById.do?msgid=${wdmsg.id }&status=1">${wdmsg.title }</a></strong>							
				  	 			${wdmsg.content }			  	 		  
						</p>			  	 		
			  	 	</li>				
				</c:forEach>			  	 		
		  	</c:if> 
		  	<c:if test="${!empty ydmsgList }">	
		  	 	<c:forEach items="${ydmsgList }" var="ydmsg">
					<li >		  	 		

						<em><fmt:formatDate value="${ydmsg.sendtime }" type="both"/></em>
			  	 		<em><a href="getUserList.do?replyMsgId=${ydmsg.id }&sendUser=${ydmsg.senduser }">回信</a></em>
						<em><a href="javascript:checkDel(${ydmsg.id })">删除</a></em>
						<p >
							<strong><a href="getMsgById.do?msgid=${ydmsg.id }&status=0">${ydmsg.title }</a></strong>							
				  	 			${ydmsg.content }			  	 		  
						</p>			  	 		
			  	 	</li>				
				</c:forEach>
			</c:if> 
		</div>
	</div>
</div>
</body>
</html>
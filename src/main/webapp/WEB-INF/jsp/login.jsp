<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
<link type="text/css" rel="stylesheet" href="css/sms.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script> 
    function checkSubmit(){
    	document.getElementById("idMsg").innerHTML="";
    	document.getElementById("pwdMsg").innerHTML="";
        var loginId=document.getElementById("username").value;
        var loginPwd=document.getElementById("password").value;
        if (loginId=="") {
            document.getElementById("idMsg").innerHTML="请输入账号"
        }else if (loginPwd=="") {
            document.getElementById("pwdMsg").innerHTML="请输入密码"
        }else{
        	 $.ajax({
        	        type: "post",
        	        url: "checkLoginId.do",
        	       
        	        data:"loginId="+loginId,

        	        success: function (response) {
        	            if (response.i==0) {
        	                $("#idMsg").html("账号不存在")
        	            }else{
        	            	$("#f").submit()
        	            	
        	            }
        	        }
        	    });
            
        }
    }
</script>
</head>
<body>
<div id="loginTitle" class="png"></div>
<div id="loginForm" class="userForm png">
	<form method="post" name="loginform" id="f" action="login.do">		
		<dl>			
			<div id="error">
				 ${param.loginError eq "error1"?"账号或密码错误，请重新登录！":"" } 
				${param.loginError eq "error2"?"请先登录！":"" } 
				${param.regMsg eq "regSuccess"?"注册成功，请登录":"" } 
			</div>
			<dt>用户名：</dt>
			<dd><input type="text" name="username" id="username"/><span class="span" id="idMsg"></span></dd>
			<dt>密　码：</dt>
			<dd><input type="password" name="password" id="password" /><span class="span" id="pwdMsg"></span></dd>
		</dl>
		<div class="buttons">
			<input class="btn-login png" type="button"  id="loginBtn" onclick="checkSubmit()"/>
			
			<input class="btn-reg png" type="button" id="regBtn" value=" " onclick='location.href=("go.do?url=register")' />
			<!-- <input class="btn-login png" type="submit" value="" id="loginBtn" />
			
			<input class="btn-reg png" type="button" id="regBtn" value=" "  /> -->
		</div>		
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册界面</title>
<link type="text/css" rel="stylesheet" href="css/sms.css" />
<script src="js/jquery-3.1.1.min.js"></script>
<script> 
$(document).ready(function () {
    $("#subBtn").click(function () {
        $("#idMsg").html("");
        $("#pwdMsg").html("");
        $("#repwdMsg").html("");
        $("#box").html("")
        var loginId=$("#username").val();
        var loginPwd=$("#password").val();
        var rePwd=$("#repass").val();
       
        if(loginId==""){
            $("#idMsg").html("账号不能为空！")
             
        }else if(loginPwd==""){
            $("#pwdMsg").html("密码不能为空！");

        }else if(rePwd==""){
            $("#repwdMsg").html("确认密码不能为空！");
            
        }else if(loginPwd!=rePwd){   
            $("#box").html("两次密码输入不一致")
        }else{
       	 $.ajax({
 	        type: "post",
 	        url: "checkLoginId.do",
 	        data: "loginId="+loginId,

 	        success: function (response) {
 	            if (response.i==1) {
 	                $("#idMsg").html("账号已经存在")
 	            }else{
 	            	$("#f").submit()
 	            	
 	            }
 	        }
 	    });
        }

    });
}) ;	
</script>
</head>
<body>
<div id="regTitle" class="png"></div>
<div id="regForm" class="userForm png">
<div id="error">		
	${param.regMsg eq "regError"?"注册失败，请重新注册":"" } 
</div>
<div id="box"></div>
	<form action="/login/register.do"  id="f" method="post">
		<dl>
			<dt>用 户 名：</dt>
			<dd><input type="text" name="username" id="username"/><span class="span" id="idMsg"></span></dd>
			<dt>密　　码：</dt>
			<dd><input type="password" name="password" id="password"/><span class="span" id="pwdMsg"></span></dd>
			<dt>确认密码：</dt>
			<dd><input type="password" name="affirm" id="repass"/><span class="span" id="repwdMsg"></span></dd>
			<dt>邮　　箱：</dt>
			<dd><input type="text" name="email" /></dd>
		</dl>
		<div class="buttons">
			<input class="btn-reg png"  type="button" id="subBtn"  />
			<input class="btn-reset png" type="reset" id="resetBtn" value=" " />
		</div>
		<div class="goback"><a href="go.do?url=login" class="png">返回登录页</a></div>
	</form>
</div>
</body>
</html>
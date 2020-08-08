<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="upload.do" method="post" enctype="multipart/form-data">
    <input type="file" name="upload" id="file">
    <input type="text" name="content" value="内容">
    <input type="text" name="name" value="名称">
    <button type="submit">提交请求</button>
</form>

</body>
</html>
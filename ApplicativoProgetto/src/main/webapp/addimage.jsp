<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@include file="getidevento.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title> Java File Upload Servlet Example </title>
</head>
<body>

<form method="post" action="fileuploadservlet" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="Upload" />
</form>

</body>
</html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.Utente"%>
<!DOCTYPE html>
<html>
<head>
    <title> Java File Upload Servlet Example </title>
</head>
<body>

<% String id_evento = request.getParameter("IdEvento");
    String id_host = null;
    Utente user = (Utente) session.getAttribute("user");
    if(user!=null){
        id_host = user.getId_utente();
    }
    %>

<form method="post" action="fileuploadservlet" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="hidden" name="filePath" value="<%=application.getRealPath("imagetree/")%>" />
    <input type="hidden" name="filehost" value="<%=id_host%>" />
    <input type="hidden" name="fileev" value="<%=id_evento%>" />
    <input type="submit" value="Upload" />
</form>

</body>
</html>
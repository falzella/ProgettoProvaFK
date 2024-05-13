<%--
  Created by IntelliJ IDEA.
  User: Big Chungus
  Date: 13/05/2024
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.Utente"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String id_host = "";
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp?messaggio=prima devi accedere!");
    }else{
        Utente user = (Utente) session.getAttribute("user");
        id_host = user.getId_utente();
    }
%>

</body>
</html>

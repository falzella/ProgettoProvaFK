<%--
  Created by IntelliJ IDEA.
  User: Big Chungus
  Date: 13/05/2024
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.Evento"%>
<%@include file="connessione.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id_evento = request.getParameter("IdEvento");
    if(id_evento == null){
        id_evento = "2";
    }
    Evento evento = conn.getEventoFromHost(id_evento);
%>
</body>
</html>

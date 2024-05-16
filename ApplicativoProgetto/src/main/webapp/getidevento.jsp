<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.Evento"%>

<%
    String id_evento = request.getParameter("IdEvento");
    if(id_evento == null){
        response.sendRedirect("login.jsp?messaggio=prima devi accedere!");
        return;
    }
%>

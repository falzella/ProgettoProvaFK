<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.Utente"%>

<%
    String id_host = "";
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp?messaggio=prima devi accedere!");
        return;
    }else{
        Utente user = (Utente) session.getAttribute("user");
        id_host = user.getId_utente();
    }
%>
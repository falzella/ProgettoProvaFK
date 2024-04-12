<%--
  Created by IntelliJ IDEA.
  User: falz
  Date: 4/12/24
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ page import="javaDB.Evento"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>I Tuoi Eventi</title>
</head>
<body>
<h1>Lista Tuoi Eventi</h1>



<%
    String id_host = "";
    if(session.getAttribute("idUtente")==null){
        id_host = "2";
    }else{
        id_host = session.getAttribute("idUtente").toString();
    }
    ArrayList<Evento> eventoList = conn.getEventList(id_host);

    for (Evento evento : eventoList) {
%>
<a href="dettaglievento.jsp?IdEvento=<%= "1" %>"><%= evento.getNome() %></a>
<br>
<% } %>
<br>
<a href="homepage.jsp">Torna Indietro</a>
</body>
</html>

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
<%@ page import="javaDB.Utente"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Richieste</title>
</head>
<body>
<h1>Lista Richieste</h1>



<%
    String id_host = "";
    if(session.getAttribute("user")==null){
        id_host = "2";
    }else{
        Utente user = (Utente) session.getAttribute("user");
        id_host = user.getId_utente();
    }
    ArrayList<Utente> richiesteList = conn.getRichieste(id_host);

    for (Utente utente : richiesteList) {
%>
<a href="dettagliutente.jsp?IdEvento=<%= utente.getUsername() %>"><%= utente.getUsername() %></a>
<br>
<% }%>

<br>
<a href="homepage.jsp">Torna Indietro</a>
</body>
</html>

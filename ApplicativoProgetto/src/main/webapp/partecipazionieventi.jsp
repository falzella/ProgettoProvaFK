<%--
  Created by IntelliJ IDEA.
  User: falz
  Date: 4/12/24
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ page import="javaDB.Evento"%>
<%@ page import="java.sql.SQLException" %>
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
    if(session.getAttribute("user")==null){
        id_host = "2";
    }else{
        Utente user = (Utente) session.getAttribute("user");
        id_host = user.getId_utente();
    }
    ArrayList<Evento> eventoList = null;
    try {
        eventoList = conn.getPartecipazioniList(id_host);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    if(eventoList.isEmpty()){%>
        Non partecipi a nessun evento!
    <%}%>

    <%for (Evento evento : eventoList) {
%>
<a href="dettaglievento.jsp?IdEvento=<%= evento.getId_evento() %>"><%= evento.getNome() %></a>
<br>
<% } %>
<br>
<a href="homepage.jsp">Torna Indietro</a>
</body>
</html>

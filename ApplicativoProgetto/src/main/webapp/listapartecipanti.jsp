<%--
  Created by IntelliJ IDEA.
  User: Big Chungus
  Date: 13/05/2024
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="getidevento.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ page import="javaDB.Evento"%>
<%@ page import="javaDB.Utente"%>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <title>Lista Partecipanti</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body>
<%ArrayList<Utente> partecipazioniList = null;
    try {
        partecipazioniList = conn.getListaPartecipanti(id_evento, id_host);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }%>
<%for (Utente utente : partecipazioniList) { %>
<div class="navigation-element" onclick="RedirectToDettagliUtente('<%=utente.getUsername()%>')"><%=utente.getUsername()%></div>
<%}%>
</body>
</html>

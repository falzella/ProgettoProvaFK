<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>

<%
    try{
        String id_evento = request.getParameter("id_evento");
        String esito = request.getParameter("esito");
        if(conn.eseguiInvito(id_host, id_evento, esito)) {
            response.sendRedirect("inviti.jsp?esitoInv=" + true + "&scelta=" + esito);
        } else {
            response.sendRedirect("inviti.jsp?esitoInv=" + false + "&scelta=" + esito);
        }
    } catch(Exception e) {

    }

%>

<html>
<head>
    <title>Invito</title>
</head>
<body>

</body>
</html>

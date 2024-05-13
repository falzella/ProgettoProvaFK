<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>

<%
    try{
        String id_friend = request.getParameter("id_friend");
        String esito = request.getParameter("esito");
        if(conn.eseguiRichiesta(id_host, id_friend, esito)) {
            response.sendRedirect("richieste.jsp?esitoReq=" + true + "&scelta=" + esito);
        } else {
            response.sendRedirect("richieste.jsp?esitoReq=" + false + "&scelta=" + esito);
        }
    } catch(Exception e) {

    }

%>

<html>
<head>
    <title>Richiesta Di Amicizia</title>
</head>
<body>

</body>
</html>

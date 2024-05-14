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
<<<<<<< Updated upstream
        if(conn.mandarichiesta(id_host, id_friend)) {
            response.sendRedirect("dettagliutente.jsp?friendReq=" + true);
=======
        if(db.mandarichiesta(id_host, id_friend)) {
            response.sendRedirect("dettagliutente.jsp?friendReq=" + true + "&userFriend=" + );
>>>>>>> Stashed changes
        } else {
            response.sendRedirect("dettagliutente.jsp?friendReq=" + false);
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

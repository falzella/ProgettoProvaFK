<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.ClassiDB"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>

<%
    String id_host = "";
    if(session.getAttribute("user")==null){
        id_host = "3";
    }else{
        Utente user = (Utente) session.getAttribute("user");
        id_host = user.getId_utente();
    }

    try{
        ClassiDB db = new ClassiDB();
        String id_friend = request.getParameter("id_friend");
        String esito = request.getParameter("esito");
        if(db.eseguiRichiesta(id_host, id_friend, esito)) {
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

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
        String idevento = request.getParameter("idEvento");
        if(db.partecipaEventoPubblico(id_host, idevento)) {
            response.sendRedirect("dettaglievento.jsp?partecipazione=" + true + "&IdEvento=" + idevento);
        } else {
            response.sendRedirect("dettaglievento.jsp?partecipazione=" + false+ "&IdEvento=" + idevento);
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

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
        if(db.mandarichiesta(id_host, id_friend)) {
            response.sendRedirect("dettagliutente.jsp?friendReq=" + true);
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

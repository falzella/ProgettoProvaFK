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
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
    <script src="javascript/script.js" type="text/javascript"></script>
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
<a href="richieste.jsp?UserFriend=<%= utente.getUsername() %>"><%= utente.getUsername() %></a>
<div class="navigation-element" onclick="eseguiRichiesta('<%=utente.getId_utente()%>', true)">Accetta</div>
<div class="navigation-element" onclick="eseguiRichiesta('<%=utente.getId_utente()%>', false)">Rifiuta</div>
<br>
<% }%>

<%
    boolean esitoReq = request.getParameter("esitoReq") != null;
    if(esitoReq){
        String scelta = request.getParameter("scelta");
        if(scelta.equals("true")){
%>

<script>
    alert("Richiesta Accettata")
</script>
        <%}else{
            
        %>
<script>
    alert("Richiesta Rifiutata")
</script> 
        <%}%>
%>
<script>
    alert("Richiesta inviata")
    RedirectTo("richieste.jsp")
</script>
<%}%>

<br>
<a href="homepage.jsp">Torna Indietro</a>
</body>
</html>

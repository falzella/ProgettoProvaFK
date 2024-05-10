<%--
  Created by IntelliJ IDEA.
  User: falz
  Date: 4/12/24
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="connessione.jsp"%>
<%@ page import="javaDB.Utente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Dettaglio Utente</title>
</head>
<body>
<h1>Dettaglio Utente</h1>

<%
  String id_host = "";
  if(session.getAttribute("user")==null){
    id_host = "2";
  }else{
    Utente user = (Utente) session.getAttribute("user");
    id_host = user.getId_utente();
  }
%>

<%
  String userFriend = request.getParameter("UserFriend");
  if(userFriend == null){
    userFriend = "falz";
  }
  Utente friend = conn.getUtenteFromUsername(userFriend);
%>

Nome: <%=friend.getNome()%><br>
Cognome: <%=friend.getCognome()%><br>
Mail: <%=friend.getMail()%><br>

<button onclick="inviaRichiesta()">Richiedi amicizia</button>

<script>
  function inviaRichiesta() {
    // Esegui qui la logica per inviare la richiesta di amicizia
    <% if(conn.mandarichiesta(id_host, friend.getId_utente())){%>
      alert("Richiesta di amicizia inviata!");
    <%}else{ %>
    alert("Errore durante richiesta!");
    <%} %>

  }
</script>

<a href="homepage.jsp">Torna Indietro</a>

</body>
</html>

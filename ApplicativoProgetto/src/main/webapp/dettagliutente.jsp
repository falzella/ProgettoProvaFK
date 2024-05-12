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
  <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
  <script src="javascript/script.js" type="text/javascript"></script>
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

<% if(!conn.checkAmicizia(id_host, friend.getId_utente())){%>
      <div class="navigation-element" onclick="inviaRichiesta('<%=friend.getId_utente()%>')">Richiedi amicizia</div>
<%}%>

<%
  boolean friendReq = request.getParameter("friendReq") != null;
  if(friendReq){%>
    <script>
      alert("Richiesta inviata")
      RedirectTo("dettagliutente.jsp?UserFriend=<%=friend.getUsername()%>")
    </script>
  <%}%>

<a href="homepage.jsp">Torna Indietro</a>

</body>
</html>

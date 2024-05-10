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

  String userFriend = request.getParameter("UserFriend");
  if(userFriend == null){
    userFriend = "falz";
  }
  Utente friend = conn.getUtenteFromUsername(userFriend);
%>

Nome: <%=friend.getNome()%><br>
Cognome: <%=friend.getCognome()%><br>
Mail: <%=friend.getMail()%><br>


<a href="homepage.jsp">Torna Indietro</a>

</body>
</html>

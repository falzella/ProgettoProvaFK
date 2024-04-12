<%--
  Created by IntelliJ IDEA.
  User: falz
  Date: 4/12/24
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="connessione.jsp"%>
<%@ page import="javaDB.Evento"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dettaglio Evento</title>
</head>
<body>
<h1>Dettaglio Evento</h1>

<%

    String id_evento = request.getParameter("IdEvento");
    Evento evento = conn.getEventoFromHost(id_evento);
%>

Nome: <%=evento.getNome()%><br>
Luogo: <%=evento.getLuogo()%><br>
Indirizzo: <%=evento.getIndirizzo()%><br>
Città: <%=evento.getCitta()%><br>
Data: <%=evento.getData()%><br>
Ora: <%=evento.getOra()%><br>
Informazioni sul luogo: <%=evento.getInformazioniLuogo()%><br>
Descrizione: <%=evento.getDescrizione()%><br>
Tipo: <%=evento.getTipo()%><br>
ID Host: <%=evento.getIdHost()%><br>

<a href="eventicreati.jsp">Torna Indietro</a>

</body>
</html>

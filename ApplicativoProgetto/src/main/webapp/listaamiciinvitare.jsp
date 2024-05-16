<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="getidevento.jsp"%>
<%@include file="HTMLelements.jsp"%>
<%@page import="java.util.*"%>
<%@ page import="javaDB.Evento"%>
<%@ page import="javaDB.Utente"%>
<%@ page import="java.sql.SQLException" %>


<%
  Evento evento = conn.getEventoFromHost(id_evento);
  ArrayList<Utente> amicidainvitareList = null;
  try {
    amicidainvitareList = conn.GetFriendFeed(id_host);
  } catch (SQLException e) {
    throw new RuntimeException(e);
  }
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>visualizza utente</title>
  <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
  <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
  <script src="javascript/script.js" type="text/javascript"></script>
</head>

<body class="homepage-body">
<div class="homepage-flow">
  <%for (Utente utente : amicidainvitareList) { %>
  <div class="ul-user-block">
    <div class="ul-user-container">
      <div class="ul-profilepic-space">
        <div class="ul-profilepic" onclick="redirectToDettaglio('<%= utente.getId_utente() %>')">
          <%
            String imagePath = "imagetree/profilepic/" + utente.getId_utente() + ".png"; // Percorso dell'immagine desiderata
            java.io.File imgFile = new java.io.File(application.getRealPath("/") + imagePath);

            if (imgFile.exists()) {
          %>
          <img src="<%= imagePath %>" alt="i">
          <%
          } else {
          %>
          <img src="imagetree/profilepic/default.png" alt="i">
          <%
            }
          %>
        </div>
      </div>
      <div class="ul-username-space">
        <%=utente.getUsername()%>
      </div>
      <div class="ul-buttons-space">
        <%if(conn.checkInvito(utente.getId_utente(), evento.getId_evento())){
        %>
          <div class="evd-button" >Amico Invitato!</div>
        <%}else{
          
          %>
        <div class="evd-button" onclick="inviaInvito('<%=evento.getId_evento()%>', '<%=utente.getId_utente()%>')">Invita</div>
        <%}%>
      </div>
    </div>
  </div>
  <br>


  <%
    boolean invito = request.getParameter("invito") != null;
    if(invito){
      String scelta = request.getParameter("scelta");
      if(scelta.equals("true")){
  %>

  <script>
    alert("Invito Mandato")
  </script>
  <%}else{

  %>
  <script>
    alert("Invito Non Mandato")
  </script>
  <%}%>
  <%}%>
  
  
  <%}%>
</div>
</body>
</html>

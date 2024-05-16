<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@ page import="javaDB.Evento"%>
<%@ page import="javaDB.Utente"%>
<%@ page import="java.sql.SQLException" %>


<%

    ArrayList<Evento> invitiList = null;
    try {
        invitiList = conn.getInviti(id_host);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }%>

<html>
<head>
    <meta charset="UTF-8">
    <title>visualizza inviti</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>

<body class="homepage-body">

<div class="homepage-flow">
    <%for (Evento evento : invitiList) { %>
    <div class="ul-user-block">
        <div class="ul-user-container">
            <div class="ul-profilepic-space">
                <div class="evf-profilepic" onclick="RedirectToDettagliUtente('<%= conn.GetUtenteFromId(Integer.parseInt(evento.getIdHost())).getUsername() %>')">
                    <%
                        String imagePath = "imagetree/profilepic/" + evento.getIdHost() + ".png"; // Percorso dell'immagine desiderata
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
                <%=evento.getNome()%>
            </div>
            <div class="ul-buttons-space">
                <div class="il-button" onclick="redirectToDettaglio('<%=evento.getId_evento()%>')">dettagli</div>
                <div class="il-button" onclick="eseguiInvito('<%=evento.getId_evento()%>', true)">✔</div>
                <div class="il-button" onclick="eseguiInvito('<%=evento.getId_evento()%>', false)">X</div>
            </div>
        </div>
    </div>
    <br>
    <%}%>
</div>


<%
    boolean esitoInv = request.getParameter("esitoInv") != null;
    if(esitoInv){
        String scelta = request.getParameter("scelta");
        if(scelta.equals("true")){
%>

<script>
    alert("Invito Accettato")
</script>
<%}else{

%>
<script>
    alert("Invito Rifiutato")
</script>
<%}%>
<%}%>


</body>
</html>


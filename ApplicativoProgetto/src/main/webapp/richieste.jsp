<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@ page import="javaDB.Utente"%>
<%@ page import="java.sql.SQLException" %>


<%

    ArrayList<Utente> richiesteList = null;
    try {
        richiesteList = conn.getRichieste(id_host);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }%>

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
    <%for (Utente utente : richiesteList) { %>
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
                <div class="ul-button" onclick="RedirectToDettagliUtente('<%=utente.getUsername()%>')">dettagli</div>
                <div class="ul-button" onclick="eseguiRichiesta('<%=utente.getId_utente()%>', true)">✔</div>
                <div class="ul-button" onclick="eseguiRichiesta('<%=utente.getId_utente()%>', false)">X</div>
            </div>
        </div>
    </div>
    <br>
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
    <%}%>
    <%}%>
</div>
</body>
</html>


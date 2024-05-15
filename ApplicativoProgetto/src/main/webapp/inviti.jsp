<%--
  Created by IntelliJ IDEA.
  User: Big Chungus
  Date: 13/05/2024
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="getidhost.jsp"%>
<%@include file="connessione.jsp"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
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
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<header>
    <div class="hcenter-div">
        <div class="logo-space" onclick="RedirectTo('homepage.jsp')">
            <div class="vcenter-div">
                <img src="images/quello_bello_cropped.svg" height="65px" class="img-round">
            </div>
        </div>

        <div class="search-space">
            <div class="search-box-new">
                <input type="text" placeholder="search in KAMI!">
                <div class="search-box-new-img-container">
                    <img src="images/icons/cancel-icon.png" height="15px" width="15px">
                    <span style="min-width: 5px"></span>
                    <img src="images/icons/search-icon.png" height="17px" width="17px">
                </div>
            </div>
        </div>

        <div class="profile-info-space">
            <img src="images/icons/notifies.png" height="30px" width="30px">
            <div class="space"></div>
            <img src="images/icons/settings.png" height="30px" width="30px">
            <div class="space"></div>
            <!-- <div class="profile-picture" onclick="RedirectToDettagliUtente('((Utente) session.getAttribute("user")).getUsername()%>')" -->
            <div class="profile-picture" onclick=RedirectToDettagliUtente('<%=conn.GetUtenteFromId(Integer.parseInt(id_host)).getUsername()%>')>
                <%
                    String imagePfp = "imagetree/profilepic/" + id_host + ".png";
                    java.io.File imageFilePfp = new java.io.File(application.getRealPath("/") + imagePfp);

                    if (imageFilePfp.exists()) {
                %>
                <img src="<%= imagePfp %>" alt="i" width="50" height="50">
                <%
                } else {
                %>
                <img src="imagetree/profilepic/default.png" alt="i" width="50" height="50">
                <%
                    }
                %>
            </div>
        </div>
    </div>
</header>

<body class="homepage-body">
<div>
    <div class="sidebar">
        <div class="navigation-contents">
            <div class="navigation-element" onclick="RedirectTo('homepage.jsp')">homepage</div>
            <div class="navigation-element" onclick="RedirectTo('creaevento2.jsp')">nuovo evento</div>
            <div class="navigation-element" onclick="RedirectTo('eventicreati.jsp')">i tuoi eventi</div>
            <div class="navigation-element" onclick="RedirectTo('partecipazionieventi.jsp')">partecipazioni</div>
            <div class="navigation-element" onclick="RedirectTo('richieste.jsp')">richieste amicizia</div>
            <div class="navigation-element" onclick="RedirectTo('inviti.jsp')">inviti ricevuti</div>
        </div>
    </div>

    <div class="sidebar-right">
        <div class="navigation-contents">
            <div class="navigation-header">i tuoi amici</div>
            <%ArrayList<Utente> feedUser = null;
                try {
                    feedUser = conn.GetFriendFeed(id_host);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }%>
            <%for (Utente utente : feedUser) { %>
            <div class="navigation-element" onclick="RedirectToDettagliUtente('<%=utente.getUsername()%>')"><%=utente.getUsername()%></div>
            <%}%>
            <div class="navigation-header">consigliati</div>
            <%ArrayList<Utente> feedSuggest = null;
                try {
                    feedSuggest = conn.GetSuggestFeed(id_host);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }%>
            <%for (Utente utente : feedSuggest) { %>
            <div class="navigation-element" onclick="RedirectToDettagliUtente('<%=utente.getUsername()%>')"><%=utente.getUsername()%></div>
            <%}%>
        </div>
    </div>
</div>

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
                <div class="evd-button" onclick="redirectToDettaglio('<%=evento.getId_evento()%>')">dettagli</div>
                <div class="evd-button" onclick="eseguiInvito('<%=evento.getId_evento()%>', true)">✔</div>
                <div class="evd-button" onclick="eseguiInvito('<%=evento.getId_evento()%>', false)">X</div>
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


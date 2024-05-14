<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page import="javaDB.Evento"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>


<%
    ArrayList<Evento> eventoList = null;
    try {
        eventoList = conn.getEventList(id_host);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    if(eventoList.isEmpty()){%>
    Non hai creato nessun evento!
<%}else{%>


<html>
<head>
    <title>homepage</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">
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
            <div class="profile-picture" onclick=RedirectToDettagliUtente('<%=conn.GetUtenteFromId(Integer.parseInt(id_host)).getUsername()%>')>
                <%
                    String imagePfp = "imagetree/profilepic/" + id_host + ".png";
                    java.io.File imageFilePfp = new java.io.File(application.getRealPath("/") + imagePfp);

                    if (imageFilePfp.exists()) {
                %>
                <img src="<%= imagePfp %>" alt="i">
                <%
                } else {
                %>
                <img src="imagetree/profilepic/default.png" alt="i">
                <%
                    }
                %>
            </div>
        </div>
    </div>
</header>

<div>
    <div class="sidebar">
        <div class="navigation-contents">
            <div class="navigation-element" onclick="RedirectTo('homepage.jsp')">homepage</div>
            <div class="navigation-element" onclick="RedirectTo('provacreaevento.jsp')">nuovo evento</div>
            <div class="navigation-element" onclick="RedirectTo('eventicreati.jsp')">i tuoi eventi</div>
            <div class="navigation-element" onclick="RedirectTo('partecipazionieventi.jsp')">partecipazioni</div>
            <div class="navigation-element" onclick="RedirectTo('richieste.jsp')">richieste amicizia</div>
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
            <div class="navigation-element"><%=utente.getUsername()%></div>
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
    <%for (Evento evento : eventoList) { %>
    <div class="event-block" onclick="redirectToDettaglio('<%= evento.getId_evento() %>')">
        <div class="evf-event-details">
            <div class="evf-event-identity-ex">
                <div class="evf-name">
                    <% if(evento.getTipo().equals("privato")){%>
                    <img src="images/icons/event-private.png" height="20px" width="20px">
                    <%}else{%>
                    <img src="images/icons/event.png" height="20px" width="20px">
                    <%}%>
                    <%=evento.getNome()%>
                </div>
                <div class="evf-host">
                    <% if(evento.getTipo().equals("privato")){%>
                    <img src="images/icons/private.png" height="20px" width="20px">
                    privato
                    <%}else{%>
                    <img src="images/icons/public.png" height="20px" width="20px">
                    pubblico
                    <%}%>
                </div>
            </div>
            <div class="evf-event-location">
                <div class="evf-location-detail">
                    <img src="images/icons/calendar.png" height="15px" width="15px">
                    <%=evento.getData()%>
                </div>
                <div class="evf-location-detail">
                    <img src="images/icons/clock.png" height="15px" width="15px">
                    <%=evento.getOra()%>
                </div>
                <div class="evf-location-detail-pin">
                    <img src="images/icons/location-pin.png" height="15px" width="15px">
                    <%=evento.getLuogo()%>
                </div>
            </div>
            <div class="evf-description"><%=evento.getDescrizione()%></div>
        </div>
        <div class="evf-photobox">img</div>
    </div>
    <%}%>
</div>
</body>
</html>
<%}%>
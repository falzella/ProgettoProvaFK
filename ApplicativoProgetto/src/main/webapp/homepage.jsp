<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.ClassiDB"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>

<%
    ArrayList<EventoFeed> feed = conn.GetEventFeed(id_host);
%>

<html>
<head>
    <title>homepage</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">
    <header>
        <div class="hcenter-div">
            <div class="logo-space">
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
            <div class="navigation-options-box">
                <div id="darkmode-switch" class="navigation-switch" onclick="switchMode()">darkmode</div>
                <div class="navigation-element" onclick="RedirectTo('login.jsp')">logout</div>
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
        <%for (EventoFeed eventoFeed : feed) { %>
            <div class="event-block" onclick="redirectToDettaglio('<%= eventoFeed.GetEvento().getId_evento() %>')">
                <div class="evf-event-details">
                    <div class="evf-profilepic-space">
                        <div class="evf-profilepic" onclick=RedirectToDettagliUtente('<%=eventoFeed.GetHost()%>')>
                            <%
                                String imagePath = "imagetree/profilepic/" + conn.getUtenteFromUsername(eventoFeed.GetHost()).getId_utente() + ".png"; // Percorso dell'immagine desiderata
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

                    <div class="evf-event-identity">
                        <div class="evf-host">
                            <img src="images/icons/crown.png" height="20px" width="20px">
                            <%=eventoFeed.GetHost()%>
                        </div>
                        <div class="evf-name">
                            <% if(eventoFeed.GetEvento().getTipo().equals("privato")){%>
                            <img src="images/icons/event-private.png" height="20px" width="20px">
                            <%}else{%>
                            <img src="images/icons/event.png" height="20px" width="20px">
                            <%}%>
                            <%=eventoFeed.GetEvento().getNome()%>
                        </div>
                    </div>
                    <div class="evf-event-location">
                        <div class="evf-location-detail">
                            <img src="images/icons/calendar.png" height="15px" width="15px">
                            <%=eventoFeed.GetEvento().getData()%>
                        </div>
                        <div class="evf-location-detail">
                            <img src="images/icons/clock.png" height="15px" width="15px">
                            <%=eventoFeed.GetEvento().getOra()%>
                        </div>
                        <div class="evf-location-detail-pin">
                            <img src="images/icons/location-pin.png" height="15px" width="15px">
                            <%=eventoFeed.GetEvento().getLuogo()%>
                        </div>
                    </div>
                    <div class="evf-description"><%=eventoFeed.GetEvento().getDescrizione()%></div>
                </div>
                <div class="evf-photobox">img</div>
            </div>
        <%}%>
    </div>
</body>
</html>
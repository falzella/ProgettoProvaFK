<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@page import="javaDB.ClassiDB"%>
<%@page import="javaDB.Evento"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dettaglio Evento</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
    <script src="javascript/script.js" type="text/javascript"></script>
</head>

<%
    String id_host = "";
    if(session.getAttribute("user")==null){
        id_host = "3";
    }else{
        Utente user = (Utente) session.getAttribute("user");
        id_host = user.getId_utente();
    }

    ClassiDB db = new ClassiDB();%>

<body class="ev-dettagli-body">
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
            <div class="profile-picture">
                <%
                    String imagePfp = "imagetree/profilepic/" + id_host + ".jpg"; // Percorso dell'immagine desiderata
                    java.io.File imgFilepfp = new java.io.File(application.getRealPath("/") + imagePfp);

                    if (imgFilepfp.exists()) {
                %>
                <img src="<%= imagePfp %>" alt="i" width="50" height="50">
                <%
                } else {
                %>
                <img src="imagetree/profilepic/Default_pfp.jpg" alt="i" width="50" height="50">
                <%
                    }
                %>
            </div>
        </div>
    </div>
</header>

<div class="homepage-flow">
    <div class="event-details-block">
        <div class="evd-container">
            <%

                String id_evento = request.getParameter("IdEvento");
                if(id_evento == null){
                    id_evento = "2";
                }
                Evento evento = conn.getEventoFromHost(id_evento);
            %>

            <div class="evd-identity-block">
                <div class="evd-profilepic-space">
                    <div class="evd-profilepic">
                        <%
                            String imagePath = "imagetree/profilepic/" + evento.getIdHost() + ".jpg"; // Percorso dell'immagine desiderata
                            java.io.File imgFile = new java.io.File(application.getRealPath("/") + imagePath);

                            if (imgFile.exists()) {
                        %>
                        <img src="<%= imagePath %>" alt="i" width="70" height="70">
                        <%
                        } else {
                        %>
                        <img src="profilepic/Default_pfp.jpg" alt="i" width="50" height="50">
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="evd-event-identity">
                    <div class="evd-host">
                        <img src="images/icons/crown.png" height="30px" width="30px">
                        hostname here
                    </div>
                    <div class="evd-horizontal-line"></div>
                    <div class="evd-name">
                        <% if(evento.getTipo().equals("privato")){%>
                        <img src="images/icons/event-private.png" height="30px" width="30px">
                        <%}else{%>
                        <img src="images/icons/event.png" height="30px" width="30px">
                        <%}%>
                        <%=evento.getNome()%>
                    </div>
                </div>
            </div>
            <div class="evd-location-block">
                <div class="evd-event-location">
                    <div class="evd-location-detail">
                        <img src="images/icons/calendar.png">
                        <%=evento.getData()%>
                    </div>
                    <div class="evd-location-detail">
                        <img src="images/icons/clock.png">
                        <%=evento.getOra()%>
                    </div>
                    <div class="evd-location-detail">
                        <img src="images/icons/location-pin.png">
                        <%=evento.getLuogo()%>
                    </div>
                    <div class="evd-location-detail">
                        <img src="images/icons/address-pin.png">
                        <%=evento.getIndirizzo()%>
                    </div>
                    <div class="evd-location-detail">
                        <img src="images/icons/city.png">
                        <%=evento.getCitta()%>
                    </div>
                </div>
                <div class="evd-maps-api-container">
                    <div class="evd-maps-api">maps api</div>
                </div>
                <div class="evd-location-info">
                    <%=evento.getInformazioniLuogo()%>
                </div>
            </div>
            <div class="evd-description-block">
                <div class="evd-description"><%=evento.getDescrizione()%></div>
            </div>
            <div class="evd-photobox-block">
                <div class="evd-photobox">
                    <div class="evd-photobox-img">img</div>
                </div>
            </div>
            <div class="evd-buttons-block">
                <div class="evd-buttons">
                    <div class="evd-button" onclick="RedirectTo('eventicreati.jsp')">eventi creati</div>
                    <div class="evd-button">partecipa</div>
                    <div class="evd-button">modifica</div>
                    <!-- se modifica, invia a modifica evento (simile a creaevento), dove si controlla utenza per ID evento -->
                </div>
            </div>
        </div>
    </div>
</div>

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

        <%
                ArrayList<Utente> feedUser = null;
                try {
                    feedUser = db.GetFriendFeed(id_host);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }%>
            <%for (Utente utente : feedUser) { %>
            <div class="navigation-element" onclick="RedirectToDettagliUtente('<%=utente.getUsername()%>')"><%=utente.getUsername()%></div>
            <%}%>
            <div class="navigation-header">consigliati</div>
                <%ArrayList<Utente> feedSuggest = null;
                    try {
                        feedSuggest = db.GetSuggestFeed(id_host);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }%>
                <%for (Utente utente : feedSuggest) { %>
                <div class="navigation-element" onclick="RedirectToDettagliUtente('<%=utente.getUsername()%>')"><%=utente.getUsername()%></div>
            <%}%>
        </div>
    </div>
</div>

</body>
</html>

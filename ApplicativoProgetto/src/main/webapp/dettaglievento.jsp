<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@page import="javaDB.ClassiDB"%>
<%@ page import="javaDB.Evento"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dettaglio Evento</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
</head>
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
            <div class="profile-picture"></div>
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

            <div class="evd-event-details">
                <div class="evd-profilepic-space">
                    <div class="evd-profilepic">pic</div>
                </div>
                <div class="evd-event-identity">
                    <div class="evd-host">
                        <img src="images/icons/crown.png" height="20px" width="20px">
                        hostname here
                    </div>
                    <div class="evd-name">
                        <img src="images/icons/event.png" height="20px" width="20px">
                        <%=evento.getNome()%>
                    </div>
                </div>
                <div class="evd-event-location">
                    <div class="evd-location-detail">
                        <img src="images/icons/calendar.png" height="15px" width="15px">
                        <%=evento.getData()%>
                    </div>
                    <div class="evd-location-detail">
                        <img src="images/icons/clock.png" height="15px" width="15px">
                        <%=evento.getOra()%>
                    </div>
                    <div class="evd-location-detail">
                        <img src="images/icons/location-pin.png" height="15px" width="15px">
                        <%=evento.getLuogo()%>
                    </div>
                </div>
                <div class="evf-description"><%=evento.getDescrizione()%></div>
            </div>
            <div class="evf-photobox">img</div>
            <a href="eventicreati.jsp">Torna Indietro</a>
        </div>
    </div>
</div>

<div>
    <div class="sidebar">
        <div class="navigation-contents">
            <div class="navigation-element">homepage</div>
            <div class="navigation-element">nuovo evento</div>
            <div class="navigation-element">i tuoi eventi</div>
            <div class="navigation-element">partecipazioni</div>
            <div class="navigation-element">richieste amicizia</div>
        </div>
    </div>

    <div class="sidebar-right">
        <div class="navigation-contents">
            <div class="navigation-header">i tuoi amici</div>
            <%
                String id_host = "";
                if(session.getAttribute("user")==null){
                    id_host = "3";
                }else{
                    Utente user = (Utente) session.getAttribute("user");
                    id_host = user.getId_utente();
                }

                ClassiDB db = new ClassiDB();
                ArrayList<Utente> feedUser = null;
                try {
                    feedUser = db.GetFriendFeed(id_host);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }%>
            <%for (Utente utente : feedUser) { %>
            <div class="navigation-element"><%=utente.getUsername()%></div>
            <%}%>
            <div class="navigation-header">consigliati</div>
        </div>
    </div>
</div>

</body>
</html>

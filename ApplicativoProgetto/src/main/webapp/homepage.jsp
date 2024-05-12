<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="javaDB.ClassiDB"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>

<%
    String id_host = "";
    if(session.getAttribute("user")==null){
        id_host = "3";
    }else{
        Utente user = (Utente) session.getAttribute("user");
        id_host = user.getId_utente();
    }

    ClassiDB db = new ClassiDB();
    ArrayList<EventoFeed> feed = db.GetEventFeed(id_host);
%>

<html>
<head>
    <title>homepage</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
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
                <div class="profile-picture"></div>
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
                        feedUser = db.GetFriendFeed(id_host);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }%>
                <%for (Utente utente : feedUser) { %>
                <div class="navigation-element" onclick="RedirectToDettagliUtente('<%=utente.getUsername()%>')"><%=utente.getUsername()%></div>
                <%}%>
                <div class="navigation-header">consigliati</div>
            </div>
        </div>
    </div>
    <div class="homepage-flow">
        <%for (EventoFeed eventoFeed : feed) { %>
            <!--
            <div class="event-block">
                Nome: <%=eventoFeed.GetEvento().getNome()%><br>
                Luogo: <%=eventoFeed.GetEvento().getLuogo()%><br>
                Indirizzo: <%=eventoFeed.GetEvento().getIndirizzo()%><br>
                Città: <%=eventoFeed.GetEvento().getCitta()%><br>
                Data: <%=eventoFeed.GetEvento().getData()%><br>
                Ora: <%=eventoFeed.GetEvento().getOra()%><br>
                Informazioni sul luogo: <%=eventoFeed.GetEvento().getInformazioniLuogo()%><br>
                Descrizione: <%=eventoFeed.GetEvento().getDescrizione()%><br>
                Tipo: <%=eventoFeed.GetEvento().getTipo()%><br>
                ID Host: <%=eventoFeed.GetEvento().getIdHost()%><br>
                Nome Host: <%=eventoFeed.GetHost()%><br>
            </div> -->
            <div class="event-block" onclick="redirectToDettaglio('<%= eventoFeed.GetEvento().getId_evento() %>')">
                <div class="evf-event-details">
                    <div class="evf-profilepic-space">
                        <div class="evf-profilepic">pic</div>
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

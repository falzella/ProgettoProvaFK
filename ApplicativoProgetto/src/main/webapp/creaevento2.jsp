<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.ClassiDB"%>
<%@include file="connessione.jsp"%>
<%@include file="getidhost.jsp"%>
<%@page import="javaDB.EventoFeed"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>


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
    <div class="ce-block">
        <div class="ce-input-section">
            <form action="registraEvento.jsp" method="POST" class="ce-form">
                <div class="ce-title-block">CREA IL NUOVO EVENTO!</div>
                <div class="ce-column-division-block">
                    <div class="ce-half-section">
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/event.png">
                            </div>
                            <input type="text" name="nome" class="ce-input-box" placeholder="Nome" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/location-pin.png">
                            </div>
                            <input type="text" name="luogo" class="ce-input-box" placeholder="Luogo" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/address-pin.png">
                            </div>
                            <input type="text" name="indirizzo" class="ce-input-box" placeholder="Indirizzo" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/city.png">
                            </div>
                            <input type="text" name="citta" class="ce-input-box" placeholder="Città" required>
                        </div>
                        <div id="NewEventDiv" class="ce-input">
                            <div class="ce-input-label">
                                <img id="NewEventImg" src="images/icons/private.png">
                            </div>
                            <input id="NewEventInput" type="text" name="tipo" value="privato" class="ce-input-box ce-checkbox" placeholder="Tipo" readonly required>
                        </div>
                    </div>
                    <div class="ce-half-section">
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/calendar.png">
                            </div>
                            <input type="date" name="data" class="ce-input-box" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/clock.png">
                            </div>
                            <input type="time" value="00:00" name="ora" class="ce-input-box" required>
                        </div>
                        <div class="ce-input ce-textarea-label">
                            <div class="ce-input-label">
                                <img src="images/icons/location-info.png">
                            </div>
                            <textarea name="informazioni_luogo" class="ce-input-box ce-textarea" placeholder="Informazioni Luogo" required></textarea>
                        </div>
                        <div class="ce-input ce-textarea-label">
                            <div class="ce-input-label">
                                <img src="images/icons/info.png">
                            </div>
                            <textarea name="descrizione" class="ce-input-box ce-textarea" placeholder="Descrizione" required></textarea>
                        </div>
                    </div>
                </div>
                <div class="ce-button-section">
                    <input type="submit" value="CREA EVENTO" class="evd-button">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function ChangeEventType() {
        var img = document.getElementById("NewEventImg");
        var input = document.getElementById("NewEventInput");
        if(img.src.endsWith("private.png")) {
            img.src = img.src.replace("private.png", "public.png");
            input.value = " ";
        }
        else {
            img.src = img.src.replace("public.png", "private.png");
            input.value = "privato";
        }
    }
    var NewEventDiv = document.getElementById("NewEventDiv");
    NewEventDiv.addEventListener("click", ChangeEventType);
</script>
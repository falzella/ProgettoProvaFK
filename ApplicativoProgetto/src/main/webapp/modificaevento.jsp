<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@include file="getidevento.jsp"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>


<%
    Evento evento = conn.getEventoFromHost(id_evento);
    if(!id_host.equals(evento.getIdHost()))
    {
        response.sendRedirect("homepage.jsp?messaggio=Non puoi modificare un evento che non hai creato!");
    }
%>

<html>
<head>
    <title>homepage</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">
<div class="homepage-flow">
    <div class="ce-block">
        <div class="ce-input-section">
            <form action="registramodificheevento.jsp" method="POST" class="ce-form">
                <div class="ce-title-block">MODIFICA IL TUO EVENTO!</div>
                <div class="ce-column-division-block">
                    <div class="ce-half-section">
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/event.png">
                            </div>
                            <input type="text" name="nome" value="<%=evento.getNome()%>" class="ce-input-box" placeholder="Nome" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/location-pin.png">
                            </div>
                            <input type="text" name="luogo" value="<%=evento.getLuogo()%>" class="ce-input-box" placeholder="Luogo" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/address-pin.png">
                            </div>
                            <input type="text" name="indirizzo" value="<%=evento.getIndirizzo()%>" class="ce-input-box" placeholder="Indirizzo" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/city.png">
                            </div>
                            <input type="text" name="citta" value="<%=evento.getCitta()%>" class="ce-input-box" placeholder="Città" required>
                        </div>
                        <div id="NewEventDiv" class="ce-input">
                            <div class="ce-input-label">
                                <img id="NewEventImg" src="images/icons/private.png">
                            </div>
                            <input id="NewEventInput" type="text" name="tipo" value="<%=evento.getTipo()%>" class="ce-input-box ce-checkbox" placeholder="Tipo" readonly required>
                        </div>
                    </div>
                    <div class="ce-half-section">
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/calendar.png">
                            </div>
                            <input type="date" name="data" value="<%=evento.getData()%>" class="ce-input-box" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/clock.png">
                            </div>
                            <input type="time" value="<%=evento.getOra()%>" name="ora" class="ce-input-box" required>
                        </div>
                        <div class="ce-input ce-textarea-label">
                            <div class="ce-input-label">
                                <img src="images/icons/location-info.png">
                            </div>
                            <textarea name="informazioni_luogo" class="ce-input-box ce-textarea" placeholder="Informazioni Luogo" required><%=evento.getInformazioniLuogo()%></textarea>
                        </div>
                        <div class="ce-input ce-textarea-label">
                            <div class="ce-input-label">
                                <img src="images/icons/info.png">
                            </div>
                            <textarea name="descrizione" class="ce-input-box ce-textarea" placeholder="Descrizione" required><%=evento.getDescrizione()%></textarea>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/images.png">
                            </div>
                            <input type="file" name="media" class="ce-input-box" multiple>
                        </div>
                    </div>
                </div>
                <div class="ce-button-section">
                    <input type="submit" value="MODIFICA EVENTO" class="evd-button">
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
            input.value = "pubblico";
        }
        else {
            img.src = img.src.replace("public.png", "private.png");
            input.value = "privato";
        }
    }
    var NewEventDiv = document.getElementById("NewEventDiv");
    NewEventDiv.addEventListener("click", ChangeEventType);
</script>
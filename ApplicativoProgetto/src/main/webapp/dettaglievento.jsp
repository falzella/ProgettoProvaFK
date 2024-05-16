<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@include file="getidevento.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dettaglio Evento</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
    <script src='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js'></script>
    <link href='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css' rel='stylesheet'/>
    <script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.0/mapbox-gl-geocoder.min.js'></script>
    <link
            rel='stylesheet'
            href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.0/mapbox-gl-geocoder.css'
            type='text/css'
    />
</head>

<%
    Evento evento = conn.getEventoFromHost(id_evento);
    boolean partecipazione = request.getParameter("partecipazione") != null;
    if(partecipazione){%>
<script>
    alert("Adesso partecipi a questo evento")
    RedirectTo("dettaglievento.jsp?IdEvento=<%=evento.getId_evento()%>")
</script>
<%}%>

<body class="ev-dettagli-body">

<div class="homepage-flow">
    <div class="event-details-block">
        <div class="evd-container">

            <div class="evd-identity-block">
                <div class="evd-profilepic-space">
                    <div class="evd-profilepic" onclick=RedirectToDettagliUtente('<%=conn.GetUtenteFromId(Integer.parseInt(evento.getIdHost())).getUsername()%>')>
                        <%
                            String imagehostPfp = "imagetree/profilepic/" + evento.getIdHost() + ".png";
                            java.io.File imagehostFilePfp = new java.io.File(application.getRealPath("/") + imagehostPfp);

                            if (imagehostFilePfp.exists()) {
                        %>
                        <img src="<%= imagehostPfp %>" alt="i" width="50" height="50">
                        <%
                        } else {
                        %>
                        <img src="imagetree/profilepic/default.png" alt="i" width="50" height="50">
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="evd-event-identity">
                    <div class="evd-host">
                        <img src="images/icons/crown.png" height="30px" width="30px">
                        <%=conn.GetUtenteFromId(Integer.parseInt(evento.getIdHost())).getUsername()%>
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
                    <div class="evd-maps-api" id="map"></div>
                    <script>
                        mapboxgl.accessToken = 'pk.eyJ1IjoiZmFsenp6IiwiYSI6ImNsdzZ2enB2aTE5eGYydHJ6cnpnZ2RrZzUifQ.rC62okllepNFI_ilD72vNg';
                        var map = new mapboxgl.Map({
                            container: 'map',
                            style: 'mapbox://styles/mapbox/streets-v11', // puoi scegliere uno stile differente qui
                            center: [0, 0], // Longitudine e latitudine del centro della mappa
                            zoom: 1 // Livello di zoom iniziale
                        });

                        // Ottieni le coordinate dall'indirizzo e dalla città
                        var address = "<%=evento.getIndirizzo()%>, <%=evento.getCitta()%>";
                        fetch('https://api.mapbox.com/geocoding/v5/mapbox.places/' + encodeURIComponent(address) + '.json?access_token=' + mapboxgl.accessToken)
                            .then(response => response.json())
                            .then(data => {
                                var coordinates = data.features[0].center;
                                map.setCenter(coordinates); // Imposta il centro della mappa sulle coordinate ottenute
                                var marker = new mapboxgl.Marker()
                                    .setLngLat(coordinates)
                                    .addTo(map); // Aggiungi il marker alla mappa
                                map.easeTo({ zoom: 15, duration: 4000 }); // Gradualmente imposta lo zoom a 11
                            });
                    </script>

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
                    <%
                        String eventFolderPath ="imagetree/eventspic/" + evento.getId_evento();
                        java.io.File eventFolder = new java.io.File(application.getRealPath("/") + eventFolderPath);

                        if (!eventFolder.exists()) {
                    %>
                    <figure class="card">
                        <img src="imagetree/eventspic/default.png" alt="i">
                    </figure>
                    <%
                    } else {
                        String EventimagePath = eventFolderPath + "/1.png"; // Percorso dell'immagine desiderata
                        java.io.File EventimgFile = new java.io.File(application.getRealPath("/") + EventimagePath);

                        if (EventimgFile.exists()) {
                    %>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <figure class="card">
                        <img src="<%= EventimagePath %>">
                    </figure>
                    <%
                    } else {
                        // Se il file specifico non esiste, mostra un'immagine predefinita
                    %>
                    <img src="imagetree/eventspic/default.png" alt="i" width="400" height="200">
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div class="evd-buttons-block">
                <div class="evd-buttons">
                    <%
                        if(evento.getTipo().equals("pubblico")){
                            if(id_host.equals(evento.getIdHost())){
                    %>
                        <div class="evd-button">modifica</div>
                        <div class="evd-button" onclick="redirectToListaPartecipazione('<%=evento.getId_evento()%>')">visualizza partecipanti</div>
                        <%}else{
                                if(!conn.checkPartecipazione(id_host,evento.getId_evento())){

                        %>
                            <div class="evd-button" onclick="inviaPartecipazione('<%=evento.getId_evento()%>')">partecipa</div>

                            <%}else{

                            %><div class="evd-button">partecipi a questo evento!</div><%}%>

                    <div class="evd-button" onclick="redirectToListaPartecipazione('<%=evento.getId_evento()%>')">visualizza partecipanti</div>
                    <%}%>
                    <%}else{
                            //pulsanti diversi per evento privato
                            // <!-- se modifica, invia a modifica evento (simile a creaevento), dove si controlla utenza per ID evento -->
                        if(id_host.equals(evento.getIdHost())){%>
                            <div class="evd-button">modifica</div>
                            <div class="evd-button" onclick="redirectToListaPartecipazione('<%=evento.getId_evento()%>')">visualizza partecipanti</div>
                        <%}else{
                            if(!conn.checkPartecipazione(id_host,evento.getId_evento())){
                        %>
                        <div class="evd-button" onclick="inviaPartecipazione('<%=evento.getId_evento()%>')">partecipa</div>
                        <%}else{
                            %><div class="evd-button">partecipi a questo evento!</div><%}%>
                            <div class="evd-button" onclick="redirectToListaPartecipazione('<%=evento.getId_evento()%>')">visualizza partecipanti</div>
                        <%}
                    }%>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
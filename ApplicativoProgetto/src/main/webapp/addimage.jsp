<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>

<html>
<head>
    <title>Modifica Profilo</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">


<%
    String id_evento = "null";
    if(request.getParameter("IdEvento")!=null){
        id_evento = request.getParameter("IdEvento");
    }

    if(request.getParameter("messaggio")!=null) {
        String messaggio = request.getParameter("messaggio").toString();
        if (messaggio.equals("Immagine Caricata Correttamente!")) {
            // Ottiene l'URI corrente
            String currentUri = request.getRequestURI();

            // Aggiunge il parametro idEvento=null alla query string
            String newUri = currentUri + "?IdEvento=" + id_evento;

            // Esegue il redirect alla nuova URI
            response.sendRedirect(newUri);

        }
    }
%>


<div class="homepage-flow">
    <div class="ce-block">
        <div class="ce-input-section">
            <form action="fileuploadservlet" method="POST" class="ce-form" enctype="multipart/form-data">
                <div class="ce-title-block">MODIFICA L'IMMAGINE</div>
                <div class="mp-image-container">
                    <div class="mp-profilepic-big">
                        <div class="mu-profilepic-big-img-box">
                            <%
                                if(id_evento.equals("null")){

                                String imagePfpOld = "imagetree/profilepic/" + id_host + ".png";
                                java.io.File imageFilePfpOld = new java.io.File(application.getRealPath("/") + imagePfpOld);

                                if (imageFilePfp.exists()) {
                            %>
                            <img src="<%= imagePfpOld %>" alt="img">
                            <%
                            } else {
                            %>
                            <img src="imagetree/profilepic/default.png" alt="img">
                            <%}
                                }else{
                                String eventFolderPath ="imagetree/eventspic/" + id_evento;
                                java.io.File eventFolder = new java.io.File(application.getRealPath("/") + eventFolderPath);

                                if (!eventFolder.exists()) {
                            %>
                                <img src="imagetree/eventspic/default.png" alt="i">
                            <%
                            } else {
                                String EventimagePath = eventFolderPath + "/1.png"; // Percorso dell'immagine desiderata
                                java.io.File EventimgFile = new java.io.File(application.getRealPath("/") + EventimagePath);

                                if (EventimgFile.exists()) {
                            %>
                                <img src="<%= EventimagePath %>">
                                <%}else {%>
                                    <img src="imagetree/eventspic/default.png" alt="i" width="400" height="200">
                                     <% } %>
                                    <%}%>
                                <%}%>
                        </div>
                    </div>
                    <div class="mp-input-container">
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/images.png">
                            </div>
                            <input type="file" name="file" class="ce-input-box">
                        </div>
                    </div>
                    <input type="hidden" name="filePath" value="<%=application.getRealPath("imagetree/")%>" />
                    <input type="hidden" name="filehost" value="<%=id_host%>" />
                    <input type="hidden" name="fileev" value="<%=id_evento%>" />
                </div>
                <div class="ce-button-section">
                    <input type="submit" value="CARICA IMMAGINE" class="evd-button">
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
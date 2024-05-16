<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@include file="getidevento.jsp"%>


<html>
<head>
    <title>Inserisci Immagine</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">
<div class="homepage-flow">
    <div class="ce-block">
        <div class="ce-input-section">
            <form action="fileuploadservlet" method="POST" class="ce-form" enctype="multipart/form-data">
                <div class="ce-title-block">MODIFICA L'IMMAGINE</div>
                <div class="ce-column-division-block">

                    <%
                        String imagePfpOld = "imagetree/profilepic/" + id_host + ".png";
                        java.io.File imageFilePfpOld = new java.io.File(application.getRealPath("/") + imagePfpOld);

                        if (imageFilePfp.exists()) {
                    %>
                    <img src="<%= imagePfpOld %>" alt="i" width="250" height="250" style="border-radius: 50%">
                    <%
                    } else {
                    %>
                    <img src="imagetree/profilepic/default.png" alt="i" width="250" height="250" style="border-radius: 50%">
                    <%
                        }
                    %>

                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/images.png">
                            </div>
                            <input type="file" name="file" class="ce-input-box">
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
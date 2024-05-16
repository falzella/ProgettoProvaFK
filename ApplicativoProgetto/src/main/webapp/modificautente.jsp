<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>


<%
    String userFriend = request.getParameter("UserFriend");
    Utente friend = null;
    if(userFriend == null){
        response.sendRedirect("homepage.jsp?messaggio=nessun utente selezionato");
        return;
    }else {
        friend = conn.getUtenteFromUsername(userFriend);
        if(friend == null){
            response.sendRedirect("homepage.jsp?messaggio=questo utente non esiste!");
            return;
        }
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>visualizza utente</title>
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css" id="lightmodeCSS">
    <link href="style/stylesheet2-dark.css" rel="stylesheet" type="text/css" id="darkmodeCSS" disabled>
    <script src="javascript/script.js" type="text/javascript"></script>
</head>
<body class="homepage-body">

<div class="homepage-flow">
    <div class="ce-block">
        <div class="ce-input-section">
            <form action="registramodificautente.jsp" method="POST" class="ce-form">
                <div class="ce-title-block">MODIFICA IL TUO PROFILO!</div>
                <div class="ce-column-division-block">
                    <div class="ce-half-section">
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/crown.png">
                            </div>
                            <input type="text" name="username" value="<%=friend.getUsername()%>" class="ce-input-box" placeholder="Nome" readonly>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/id-card.png">
                            </div>
                            <input type="text" name="nome" value="<%=friend.getNome()%>" class="ce-input-box" placeholder="Luogo" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/id-card.png">
                            </div>
                            <input type="text" name="cognome" value="<%=friend.getCognome()%>" class="ce-input-box" placeholder="Indirizzo" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/private.png">
                            </div>
                            <input type="text" name="password" value="<%=friend.getPassword()%>" class="ce-input-box" placeholder="Città" required>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/email.png">
                            </div>
                            <input type="email" name="email" value="<%=friend.getMail()%>" class="ce-input-box" placeholder="Città" required>
                        </div>
                    </div>
                    <div class="ce-half-section">
                        <div class="mu-profilepic-big">
                            <div class="mu-profilepic-big-img-box">
                                <%if (imageFilePfp.exists()) {
                                %>
                                <img src="<%= imagePfp %>" alt="pfp">
                                <%
                                    } else {
                                %>
                                <img src="imagetree/profilepic/default.png" alt="pfp">
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="ce-input">
                            <div class="ce-input-label">
                                <img src="images/icons/cake.png">
                            </div>
                            <input type="date" name="data" value="<%=friend.getData_nascita()%>" class="ce-input-box" required>
                        </div>
                    </div>
                </div>
                <div class="ce-button-section">
                    <input type="submit" value="MODIFICA PROFILO" class="evd-button">
                    <div class="space"></div>
                    <input type="button" value="IMMAGINE PROFILO" class="evd-button" onclick="redirectToAddImage(null)">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

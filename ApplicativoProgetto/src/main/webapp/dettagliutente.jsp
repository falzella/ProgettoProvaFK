<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="HTMLelements.jsp"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException" %>


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

    boolean friendReq = request.getParameter("friendReq") != null;
    if(friendReq){%>
  <script>
    alert("Richiesta inviata")
    RedirectTo("dettagliutente.jsp?UserFriend=<%=friend.getUsername()%>")
  </script>
<%}%>

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
      <div class="event-details-block">
        <div class="evd-container">
          <div class="ud-identity-block">
            <div class="ud-profilepic-space">
              <div class="ud-profilepic">
                <%
                  String profilePic = "imagetree/profilepic/" + friend.getId_utente() + ".png";
                  java.io.File profilePicFile = new java.io.File(application.getRealPath("/") + profilePic);

                  if (profilePicFile.exists()) {
                %>
                <img src="<%= profilePic %>" alt="404" width="50" height="50">
                <%
                } else {
                %>
                <img src="imagetree/profilepic/default.png" alt="i" width="50" height="50">
                <%
                  }
                %>
              </div>
            </div>
            <div class="ud-username-space">
              <%=friend.getUsername()%>
            </div>
          </div>
          <div class="ud-straight-line margin-top-5p"></div>
          <div class="ud-details-block">
            <div class="ud-user-info-space">
              <div class="ud-user-info">
                <img src="images/icons/id-card.png">
                <%=friend.getNome()%><br>
              </div>
              <div class="ud-user-info">
                <img src="images/icons/id-card.png">
                <%=friend.getCognome()%><br>
              </div>
              <div class="ud-user-info">
                <img src="images/icons/cake.png">
                <%=friend.getData_nascita()%><br>
              </div>
              <div class="ud-user-info">
                <img src="images/icons/email.png">
                <%=friend.getMail()%><br>
              </div>
            </div>

          </div>
          <div class="ud-straight-line margin-bottom-5p"></div>
          <div class="ud-buttons-block">
            <% if(!(conn.checkAmicizia(id_host, friend.getId_utente()) || conn.checkRichiesta(id_host, friend.getId_utente()))){%>
            <div class="evd-button" onclick="inviaRichiesta('<%=friend.getId_utente()%>')">Richiedi amicizia</div>
            <%}%>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

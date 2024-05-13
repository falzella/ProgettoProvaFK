<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="connessione.jsp"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException" %>


<%
  String id_host = "";
  if(session.getAttribute("user")==null){
    id_host = "2";
  }else{
    Utente user = (Utente) session.getAttribute("user");
    id_host = user.getId_utente();
  }

  String userFriend = request.getParameter("UserFriend");
  if(userFriend == null){
    userFriend = "falz";
  }
  Utente friend = conn.getUtenteFromUsername(userFriend);

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
    <link href="style/stylesheet2.css" rel="stylesheet" type="text/css">
    <script src="javascript/script.js" type="text/javascript"></script>
  </head>
  <header>
    <div class="hcenter-div">
      <div class="logo-space" onclick="RedirectTo('homepage.jsp')">
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
        <!-- <div class="profile-picture" onclick="RedirectToDettagliUtente('((Utente) session.getAttribute("user")).getUsername()%>')" -->
        <div class="profile-picture">
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

  <body class="homepage-body">
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

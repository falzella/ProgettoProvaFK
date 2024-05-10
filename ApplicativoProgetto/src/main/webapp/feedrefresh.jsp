<%--
  Created by IntelliJ IDEA.
  User: xheli
  Date: 03/05/2024
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="javaDB.ClassiDB"%>
<%@page import="javaDB.Evento"%>
<%@page import="javaDB.Utente"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<body>
<%
        String id_host = "";
        if(session.getAttribute("user")==null){
                id_host = "3";
        }else{
                Utente user = (Utente) session.getAttribute("user");
                id_host = user.getId_utente();
        }

        ClassiDB db = new ClassiDB();
        ArrayList<Evento> feed = db.GetEventFeed(id_host);
%>
        <%for (Evento evento : feed) { %>
                Nome: <%=evento.getNome()%><br>
                Luogo: <%=evento.getLuogo()%><br>
                Indirizzo: <%=evento.getIndirizzo()%><br>
                Città: <%=evento.getCitta()%><br>
                Data: <%=evento.getData()%><br>
                Ora: <%=evento.getOra()%><br>
                Informazioni sul luogo: <%=evento.getInformazioniLuogo()%><br>
                Descrizione: <%=evento.getDescrizione()%><br>
                Tipo: <%=evento.getTipo()%><br>
                ID Host: <%=evento.getIdHost()%><br>
        <%}%>

        <%
            ArrayList<Utente> feedUser = null;
            try {
                feedUser = db.GetFriendFeed(id_host);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        %>

        <%for (Utente utente : feedUser) { %>
        Username: <%=utente.getUsername()%><br>
        Nome: <%=utente.getNome()%><br>
        Cognome: <%=utente.getCognome()%><br>
        Mail: <%=utente.getMail()%><br>
        <%}%>
</body>
</html>

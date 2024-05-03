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
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<body>
<%
        ClassiDB db = new ClassiDB();
        ArrayList<Evento> feed = db.GetEventFeed();
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
</body>
</html>

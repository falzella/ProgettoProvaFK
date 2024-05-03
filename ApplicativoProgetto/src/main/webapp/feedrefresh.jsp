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
<%@page import="java.io.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@include file="./connessione.jsp"%>

<!DOCTYPE html>
<html>
<body>
<%
        ClassiDB db = new ClassiDB();
        ArrayList<Evento> feed = db.GetEventFeed();
%>
</body>
</html>

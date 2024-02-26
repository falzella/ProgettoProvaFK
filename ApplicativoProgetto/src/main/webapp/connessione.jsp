

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaDB.ClassiDB"%>

<%
    ClassiDB conn = (ClassiDB)session.getAttribute("conn");
    if (conn == null) {
        conn = new ClassiDB();
        session.setAttribute("conn", conn);
    }
%>
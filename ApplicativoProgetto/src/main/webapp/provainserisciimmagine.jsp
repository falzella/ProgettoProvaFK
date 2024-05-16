<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%
    HttpServletRequest httpRequest = (HttpServletRequest) request;
    String saveDirectory = application.getRealPath("imagetree/eventspic/11/");
    int maxPostSize = 10 * 1024 * 1024; // Maximum size of uploaded file (10MB in this case)
    MultipartRequest m = new MultipartRequest(httpRequest, saveDirectory);
    out.print("successfully uploaded");
%>

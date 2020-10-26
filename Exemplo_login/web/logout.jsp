<%-- 
    Document   : logout
    Created on : 21/09/2020, 12:34:53
    Author     : stefa
--%>
 <%
        session.invalidate();
        response.sendRedirect("index.jsp");
         %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  
       
    </body>
</html>

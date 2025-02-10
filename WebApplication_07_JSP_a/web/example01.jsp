<%-- 
    Document   : example01
    Created on : Feb 10, 2025, 7:37:59 AM
    Author     : Administrator  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  for (int i = 2; i < 10; i++) {
        %>
        Cuu CHuong : <%=i%> <br/>
        <%
            for (int j = 1; j <= 10; j++) {
        %>
        <%=i%> * <%=j%> = <%=(i * j)%> <br/>
        <%

                }

            }
        %>

    </body>  

</html>

<%-- 
    Document   : login
    Created on : Feb 17, 2025, 1:07:29 AM
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
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login" /> 
            User ID : <input type="text" name="strUserID" /> <br/>
            Password : <input type="password" name="strPassword" /> <br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>

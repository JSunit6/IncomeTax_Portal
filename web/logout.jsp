<%-- 
    Document   : logout
    Created on : Mar 8, 2014, 12:29:25 PM
    Author     : Pravin P. Kajarekar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function clear()
            {
                var s=history.length;
                history.go(-s);
                window.location.replace('inclogin.html');
                
            }
        </script>
    </head>
    <body onload="return clear()">
        <h1>Hello World!</h1>
    </body>
</html>

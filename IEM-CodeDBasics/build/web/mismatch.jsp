<%-- 
    Document   : mismatch
    Created on : Sep 6, 2009, 2:09:22 AM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <script type="text/javascript">
            function pop()
            {
                alert("You entered Wrong Password!");
                window.location="index.jsp";
            }
        </script>
    </head>
    <body onload="pop()">
    </body>
</html>

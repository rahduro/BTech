<%-- 
    Document   : already
    Created on : Sep 7, 2009, 1:25:22 PM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script type="text/javascript">
            function pop()
            {
                alert("Your Team Id has been Used!");
                window.location="index.jsp";
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Collision</title>
    </head>
    <body onload="pop()">
    </body>
</html>

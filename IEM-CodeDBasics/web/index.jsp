<%-- 
    Document   : index
    Created on : Sep 5, 2009, 8:12:29 PM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <style type="text/css">
            body{background:url(images/metal.png) repeat}
            #login{margin-left:500px;margin-top:100px;margin-right:500px;border:1px solid black;background-color:silver}
          
            #f1{text-align:justify}
            #inp{position:absolute;right:520px}
            #but{position:absolute;left:650px; background-color:#978687; border:ridge; cursor:pointer}
            .gradient{
                        background: #000 url(images/gradient4-bg.png) repeat-x left bottom;
                        padding: 30px 40px 60px 30px;
                        margin: 15px 0 20px;
                }
                .gradient h1 {
                        font: normal 350%/100% "Lucida Grande", Arial, sans-serif;
                        text-align:center;
                        margin: 0;
                        color: #fff
                }
                .gradient h2 {
                        font: normal 100%/100% Palatino, serif;
                        margin: 0;
                        color: #b7b7b7;
                }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Code D Basics</title>
    </head>
    <body>
        <div class="gradient" align="center"><h1>Code d basiCs</h1><br style="line-height: 1"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;where ideas turn into real things...</h2></div>
        <div id="login" align="center">
            <form id="f1"name="login" action="check.jsp" method="POST">
                <br>&nbsp;&nbsp;TeamID:<input id="inp" type="text" name="team" value=""/><br><br>
                &nbsp;&nbsp;Slot:<input id="inp" type="text" name="slot" value=""/><br><br>
                &nbsp;&nbsp;Password:<input id="inp" type="password" name="passwd" value=""/><br><br>
                &nbsp;<input id="but" type="submit" value="Login" name="login" /><br><br>
            </form>
        </div>
    </body>
</html>

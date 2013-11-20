<%-- 
    Document   : logout
    Created on : Oct 9, 2009, 11:15:33 PM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>You Have Succesfully Logged Out</title>
    </head>
    <body>
        <%
            String attr;
            HttpSession mSess = request.getSession(false);

            if(mSess!=null)
                {
                    Enumeration e =  mSess.getAttributeNames();
                    while(e.hasMoreElements())
                        {
                            attr = (String)e.nextElement();
                            mSess.removeAttribute(attr);
                        }
                    mSess.invalidate();
                }
            out.print("<b>You are Logged out 4m Your Account!</b>");

            if(!(request.getParameter("backURL").equals("noreturn/")))
            {
                String url_arr[] = request.getParameter("backURL").split("/");
                response.sendRedirect(url_arr[url_arr.length-1]);
            }
            else
                response.sendRedirect("Home.jsp");
        %>
    </body>
</html>

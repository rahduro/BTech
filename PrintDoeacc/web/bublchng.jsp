<%-- 
    Document   : bublchng
    Created on : Oct 15, 2009, 11:59:23 PM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating Complain</title>        
    </head>
    <body>
        <%!
            String url="jdbc:oracle:thin:@localhost:1521:xe",caseid,sol,status;
            Connection con;
            Statement stmt;
            //ResultSet rs;
        %>
        <%
            caseid = request.getParameter("caseftch");
            sol = request.getParameter("sol");
            status = request.getParameter("stat");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,"project","project");
            stmt = con.createStatement();

            stmt.executeUpdate("update complain set sol='"+sol+"', "+"status='"+status+"' where case_id='"+caseid+"'");
            stmt.close();
            con.close();
        %>
        <table align="center">
            <tr>
                <td align="center">
                    <!--<h2 align="center">You Have Updated the Entry In Complain Table</h2>-->
                    <h2 align="center">You Have Updated Solution and Status Information into Customer Account</h2>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="button" value="Go Back" name="press" onclick="javascript:window.location='account.jsp'"/>
                </td>
            </tr>            
        </table>
    </body>
</html>

<%-- 
    Document   : accptquot
    Created on : Oct 17, 2009, 5:24:45 PM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acceptance</title>
    </head>
    <body>
        <%!
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            Connection con;
            Statement stmt;
            ResultSet rs;
        %>
        <%
            String qid = request.getParameter("quotid");
            String custopn = request.getParameter("Quot_Opn");

            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,"project","project");
            stmt = con.createStatement();

            custopn = custopn.concat("ed");
            stmt.executeUpdate("update quotation set quot_stat='"+custopn+"' where quot_id='"+qid+"'");
            stmt.close();
            con.close();
        %>
        <table>
            <tr>
                <td align="center">
                    Quotation <%=custopn %>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="button" value="Go to Account" name="back" onclick="javascript: window.location='account.jsp'"/>
                </td>
            </tr>
        </table>
    </body>
</html>

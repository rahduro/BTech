<%-- 
    Document   : score
    Created on : Sep 6, 2009, 4:23:11 PM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Score</title>
        <style type="text/css">
            div.panel{
                position:absolute;
                left:40%;
                top:40%;
                height:20%;
                width:20%;
                border: solid red 1px
            }
        </style>
    </head>
    <body>
        <%!
        String perm,perm_arr[],url="jdbc:mysql://localhost:3306/iem",query,driver="com.mysql.jdbc.Driver";
        int qno[], answer [],team,q_count,realans[];
        Connection con=null;
        Statement stmt;
        ResultSet rs;
        %>
        <%
            answer=new int[50];

            for(int i=0;i<3;i++)
                {
                    answer[i]=request.getParameter("Q"+(i+1)).charAt(0)-96;
                    //out.print(answer[i]+"<br>");
                    if(answer[i]<0)
                        answer[i]=0;
                }

            team=Integer.parseInt(request.getParameter("teamid").trim());

            try
            {
                Class.forName(driver).newInstance();
            }
            catch(Exception e)
            {
                out.print("Ki je Kori!");
            }

            try
            {
                con=DriverManager.getConnection(url, "root", "root");
            }
            catch(Exception e)
            {
                out.print("Error "+e);
            }

            query="select perm from iem.team_score where team="+team;

            stmt=con.createStatement();
            rs=stmt.executeQuery(query);

            while(rs.next())
                perm=rs.getString("perm");

            //out.print(perm+"<br>");

            stmt.close();
            con.close();
            rs.close();

            qno = new int[50];

            perm_arr=perm.split(":");

            q_count=perm_arr.length;

            for(int i=0;i<q_count;i++)
                {
                    qno[i]=Integer.parseInt(perm_arr[i]);
                }
            
            try
            {
                con=DriverManager.getConnection(url, "root", "root");
            }
            catch(Exception e)
            {
                out.print("Error "+e);
            }

            realans=new int[q_count+1];
            stmt=con.createStatement();
            
            for(int i=0;i<q_count;i++)
            {
                   query="select ans from iem.question_db where qno="+qno[i];
                   rs=stmt.executeQuery(query);

                   while(rs.next())
                        realans[i]=Integer.parseInt(rs.getString("ans").trim());
             }

                stmt.close();
                con.close();
                rs.close();


            int score=0;
            
            for(int i=0;i<q_count;i++)
            {
                   if(answer[i]==0)
                       continue;
                   else if(answer[i]==realans[i])
                       score+=3;
                   else if(answer[i]!=realans[i])
                       score-=1;
            }
            try
            {
                con=DriverManager.getConnection(url, "root", "root");
            }
            catch(Exception e)
            {
                out.print("Error "+e);
            }

            stmt=con.createStatement();
            query="update iem.team_score set score="+score+" where team="+team;

            stmt.executeUpdate(query);
            stmt.close();
            con.close();
            
            %>
            <div class="panel" align="center"><span style="font: xx-large Palatino; font-weight:bold">Your Score</span><br><span style="color:#faa; font: xx-large Palatino; font-weight:bold"><%=score%></span></div>
    </body>
</html>

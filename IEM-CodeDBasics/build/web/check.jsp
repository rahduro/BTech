<%-- 
    Document   : check
    Created on : Sep 5, 2009, 9:32:19 PM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<htmL>
    <head>
        <title>Questions</title>
        <style type="text/css">
            body{
                background: url(images/gradient.png) repeat-x fixed
            }
            div.paper{
                
                margin-left:auto;
                width:70%;
                margin-right:auto;
                background: url(images/oldie.png) repeat
            }
            div.header{
                   margin:auto;
                   background-color:transparent;
                   width:100%;
                   height:150px;
            }
            #questions{
                margin-left:5%;
                margin-right:5%;
                font-family: Palatino,Helvetica,sans-serif;
                color:#000047;
                font-weight:bold
            }
            #options{
                margin-left:10%;
                margin-right:10%;
                font-family:Verdana,Helvetica,sans-serif;
                color:#00104D
            }
            select.choice{
                cursor:pointer;
                margin-left:44%;
                background-color:transparent;
                border:ridge;
                color:#262600
            }
            div.cheraup{
                margin-left:auto;
                width:70%;
                margin-right:auto;
                height:70px;
                background:url(images/cheraup.png) repeat-x
            }
            div.cheradwn{
                margin-left:auto;
                margin-bottom:50px;
                width:70%;
                margin-right:auto;
                height:73px;
                background:url(images/cheradwn.png) repeat-x
            }
            .formbutton{
                cursor:pointer;
                border:groove 2px #353535;
                color:#666;
                font-weight:bold;
                padding: 1px 2px;
                background: url(images/formbg.gif) repeat-x left top;
            }
            hr{
                color:#331F13
            }
            div.lm{
                position:absolute;
                left:20%;
            }
            div.mm{
                position:absolute;
                left:45%;
            }
            div.rm{
                position:absolute;
                right:20%;
            }
        </style>
        <script language="JavaScript" type="text/JavaScript">
          var sec=600;
          function tickTimer()
          {
            if(sec>=0)
            {
                document.getElementById('clock').innerHTML = Math.floor((sec/60))+':'+(sec%60);
                sec=sec-1;
                setTimeout('tickTimer()',1000);
            }
            else
            {
              alert("Sorry, Your Time is Over!")
              var e = document.getElementById('answer');
              e.click();
            }
          }
          function el_ctl()
          {
              if(document.calc.teamid.disabled==true)
                 document.calc.teamid.disabled=false;
              document.calc.answer.disabled=true;
          }
     </script>
    </head>
    <body onload="tickTimer();">
        <div align="center" class="header"><span style="color:white; font: normal 450%/100% Palatino;position:relative">Prelims Round</span></div>
        <div align="center" style="position:fixed; margin-top:50px; margin-left:90%;height:75px;width:100px;background-color:black;color:white">
            <br>
            <span style="text-decoration:underline">Time Left<br></span>
            <span id='clock'></span>
        </div>
    <%!
        String pswd,pass,url="jdbc:mysql://localhost:3306/iem",query,driver="com.mysql.jdbc.Driver";
        int slot, permut [],take,team;
        boolean mask[];
        Connection con=null;
        Statement stmt;
        ResultSet rs;
        Random ran;

        String format(String A)
        {
            String S="";
            int lim = A.length();
            for(int i=0;i<lim;i++) {
                if(A.charAt(i)=='$')
                    S = S + "'";
                else
                    S = S + A.charAt(i);
            }
            return S;
        }
    %>
    <%        
        String per_arr="";
        team = Integer.parseInt(request.getParameter("team").trim());
        slot = Integer.parseInt(request.getParameter("slot").trim());
        pass = request.getParameter("passwd");

        //out.println(team+"<br>"+slot+"<br>"+pass);
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
        con=DriverManager.getConnection(url, "root", "root");}
        catch(Exception e)
        {
            out.print("Error "+e);
        }

        query="select * from iem.team_score where team="+team;

        stmt=con.createStatement();
        rs=stmt.executeQuery(query);

        if(rs.first())
        {
            response.sendRedirect("already.jsp");
            stmt.close();
            con.close();
            rs.close();
        }
        else
        {
            stmt.close();
            con.close();
            rs.close();
            
            try
            {
            con=DriverManager.getConnection(url, "root", "root");}
            catch(Exception e)
            {
                out.print("Error "+e);
            }

            query="select pass from iem.auth_slot where slot="+slot;

            stmt=con.createStatement();
            rs=stmt.executeQuery(query);

            while(rs.next())
                pswd=rs.getString("pass");

            stmt.close();
            con.close();
            rs.close();

            if(pswd.equals(pass))
                {

                    permut=new int[150];
                    mask=new boolean[150];

                    for(int i=0;i<150;i++)
                        mask[i]=false;
                    ran=new Random(team);

                    for(int i=0;i<20;i++)
                    {
                        while(true)
                        {
                            take=(ran.nextInt())%25+1;
                            System.out.println(take);
                            if((take>0)&&mask[take]==false)
                            {
                                permut[i]=take;
                                mask[take]=true;
                                break;
                            }
                         }
                     }
                    for(int i=0;i<19;i++)
                    {
                        per_arr+=permut[i]+":";
                    }

                    per_arr+=permut[19];

                   //out.print(per_arr);

                   con=DriverManager.getConnection(url, "root", "root");
                   query="insert into iem.team_score values("+team+","+"'"+per_arr+"'"+","+"0"+")";
                   stmt=con.createStatement();
                   stmt.executeUpdate(query);

                   stmt.close();
                   con.close();
                   per_arr="";

                   con=DriverManager.getConnection(url, "root", "root");
                   stmt=con.createStatement();
                   %>
                   <div class="cheraup"></div>
                   <div class="paper">
                   <form name="calc" action="score.jsp" method="POST">
                       <br>
                       <div class="lm"><span style="font: normal small-caps 120%/120% fantasy">20 questions</span></div>
                       <div class="mm"><span style="font: normal small-caps 120%/120% fantasy">team : </span><input style="border: 0px; background-color:transparent; font: normal small-caps 120%/120% fantasy; color:#000"type="text" name="teamid" value="<%= team%>" disabled="disabled" size="5"/></div>
                   <div class="rm"><span style="font: normal small-caps 120%/120% fantasy">10 minutes</span></div>
                   <br>
                   <br>
                   <hr align="center" width="85%" size="5">
                   <%for(int i=0;i<20;i++)
                     {
                       query="select * from iem.question_db where qno="+permut[i];
                       rs=stmt.executeQuery(query);
                       rs.next();%>
                       <div id="questions">
                           <%out.print("<br>"+(i+1)+". "+"<br>"+format(rs.getString("qst"))+"<br><br>");%>
                       </div>
                       <div id="options"><%
                       out.print("a. <br>"+format(rs.getString("opt1"))+"<br>");
                       out.print("b. <br>"+format(rs.getString("opt2"))+"<br>");
                       out.print("c. <br>"+format(rs.getString("opt3"))+"<br>");
                       out.print("d. <br>"+format(rs.getString("opt4"))+"<br><br>");%>
                       </div>
                       <select class="choice" name="Q<%=(i+1)%>" size="1" style="width:120px">
                           <option selected>Unanswered</option>
                           <option>a</option>
                           <option>b</option>
                           <option>c</option>
                           <option>d</option>
                       </select>
                           <br><br><hr align="center" width="85%" >
                     <%
                     rs.close();
                     }
                     stmt.close();
                     con.close();
                     %>
                     <br><br>

                     <input class="formbutton" style="margin-left:45%; height:30px; width:100px" type="submit" value="Submit" name="answer" id='answer' onclick="el_ctl()"/><br><br>

                   </form>

                   </div>
                  <div class="cheradwn"></div>
                <%
                        }
                    else
                        {
                            response.sendRedirect("mismatch.jsp");
                        }

                }
                %>
    </body>
</html>
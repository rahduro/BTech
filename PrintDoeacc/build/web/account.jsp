<%-- 
    Document   : index
    Created on : Jul 28, 2009, 12:07:10 AM
    Author     : rinki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Page for any User</title>

        <script type="text/javascript">
            window.onload=mnav;
            function mnav(id) {
            var m = document.getElementById(id);
                for (var a = 1; a<=10; a++) {
                    if (document.getElementById('menu'+a)) {document.getElementById('menu'+a).style.display='none';}
                }
            if (m) {m.style.display='block';}
            }
        </script>

        <style type="text/css">
            body{
                background-color: silver;
            }
            #out{
                /*margin-top: 70px;
                margin-bottom: 110px;*/
                border: green;
                border-width: thick;
            }
            #left-col{
                background-color: #00008B;
            }
            #body{
                padding-top: 25px;
                background-color: white;
                /*background-color: #FFEFD5;*/
                /*background-color: #F0FFFF;*/
            }
            #main{
                position:absolute;
                margin-top: 30px;
                left: 10%;
                width: 80%;
                border: 3px solid red;
                font-family: verdana, arial, sans-serif;
                font-size: 90%;
            }
            #header{
                /*border-collapse: separate;*/
            }
            #left{
                width: auto;
                margin-right: 5%;
                border-style: solid;
                float: left;
                padding:0px 20px 20px;
            }
            #right{
                margin-left: 10px;
                width: 8em;
                float: left;
                border-style: none;
                border-width: thick;
                border-color: #A52A2A;
                background: #6898d0;
                padding: 0px 40px 20px 20px;
            }
            #footer{
                background-color: #00008B;
                color: #87CEEB;
            }
            dl, dt, dd, ul, li {
                padding: 0;
                list-style-type: none;
                color: #000;
            }
            #menu {
                position: relative;
                top: 0em;
                left: 0em;
                width: 13em;
            }
            #menu dt {
                cursor: pointer;
                background: #6898d0 url("Final Images/arrow7.gif") no-repeat left;
                padding-left: 8px;
                height: 25px;
                line-height: 25px;
                margin: 3px 0;
                border: 1px solid #2586d7;
                text-align: left;
                font-weight: bold;
            }
            #menu dt a {
                padding-left: 5px;
                color: #fff;
                text-decoration: none;
                display: block;
            }
            #menu dt a:hover {
                text-decoration: underline;
                color: #ff3e3e;
                background: #fff;
            }
            #menu dd {
                position: absolute;
                margin-left: 28px;
                z-index: 100;
                left: 8em;
                margin-top: -1.5em;
                width: 18em;
                background: #6898d0;
                border: 1px solid #2586d7;
            }
            #menu ul {
                padding: 1px;
            }
            #menu li {
                font-size: 85%;
                height: 25px;
                line-height: 25px;
                width: 21em;
            }
            #menu li a {
                padding-left: 10px;
                color: #fff;
                text-decoration: none;
                display: block;
            }
            #menu li a:hover {
                text-decoration: underline;
                color: #ff3e3e;
                background: #fff url('Final Images/arrow7.gif') no-repeat left;
            }
            #hdr-name {
                background: url("Final Images/bg.jpg") repeat-x;                
            }
            .spwhite {
                font-family: verdana, arial, sans-serif;
                font-size: 12px;
                font-weight: bold;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <%!
            String usrid="",paswd="",us_type="",vld_dt="",cname="",url = "jdbc:oracle:thin:@localhost:1521:xe",qtst,take_man[],take_namc[],temp;
            Connection con,con1;
            Statement stmt,stmt1;
            ResultSet rs,rs1;
        %>
        <%
        int cnt,i,tot;
        boolean p_chk;
        java.sql.Date vlfrm,vlupto,crton;

        Calendar cl = Calendar.getInstance();
        vlfrm = vlupto = crton = new java.sql.Date(cl.getTimeInMillis());
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection(url,"project","project");
        con1=DriverManager.getConnection(url,"project","project");
        stmt=con.createStatement();
        stmt1=con1.createStatement();

        boolean uc=false;

        String bURL = request.getRequestURI();
        HttpSession mSess = request.getSession(false);

        if(mSess!=null)
        {
            usrid = (String)mSess.getAttribute("UsRNamE");

            if(usrid!=null && !usrid.equals(""))
            {
                uc = true;
                //paswd = mSess.getAttribute("PasWD").toString();
                us_type = (String)mSess.getAttribute("UsRTypE");

                if(us_type.equals("ENG"))
                {
                    vld_dt = "Not Applicable";
                    rs = stmt.executeQuery("select eng_name from engineer where eng_id='"+usrid+"'");

                    while(rs.next())
                        cname = rs.getString("eng_name");
                }
                else
                {
                    if(us_type.equals("NAMC"))
                        vld_dt= "Unlimited";
                    else
                        vld_dt = (String)mSess.getAttribute("ValUp2");

                    rs = stmt.executeQuery("select c_name from customer where cust_id='"+usrid+"'");

                    while(rs.next())
                        cname = rs.getString("c_name");
                }
                rs.close();
            }
        }
        %>

            <table id="out" align="center" width="650" border="0" cellspacing="0" cellpadding="">
                <tr id="header" bgcolor="">
                    <td id="hdr-logo1" bgcolor="white" width=""><img id="image1" align="middle" src="Final Images/Care logo 1.jpg" height="160" width="200"/></td>
                    <td id="hdr-name" style="color: #F0FFF0"><h1 align="center">TECHNOPRINT<br>Printing and Services</h1></td>
                </tr>
                <tr id="row2">
                    <td valign="top" id="left-col" width="" style="">
                        <br><br>
                        <dl id="menu">
                            <dt onmouseover="javascript:mnav('menu1');" onmouseout="javascript:mnav();"><a class="spwhite" href="Home.jsp">Home</a></dt>

                            <dt onmouseover="javascript:mnav('menu2');" onmouseout="javascript:mnav();"><a class="spwhite" href="#">About us</a></dt>

                            <dt onmouseover="javascript:mnav('menu3');" onmouseout="javascript:mnav();"><a class="spwhite" href="support_trouble.jsp">Support & Troubleshooting</a></dt>

                            <dt onmouseover="javascript:mnav('menu4');" onmouseout="javascript:mnav();"><a class="spwhite" href="NonAMC-reg.jsp">Product Registration</a></dt>

                            <dt onmouseover="javascript:mnav('menu5');"><a class="spwhite" href="#">Care Pack Solutions</a></dt>
                                <dd id="menu5" onmouseover="javascript:mnav('menu5');" onmouseout="javascript:mnav();">
                                    <ul>
                                        <li><a href="amc1.jsp">Accidental Damage Protection</a></li>
                                        <li><a href="amc2.jsp">House Call Support</a></li>
                                        <li><a href="amc3.jsp">Out Of Warranty Support</a></li>
                                        <li><a href="amc4.jsp">Regular Tune Up and Maintenance</a></li>
                                     </ul>
                                </dd>

                            <dt onmouseover="javascript:mnav('menu6');" onmouseout="javascript:mnav();"><a class="spwhite" href="parts_req.jsp">Order Parts</a></dt>

                            <dt onmouseover="javascript:mnav('menu7');" onmouseout="javascript:mnav();"><a class="spwhite" href="Complain Lodging.jsp">Complain Lodging</a></dt>

                            <dt onmouseover="javascript:mnav('menu8');" onmouseout="javascript:mnav();"><a class="spwhite" href="warranty_form.jsp">Check warranty</a></dt>

                            <dt onmouseover="javascript:mnav('menu9');" onmouseout="javascript:mnav();"><a class="spwhite" href="#">Contact us</a></dt>
                        </dl>
                        <div id="right">
                            <p>
                            <%
                            if(uc)
                            {
                            %>
                            <b>Usrid :</b>
                            <br>    <a href="account.jsp"><i><%= usrid %></i> </a>
                            <br><br>    <b>Account : </b><i><%= us_type %></i>
                            <br><br>    <b>Valid Upto:</b>
                            <br>    <i><%= vld_dt %></i>
                            <br><br><form name="T1" action="logout.jsp" method="POST">
                                <input type="hidden" name="backURL" value=<%= bURL %> />
                                <input type="submit" value="Log Out" name="logoff" />
                            </form>
                            <%
                            }
                            else
                            {
                            %>
                            <h2>Login</h2>
                            <form action="userchk.jsp" method="POST" id="F1">
                            <input type="hidden" name="backURL" value=<%= bURL %> />
                            User Name:
                            <input type="text" name="User Name" value="" /><br><br>
                            Password:
                            <input type="password" name="Password" value="" /><br><br>
                            <input type="submit" value="Login" align=""  />
                            </form>
                            <%
                            }
                            %>
                        </div>
                    </td>
                    <td id="body" colspan="" width="" bgcolor="">
                        <div id="left">
                                <%
                                if(uc)
                                    {
                                        take_man = new String[1000];
                                        i=0;

                                        if(usrid.charAt(0)=='E')
                                        {
                                            rs = stmt.executeQuery("select cust_id from contract where eng_id='"+usrid+"'");
                                            while(rs.next())
                                                {
                                                    take_man[i] = rs.getString("cust_id");
                                                    i++;
                                                }
                                            rs.close();
                                        }
                                        else if(usrid.charAt(0)=='A')
                                        {
                                            rs = stmt.executeQuery("select eng_id from contract where cust_id='"+usrid+"'");
                                            while(rs.next())
                                                {
                                                    take_man[i] = rs.getString("eng_id");
                                                    i++;
                                                }
                                            rs.close();
                                        }
                                        else if(usrid.charAt(0)=='N')
                                        {
                                            rs = stmt.executeQuery("select case_id from complain where cust_id='"+usrid+"'");
                                            while(rs.next())
                                                {
                                                    take_man[i] = rs.getString("case_id");
                                                    i++;
                                                }
                                            rs.close();
                                        }
                                        tot = i;
                                %>
                                <table align="center" width="100%" border="1">
                                    <%
                                    if(usrid.charAt(0)=='E')
                                        {
                                    %>
                                    <tr>
                                        <td align="center" colspan="16"><b style="text-decoration:underline;color:green">Profile Information</b></td>
                                    </tr>
                                    <tr>
                                        <th colspan="4" align="center">Engineer ID</th>
                                        <th colspan="4" align="center">Name</th>
                                        <th colspan="4" align="center">Contact Number</th>
                                        <th colspan="4" align="center">Email</th>
                                    </tr>
                                    <tr>
                                        <%
                                            rs = stmt.executeQuery("select * from Engineer where eng_id='"+usrid+"'");
                                            while(rs.next())
                                                {
                                        %>
                                        <td colspan="4" align="center"><%= rs.getString("eng_id") %></td>
                                        <td colspan="4" align="center"><%= rs.getString("eng_name") %></td>
                                        <td colspan="4" align="center"><%= rs.getString("mobile") %></td>
                                        <td colspan="4" align="center"><%= rs.getString("email") %></td>
                                    </tr>
                                    <tr><td style="border:none"><br><br></td></tr>
                                        <%
                                                }
                                            rs.close();
                                            out.print("<tr><td colspan=\"16\" align=\"center\"><b style=\"text-decoration:underline;color:green\" >AMC Customer Information</b></td></tr>");
                                        %>
                                        <tr>
                                            <th>Customer ID</th>
                                            <th>Customer Name</th>
                                            <th>Contact Name</th>
                                            <th colspan="2">Address</th>
                                            <th>City</th>
                                            <th>State</th>
                                            <th>PinCode</th>
                                            <th>Mobile</th>
                                            <th>Land Line</th>
                                            <th>Email</th>
                                            <th colspan="2">Serial No</th>
                                            <th>Valid From</th>
                                            <th>Valid From</th>
                                            <th>Created On</th>
                                        </tr>
                                        <%
                                            p_chk = true;
                                            for(int j=0;j<tot;j++)
                                                {
                                                    p_chk = false;
                                                    rs1 = stmt.executeQuery("select * from contract where cust_id='"+take_man[j]+"'");
                                                    while(rs1.next())
                                                        {
                                                            vlfrm = rs1.getDate("valid_from");
                                                            vlupto = rs1.getDate("valid_upto");
                                                            crton = rs1.getDate("created_on");
                                                        }
                                                    rs1.close();                                                    
                                                    rs = stmt.executeQuery("select * from customer where cust_id='"+take_man[j]+"'");
                                                    while(rs.next())
                                                        {                                                        
                                        %>
                                        <tr>
                                            <td align="center"><%= rs.getString("cust_id")%></td>
                                            <td align="center"><%= rs.getString("c_name")%></td>
                                            <td align="center"><%= rs.getString("contact_name")%></td>
                                            <td colspan="2" align="center"><%= rs.getString("address")%></td>
                                            <td align="center"><%= rs.getString("city")%></td>
                                            <td align="center"><%= rs.getString("state")%></td>
                                            <td align="center"><%= rs.getString("pin")%></td>
                                            <td align="center"><%= rs.getString("mobile")%></td>
                                            <td align="center"><%= rs.getString("land_ph")%></td>
                                            <td align="center"><%= rs.getString("emal")%></td>
                                            <td colspan="2" align="center"><%= rs.getString("serial_no")%></td>


                                            <td align="center"><%= vlfrm%></td>
                                            <td align="center"><%= vlupto%></td>
                                            <td align="center"><%= crton%></td>
                                        </tr>                                        
                                        <%
                                                        }
                                                    rs.close();
                                                }
                                                if(p_chk)
                                                        out.print("<tr><td align=\"center\" colspan=\"17\" style=\"color:blue\">No Records Found</td></tr>");
                                        %>
                                        <tr><td style="border:none"><br><br></td></tr>
                                        <tr><td colspan="16" align="center"><b style="text-decoration:underline;color:green">NAMC Customer Information</b></td></tr>
                                        <tr>
                                                            <th colspan="2" align="center">Customer ID</th>
                                                            <th colspan="2" align="center">Customer Name</th>
                                                            <th align="center">Contact Name</th>
                                                            <th colspan="3" align="center">Address</th>
                                                            <th align="center">City</th>
                                                            <th align="center">State</th>
                                                            <th align="center">Pin Code</th>
                                                            <th align="center">Mobile</th>
                                                            <th align="center">LandLine</th>
                                                            <th align="center">Email</th>
                                                            <th colspan="2" align="center">Serial No</th>
                                        </tr>
                                        <%
                                            rs = stmt.executeQuery("select case_id from assigned_eng where eng_id='"+usrid+"'");
                                            tot = 0;
                                            p_chk = true;
                                            take_namc = new String[100];
                                            while(rs.next())
                                                {
                                                    p_chk = false;
                                                    boolean chk = true;
                                                    rs1 = stmt1.executeQuery("select * from complain where case_id='"+rs.getString("case_id")+"'");

                                                    while(rs1.next())
                                                        temp = rs1.getString("cust_id");

                                                    rs1.close();

                                                    for(int k=0;k<tot;k++)
                                                        {
                                                            if(temp.equals(take_namc[k]))
                                                                {
                                                                    chk = false;
                                                                    break;
                                                                }
                                                        }
                                                        if(chk)
                                                            take_namc[tot++]= temp;
                                                }
                                            rs.close();
                                            for(int j=0;j<tot;j++)
                                                {
                                                    rs = stmt.executeQuery("select * from customer where cust_id='"+take_namc[j]+"'");
                                                    while(rs.next())
                                                        {
                                        %>
                                                        <tr>
                                                            <td colspan="2" align="center"><%= rs.getString("cust_id")%></td>
                                                            <td colspan="2" align="center"><%= rs.getString("c_name")%></td>
                                                            <td align="center"><%= rs.getString("contact_name")%></td>
                                                            <td colspan="3" align="center"><%= rs.getString("address")%></td>
                                                            <td align="center"><%= rs.getString("city")%></td>
                                                            <td align="center"><%= rs.getString("state")%></td>
                                                            <td align="center"><%= rs.getString("pin")%></td>
                                                            <td align="center"><%= rs.getString("mobile")%></td>
                                                            <td align="center"><%= rs.getString("land_ph")%></td>
                                                            <td align="center"><%= rs.getString("emal")%></td>
                                                            <td colspan="2" align="center"><%= rs.getString("serial_no")%></td>
                                                        </tr>
                                     <%
                                                       }
                                                    rs.close();
                                               }
                                            if(p_chk)
                                                        out.print("<tr><td align=\"center\" colspan=\"17\" style=\"color:blue\">No Records Found</td></tr>");

                                     }
                                    else
                                        {
                                                    %>
                                                    <tr>
                                                        <td align="center" colspan="24"><b style="text-decoration:underline;color:green">Profile Information</b></td>
                                                    </tr>
                                                    <%
                                                    rs = stmt.executeQuery("select * from customer where cust_id='"+usrid+"'");
                                                    while(rs.next())
                                                        {
                                                    %>
                                                        <tr>
                                                            <th colspan="2" align="center" nowrap>Customer ID</th>
                                                            <th colspan="2" align="center" nowrap>Customer Name</th>
                                                            <th colspan="2" align="center" nowrap>Contact Name</th>
                                                            <th colspan="4" align="center" nowrap>Address</th>
                                                            <th colspan="2" align="center" nowrap>City</th>
                                                            <th colspan="2" align="center" nowrap>State</th>
                                                            <th colspan="2" align="center" nowrap>PinCode</th>
                                                            <th colspan="2" align="center" nowrap>Mobile</th>
                                                            <th colspan="2" align="center" nowrap>Land Line</th>
                                                            <th colspan="2" align="center" nowrap>Email</th>
                                                            <th colspan="2" align="center" nowrap>Product Serial No</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("cust_id")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("c_name")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("contact_name")%></td>
                                                            <td colspan="4" align="center" nowrap><%= rs.getString("address")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("city")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("state")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("pin")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("mobile")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("land_ph")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("emal")%></td>
                                                            <td colspan="2" align="center" nowrap><%= rs.getString("serial_no")%></td>
                                                        </tr>
                                                        <tr><td style="border:none"><br><br></td></tr>
                                                        <%
                                                        }
                                                        rs.close();
                                                        if(usrid.charAt(0)=='A')
                                                        {
                                                        %>
                                                        <tr><td align="center" colspan="24"><b style="text-decoration:underline;color:green">Engineer Information</b></td></tr>
                                                        <tr>
                                                            <th align="center" colspan="8">Engineer's Name</th>
                                                            <th align="center" colspan="8">Engineer's Mobile</th>
                                                            <th align="center" colspan="8">Engineer's Email</th>
                                                        </tr>
                                                        <%                                                                                                                
                                                        rs = stmt.executeQuery("select * from engineer where eng_id='"+take_man[0]+"'");
                                                        while(rs.next())
                                                            {
                                                        %>
                                                             <tr>
                                                                 <td align="center" colspan="8"><%= rs.getString("eng_name")%></td>
                                                                 <td align="center" colspan="8"><%= rs.getString("mobile")%></td>
                                                                 <td align="center" colspan="8"><%= rs.getString("email")%></td>
                                                             </tr>
                                                        <%
                                                     
                                                            }
                                                        }
                                                        out.print("<tr><td style=\"border:none\"><br><br></td></tr>");
                                     }
                                     %>
                                </table>
                                    <br>
                                    <br>
                                 <%
                                        out.println("<table align=\"center\" border=\"1\" cellpadding=\"7\">");

                                        if(us_type.equals("ENG"))
                                            {
                                                int quot_idm = 201;

                                                rs = stmt.executeQuery("select max(quot_id) quot_id from quotation");
                                                while(rs.next())
                                                    if(rs.getInt("quot_id")+1>quot_idm)
                                                        quot_idm = rs.getInt("quot_id")+1;
                                                rs.close();
                                                
                                                out.print("<tr>");

                                                out.print("<th nowrap><b>Serial</b></th>");
                                                out.print("<th nowrap><b>Case ID</b></th>");
                                                out.print("<th nowrap><b>Date Of Complain</b></th>");
                                                out.print("<th nowrap><b>Customer ID</b></th>");
                                                out.print("<th nowrap><b>Model No</b></th>");
                                                out.print("<th nowrap><b>Case Description</b></th>");
                                                out.print("<th nowrap><b>Problem Code</b></th>");
                                                out.print("<th nowrap><b>Solution By Engineer</b></th>");
                                                out.print("<th nowrap><b>Status</b></th>");
                                                out.print("<th nowrap colspan=\"2\"><b>Quotation & Update</b></th>");
                                                
                                                out.print("</tr>");

                                                out.print("<tr>");
                                                out.print("<td colspan=\"11\" align=\"center\"><b>AMC Customers' Complaints</b>");
                                                out.print("</tr>");
                                                rs = stmt.executeQuery("select cust_id from contract where eng_id='"+usrid+"'");

                                                cnt=0;
                                                p_chk = true;
                                                while(rs.next())
                                                    {
                                                        rs1 = stmt1.executeQuery("select * from complain where cust_id='"+rs.getString("cust_id")+"'");

                                                        while(rs1.next())
                                                        {
                                                            p_chk = false;
                                                            out.print("<tr>");
                                                            cnt++;

                                                            out.print("<td>"+cnt+"</td>");                                                            
                                                            out.print("<td>"+rs1.getString("case_id")+"</td>");
                                                            out.print("<td>"+rs1.getDate("complain_dt")+"</td>");
                                                            out.print("<td>"+rs1.getString("cust_id")+"</td>");
                                                            out.print("<td>"+rs1.getString("model_no")+"</td>");
                                                            out.print("<td>"+rs1.getString("case_description")+"</td>");
                                                            out.print("<td>"+rs1.getString("prblm_code")+"</td>");

                                                            out.print("<form name=\"update\" action=\"bublchng.jsp\" method=\"POST\">");
                                                            out.print("<input type=\"hidden\" name=\"caseftch\" value=\""+rs1.getString("case_id")+"\" />");
                                                            out.print("<td><textarea name=\"sol\" rows=\"4\" cols=\"20\" value=\""+rs1.getString("sol")+"\">"+rs1.getString("sol")+"</textarea></td>");
                                                            out.print("<td><input type=\"text\" name=\"stat\" size=\"20\" value=\""+rs1.getString("status")+"\"/></td>");
                                                            out.print("<td><input type=\"submit\" value=\"Commit Change\" name=\"postUpdate\"/></td>");
                                                            out.print("</form>");

                                                            if(rs1.getInt("quot")==0)
                                                            {
                                                                out.print("<form name=\"QF\" action=\"genquot.jsp\" method=\"POST\">");     //Form Hidden Start

                                                                out.print("<input type=\"hidden\" name=\"caseid\" value=\""+rs1.getString("case_id")+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"engid\" value=\""+usrid+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"quotid\" value=\""+quot_idm+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"model\" value=\""+rs1.getString("model_no")+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"custid\" value=\""+rs1.getString("cust_id")+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"serial\" value=\""+rs1.getString("serial_no")+"\"/>");


                                                                out.print("<td><input type=\"submit\" value=\"Generate Quotation\" name=\"quotationGen\" /></td>");
                                                                out.print("</form>");       //Form Hidden End
                                                            }
                                                            else
                                                            {
                                                                   out.print("<form name=\"QSF\" action=\"showquot.jsp\" method=\"POST\">");     //Form Hidden Start
                                                                   out.print("<input type=\"hidden\" name=\"quotid\" value=\""+rs1.getInt("quot")+"\"/>");
                                                                   out.print("<td><input type=\"submit\" value=\"Show Quotation\" name=\"Quotation\" /></td>");
                                                                   out.print("</form>");       //Form Hidden End
                                                            }                                                           

                                                            out.print("</tr>");
                                                        }
                                                        rs1.close();                                                        
                                                    }
                                                    if(p_chk)
                                                            out.print("<tr><td align=\"center\" colspan=\"11\" style=\"color:blue\">No Records Found</td></tr>");

                                                    rs.close();                                                    
;                                                   out.print("<td colspan=\"11\" align=\"center\"><b>Non-AMC Customers' Complaints</b>");

                                                    rs = stmt.executeQuery("select case_id from assigned_eng where eng_id='"+usrid+"'");

                                                    p_chk = true;
                                                    while(rs.next())
                                                    {
                                                        rs1 = stmt1.executeQuery("select * from complain where case_id='"+rs.getString("case_id")+"'");
                                                        
                                                        cnt=0;
                                                        while(rs1.next())
                                                        {
                                                            p_chk = false;
                                                            cnt++;
                                                            out.print("<tr>");
                                                            
                                                            out.print("<td>"+cnt+"</td>");
                                                            out.print("<td>"+rs1.getString("case_id")+"</td>");
                                                            out.print("<td>"+rs1.getDate("complain_dt")+"</td>");
                                                            out.print("<td>"+rs1.getString("cust_id")+"</td>");
                                                            out.print("<td>"+rs1.getString("model_no")+"</td>");
                                                            out.print("<td>"+rs1.getString("case_description")+"</td>");
                                                            out.print("<td>"+rs1.getString("prblm_code")+"</td>");

                                                            out.print("<form name=\"update\" action=\"bublchng.jsp\" method=\"POST\">");
                                                            out.print("<input type=\"hidden\" name=\"caseftch\" value=\""+rs1.getString("case_id")+"\" />");
                                                            out.print("<td><textarea name=\"sol\" rows=\"4\" cols=\"20\" value=\""+rs1.getString("sol")+"\">"+rs1.getString("sol")+"</textarea></td>");
                                                            out.print("<td><input type=\"text\" name=\"stat\" size=\"20\" value=\""+rs1.getString("status")+"\"/></td>");
                                                            out.print("<td><input type=\"submit\" value=\"Commit Change\" name=\"postUpdate\"/></td>");
                                                            out.print("</form>");

                                                            if(rs1.getInt("quot")==0)
                                                            {
                                                                out.print("<form name=\"QF1\" action=\"genquot.jsp\" method=\"POST\">");     //Form Hidden Start

                                                                out.print("<input type=\"hidden\" name=\"caseid\" value=\""+rs1.getString("case_id")+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"engid\" value=\""+usrid+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"quotid\" value=\""+quot_idm+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"model\" value=\""+rs1.getString("model_no")+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"custid\" value=\""+rs1.getString("cust_id")+"\"/>");
                                                                out.print("<input type=\"hidden\" name=\"serial\" value=\""+rs1.getString("serial_no")+"\"/>");


                                                                out.print("<td><input type=\"submit\" value=\"Generate Quotation\" name=\"quotationGen\" /></td>");
                                                                out.print("</form>");       //Form Hidden End
                                                            }
                                                            else
                                                            {
                                                                   out.print("<form name=\"QSF1\" action=\"showquot.jsp\" method=\"POST\">");     //Form Hidden Start
                                                                   out.print("<input type=\"hidden\" name=\"quotid\" value=\""+rs1.getInt("quot")+"\"/>");
                                                                   out.print("<td><input type=\"submit\" value=\"Show Quotation\" name=\"Quotation\" /></td>");
                                                                   out.print("</form>");       //Form Hidden End
                                                            }
                                                            
                                                            out.print("</tr>");
                                                        }
                                                        rs1.close();
                                                    }
                                                    rs.close();
                                                    if(p_chk)
                                                        out.print("<tr><td align=\"center\" colspan=\"11\" style=\"color:blue\">No Records Found</td></tr>");
                                                }
                                            else
                                            {
                                                if(usrid.charAt(0)=='N')
                                                    out.print("<tr><td colspan=\"16\" align=\"center\"><b style=\"color:red\">Your Previous Complaint Records</b></td></tr>");
                                                else
                                                    out.print("<tr><td colspan=\"10\" align=\"center\"><b style=\"color:red\">Your Previous Complaint Records</b></td></tr>");
                                                
                                                out.print("<tr>");

                                                out.print("<th nowrap><b>Serial</b></th>");
                                                out.print("<th nowrap><b>Case ID</b></th>");
                                                out.print("<th nowrap><b>Date Of Complain</b></th>");
                                                out.print("<th nowrap><b>Model No</b></th>");
                                                out.print("<th nowrap><b>Case Description</b></th>");
                                                out.print("<th nowrap><b>Solution By Engineer</b></th>");
                                                out.print("<th nowrap><b>Status</b></th>");
                                                out.print("<th nowrap colspan=\"3\"><b>Quotation</b></th>");
                                                if(usrid.charAt(0)=='N')
                                                    {
                                                        out.print("<th nowrap colspan=\"2\"><b>Engineer's Name</b></th>");
                                                        out.print("<th nowrap colspan=\"2\"><b>Engineer's Mail</b></th>");
                                                        out.print("<th nowrap colspan=\"2\"><b>Engineer's Mobile</b></th>");
                                                    }
                                                out.print("</tr>");                                                

                                                rs = stmt.executeQuery("select * from complain where cust_id='"+usrid+"'");

                                                cnt = 0 ;
                                                p_chk = true;
                                                while(rs.next())
                                                    {
                                                            p_chk = false;
                                                            cnt++;
                                                            out.print("<tr>");
                                                            
                                                            out.print("<td>"+cnt+"</td>");
                                                            out.print("<td>"+rs.getString("case_id")+"</td>");
                                                            out.print("<td>"+rs.getDate("complain_dt")+"</td>");
                                                            out.print("<td>"+rs.getString("model_no")+"</td>");
                                                            out.print("<td>"+rs.getString("case_description")+"</td>");
                                                            out.print("<td>"+rs.getString("sol")+"</td>");
                                                            out.print("<td>"+rs.getString("status")+"</td>");
                                                            
                                                            if(rs.getInt("quot")!=0)
                                                                {
                                                                    out.print("<form name=\"view_quot\" action=\"showquot.jsp\" method=\"POST\">");
                                                                    out.print("<input type=\"hidden\" name=\"quotid\" value=\""+rs.getInt("quot")+"\" />");
                                                                    out.print("<td><input type=\"submit\" value=\"View Quotation\" name=\"Quotation\" /></td>");
                                                                    out.print("</form>");

                                                                    rs1 = stmt1.executeQuery("select quot_stat from quotation where quot_id='"+rs.getInt("quot")+"'");

                                                                    while(rs1.next())
                                                                        qtst = rs1.getString("quot_stat");
                                                                    rs1.close();
                                                                  
                                                                    if(qtst.equals("PENDING"))
                                                                        {
                                                                            out.print("<form name=\"accept_quot\" action=\"accptquot.jsp\" method=\"POST\">");
                                                                            out.print("<input type=\"hidden\" name=\"quotid\" value=\""+rs.getInt("quot")+"\" />");                                                                            
                                                                            out.print("<td><input type=\"submit\" value=\"Accept\" name=\"Quot_Opn\"/></td>");
                                                                            out.print("<td><input type=\"submit\" value=\"Reject\" name=\"Quot_Opn\"/></td>");
                                                                            out.print("</form>");
                                                                        }
                                                                        
                                                                    else
                                                                        out.print("<td colspan=\"2\" align=\"center\">Quotation "+qtst+"</td>");
                                                                }
                                                            else
                                                                out.print("<td colspan='3'>Engineer Hasn't Given any Quotation Yet!</td>");

                                                            if(usrid.charAt(0)=='N')
                                                                {
                                                                    rs1 = stmt1.executeQuery("select eng_id from assigned_eng where case_id='"+rs.getString("case_id")+"'");
                                                                    while(rs1.next())
                                                                        temp = rs1.getString("eng_id");
                                                                    rs1.close();
                                                                    rs1 = stmt1.executeQuery("select * from engineer where eng_id='"+temp+"'");
                                                                    while(rs1.next())
                                                                        {
                                                                            out.print("<td align=\"center\" nowrap colspan=\"2\">"+rs1.getString("eng_name")+"</td>");
                                                                            out.print("<td align=\"center\" nowrap colspan=\"2\">"+rs1.getString("email")+"</td>");
                                                                            out.print("<td align=\"center\" nowrap colspan=\"2\">"+rs1.getString("mobile")+"</td>");

                                                                        }
                                                                    rs1.next();
                                                                }

                                                            out.print("</tr>");
                                                    }
                                                    rs.close();
                                                    if(p_chk)
                                                        out.print("<tr><td align=\"center\" colspan=\"10\" style=\"color:blue\">No Records Found</td></tr>");
                                            }
                                            out.println("</table>");
                                            out.print("<br>");
                                            out.print("<br>");
                                            if(usrid.charAt(0)!='E')
                                                out.print("<table align=\"center\" ><tr><td align=\"center\"><a href=\"Complain Lodging.jsp\" target=\"_top\">Lodge New Complain</a></td></tr></table>");
                                       }
                                else
                                    out.print("<table><tr><td align=\"center\"><h1>First You Have to Log in!</h1></td></tr></table>");
                                    stmt.close();
                                    stmt1.close();
                                    con.close();
                                    con1.close();
                                %>
                        </div>                        
                    </td>
                </tr>
                <tr align="center">
                    <td id="footer" colspan="6">
                        Contacts:<br>456/2, A.P.C. Road, Kolkata-700007.<br>Tel: 9433289564/033-25468758.
                    </td>
                </tr>
            </table>
    </body>
</html>


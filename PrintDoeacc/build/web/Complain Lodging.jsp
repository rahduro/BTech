<%-- 
    Document   : Complain Lodging
    Created on : Jun 29, 2009, 10:16:48 PM
    Author     : rinki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%--
    Document   : Home2
    Created on : Sep 13, 2009, 1:57:03 AM
    Author     : rinki
--%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complain Lodging</title>

        <script type="text/javascript">
            window.onload=mnav;
            function mnav(id) {
            var m = document.getElementById(id);
                for (var a = 1; a<=10; a++) {
                    if (document.getElementById('menu'+a)) {document.getElementById('menu'+a).style.display='none';}
                }
            if (m) {m.style.display='block';}
            }
            function login_chk()
            {
                if(document.getElementById("USSR").value=='E')
                    {
                        alert("Engineers can not Lodge Complaints!!");
                        return false;
                    }
                else if(document.getElementById("USSR").value=='NOUSER')
                        {
                             alert("You Have to Log In Before Lodging Complaints!!");
                             return false;
                        }
                else
                    {
                        var str = document.getElementById("Prblm_details").value;
                        var chk =0;
                        for(var i=0;i<str.length;i++)
                            if(str[i]!=' ')
                                {
                                    chk = 1;
                                    break;
                                }
                        if(str!="" || chk)
                            return true;
                        else
                            {
                                alert("Problem Description can't be empty!");
                                return false;
                            }
                    }
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
                width: 65%;
                margin-right: 5%;
                float: left;
                padding:0px 20px 20px;
            }
            #right1{
                width: 15%;
                float: left;
                border-style: groove;
                border-width: thick;
                border-color: #A52A2A;
                background: #FFF5EE;
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
                background: url("Final Images/bg.jpg") repeat;
            }
            input{
                 border-style: solid;
            }
            .spwhite {
                font-family: verdana, arial, sans-serif;
                font-size: 12px;
                font-weight: bold;
                color: #fff;
            }
            h1{
                font-size: x-large;
                color: #4169E1;
            }
            h3{
                font-size: medium;
                text-decoration: underline;
                text-transform: uppercase;
                color: #FF4500;
            }
        </style>
    </head>

    <body>
            <table id="out" align="center" width="650" border="0" cellspacing="0" cellpadding="">
                <tr id="header" bgcolor="#A05F3B">
                    <!--<td id="hdr-logo1" bgcolor="white" width=""><img id="image1" align="middle" src="Final Images/Care logo 1.jpg" height="160" width="200"/></td>-->
                    <!--<td id="hdr-logo1" bgcolor="#914B4B" width=""><img src="Final Images/Copy of customer_care.jpg" width="210" height="200" alt="Copy of customer_care"/>
                    </td>-->
                <td id="hdr-logo1" bgcolor="white" width=""><img id="image1" src="Final Images/Copy of CSR(1).jpg" width="208" height="190" alt="Copy of CSR(1)"/>
                    
                    </td>
                    <td id="hdr-name" colspan="3" bgcolor="" width="" style="color: #F0FFF0"><h1  style="font-size: xx-large; text-decoration: none; color: white;" align="center">TECHNOPRINT Printing and Services</h1></td>
                    <!--<td id="hdr-logo2" colspan="2" bgcolor="#A05F3B"><img id="image2" align="right" src="Final Images/paperflying03.jpg"/></td>-->
                    <!--<td id="hdr-logo2" colspan="2" bgcolor="#A05F3B"><img src="Final Images/paperflying03.jpg" width="600" height="225" alt="paperflying03"/>
                    </td>-->
                <td id="hdr-logo2" colspan="2" bgcolor=""><img id="image2" src="Final Images/technical support.jpg" width="600" height="225" alt="technical support"/>
                </td>
                    
                </tr>
                <tr id="row2">
                    <td valign="top" id="left-col" width="" style="">
                        <br>
                        <img src="Final Images/microchip-repair.jpg" width="208" height="60" alt="microchip-repair"/>
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
                    </td>
                    <td id="body" colspan="5" width="" bgcolor="">

                        <div id="left">                          
                                
                            <form name="F1" action="Complain Processing.jsp" method="post" onsubmit="return login_chk()">
                                <h1>Technical Support</h1>
                                <%!
                                    String url="jdbc:oracle:thin:@localhost:1521:xe", tmp, hold,slr="",model_take="";
                                    Connection con1=null, con2=null;
                                    Statement st=null;
                                    ResultSet rs=null, rs1=null;
                                    String usrid="",paswd="",us_type="",vld_dt="";
                                %>
                            
                                    <h3>Product Information</h3>
                                    <table>
                                        <tr>
                                            <td>
                                                Printer Type
                                            </td>
                                            <td>
                                            <select name="ModelNo">
                                            <%
                                            boolean uc=false;
                                            String bURL = request.getRequestURI();
                                            Class.forName("oracle.jdbc.driver.OracleDriver");
                                            con1=DriverManager.getConnection(url,"project","project");
                                            con2=DriverManager.getConnection(url,"project","project");

                                            HttpSession mSess = request.getSession(false);

                                            if(mSess!=null)
                                            {
                                                usrid = (String)mSess.getAttribute("UsRNamE");

                                                if(usrid!=null && !usrid.equals(""))
                                                {
                                                       uc = true;
                                                       //paswd = mSess.getAttribute("PasWD").toString();
                                                       us_type = (String)mSess.getAttribute("UsRTypE");
                                                       vld_dt = (String)mSess.getAttribute("ValUp2");

                                                       st=con1.createStatement();
                                                       rs = st.executeQuery("select serial_no from customer where cust_id='"+usrid+"'");

                                                       while(rs.next())
                                                           slr = rs.getString("serial_no");

                                                       rs.close();

                                                       rs = st.executeQuery("select model_no from saled_product where serial_no='"+slr+"'");

                                                       while(rs.next())
                                                           model_take = rs.getString("model_no");
                                                       rs.close();
                                                       st.close();
                                                }
                                            }
                                            try
                                            {
                                                if(uc && usrid.charAt(0)!='E')
                                                        out.print("<option>"+model_take+"</option>");
                                                else
                                                    {
                                                        st=con1.createStatement();
                                                        rs1=st.executeQuery("select printer_type from printer_type order by printer_type");
                                                        while(rs1.next())
                                                        {
                                                            tmp = rs1.getString("printer_type");
                                                        %>
                                                        <optgroup label="<%= tmp%> Printers">
                                                            <%
                                                            st=con2.createStatement();
                                                            rs=st.executeQuery("select model_no from printer_model where printer_type='"+tmp+"' order by model_no");
                                                            while(rs.next())
                                                            {
                                                                hold = rs.getString("model_no");
                                                            %>
                                                            <option> <%= hold %> </option>
                                                        <%  }
                                                            rs.close();
                                                        %>
                                                        </optgroup>
                                            <%
                                                        }
                                                    }
                                            %>
                                            </select>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <%
                                                if(uc)
                                                    out.print("<input type=\"hidden\" name=\"USSR\" id='USSR' value=\""+usrid.charAt(0)+"\" readonly=\"readonly\" />");
                                                else
                                                    out.print("<input type=\"hidden\" name=\"USSR\" id='USSR' value=\"NOUSER\" readonly=\"readonly\" />");
                                            %>
                                            <td>Product Serial No.</td>
                                            <%
                                                if(uc)
                                                    {
                                                        if(usrid.charAt(0)!='E')
                                                            out.print("<td><input type=\"text\" name=\"SerialNo\" value=\""+slr+"\" readonly></td>");
                                                        else
                                                            out.print("<td><input type=\"text\" name=\"SerialNo\" value=\"Undeifined\" readonly></td>");
                                                    }
                                                else
                                                    out.print("<td><input type=\"text\" name=\"SerialNo\"></td>");
                                            %>                                            
                                        </tr>
                                    </table>
                            
                                    <h3>Problem Information</h3>
                                    <table>
                                        <tr>
                                            <td>
                                                Problem Area
                                            </td>
                                            <td>
                                            <select name="Prblm_area">
                                            <%
                                                st=con1.createStatement();
                                                rs1=st.executeQuery("select prblm_area from problem_master order by prblm_code");
                                                while(rs1.next())
                                                {
                                                    tmp = rs1.getString("prblm_area");
                                             %>
                                                <option> <%= tmp %> </option>
                                             <%
                                                }
                                             %>
                                            </select>
                                            </td>
                                        </tr>
                                        <%
                                                rs1.close();
                                                st.close();
                                                con1.close();
                                                con2.close();
                                            }
                                            catch(Exception e){out.print(e.getMessage());}
                                        %>                                      
                                        <tr>
                                            <td>
                                                <br>Problem description
                                            </td>
                                            <td><br><textarea name="Prblm_details" id='Prblm_details' cols="50" rows="5"></textarea></td>
                                        </tr>
                                    </table>                              
                                    
                                <br><br>
                                <input style="border-style:outset" type="submit" value="Submit">
                                <input style="border-style:outset" type="reset" value="Reset">
                            </form>
                        </div>                        
                     
                        <div id="right1">                            
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
                                <input style="border-style:outset" type="submit" value="Log Out" name="logoff" />
                            </form>
                            <%
                            }
                            else
                            {
                            %>
                            <h3>Login</h3>
                            <form action="userchk.jsp" method="POST" id="F1">
                            <input type="hidden" name="backURL" value=<%= bURL %> />
                            User Name:
                            <input type="text" name="User Name" value="" /><br><br>
                            Password:
                            <input type="password" name="Password" value="" /><br><br>
                            <input style="border-style:outset" type="submit" value="Login" align="" />
                            </form>
                            <%
                            }
                            %>
                        </div>
                        
                        <div id="right">
                            <!--<br><img src="Final Images/welcome to support.jpg" width="195" height="280" alt="welcome to support"/>-->
                            <img src="Final Images/stressedwoman.jpg" width="195" height="130" alt="stressedwoman"/><br>
                            <img src="Final Images/customer-service (1).jpg" width="195" height="130" alt="customer-service (1)"/>
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






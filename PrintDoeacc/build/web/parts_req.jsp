<%-- 
    Document   : parts_req
    Created on : Oct 4, 2009, 1:12:56 AM
    Author     : rinki
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import = "java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parts Requisition</title>
        
        <script type="text/javascript">
            window.onload=mnav;
            function mnav(id)
            {
            var m = document.getElementById(id);
                for (var a = 1; a<=10; a++)
                {
                    if (document.getElementById('menu'+a)) {document.getElementById('menu'+a).style.display='none';}
                }
            if (m) {m.style.display='block';}
            }
            function resend()
            {
                var i=0;
                var tp = document.HF.Part1.value = document.F1.Part.value;
                var tm = document.HF.ModelNo1.value = document.F1.ModelNo.value;

                if(tp!="Select Any Part" && tm!="Select Your ModelNo")
                    {
                     while(document.F1.Part[i].value!=tp)
                        i++;
                    document.HF.pid.value=i;
                    i=0;

                    while(document.F1.ModelNo[i].value!=tm)
                        i++;
                    document.HF.mid.value=i;

                    var str = document.getElementById("QNT").value;

                    var chk = 0;
                    for(var i=0;i<str.length;i++)
                        if(str[i]!=' ')
                            {
                                chk = 1;
                                break;
                            }
                     if(str == "" || !chk || isNaN(str))
                     {
                         document.getElementById("QNT").value = "";
                         alert("Enter only Numeric Values in Quantity!");
                     }
                     else
                        {
                            document.HF.qt1.value = parseInt(document.F1.qt.value, 10);
                            document.HF.submit();
                        }                    
                   }
            }
            function mark()
            {
                if(document.HF.pid.value!="" && document.HF.mid.value!="")
                    {
                        document.F1.Part[document.HF.pid.value].selected="1";
                        document.F1.ModelNo[document.HF.mid.value].selected="1";
                        document.F1.qt.value = document.HF.qt1.value;
                    }
            }
            function field_chk()
            {
                var chk = 0,uchk = 0;
                var s = "";
                if(document.getElementById("PRTS").value == "Select Any Part")
                    {
                        uchk = 1;
                        s = s + "You Must Select Parts from the Drop-Down List!\n";
                    }
                var str = document.getElementById("QNT").value;
                var chk = 0;
                    for(var i=0;i<str.length;i++)
                        if(str[i]!=' ')
                            {
                                chk = 1;
                                break;
                            }
                if(document.getElementById("QNT").value == "" || !chk || isNaN(document.getElementById("QNT").value))
                {
                    uchk = 1;
                    s = s +"You Must Enter a Numeric Quantity Value!\n";
                }
                str = document.getElementById("Credit").value;
                chk = 0;
                for(var i=0;i<str.length;i++)
                        if(str[i]!=' ')
                            {
                                chk = 1;
                                break;
                            }
                if(document.getElementById("Credit").value == "" || !chk || isNaN(document.getElementById("Credit").value))
                {
                    uchk = 1;
                    s = s +"You Must Enter a Valid Credit Card Number!\n";
                }
                str = document.getElementById("CSC").value;
                chk = 0;
                for(var i=0;i<str.length;i++)
                        if(str[i]!=' ')
                            {
                                chk = 1;
                                break;
                            }
                if(document.getElementById("CSC").value == "" || !chk || isNaN(document.getElementById("CSC").value))
                {
                    uchk = 1;
                    s = s +"You Must Enter a Card Verification Number!\n";
                }
                str = document.getElementById("year").value;
                chk = 0;
                for(var i=0;i<str.length;i++)
                        if(str[i]!=' ')
                            {
                                chk = 1;
                                break;
                            }
                if(document.getElementById("year").value == "" || !chk || isNaN(document.getElementById("year").value))
                {
                    uchk = 1;
                    s = s +"You Must Enter A Valid Year!\n";
                }
                if(uchk==1)
                {
                     alert(s);
                     return false;
                }
                else
                    return true;
            }
            function login_chk()
            {
                if(document.getElementById("USSR").value=='E')
                    {
                        alert("Engineers can not Buy Parts!!");
                        return false;
                    }
                else if(document.getElementById("USSR").value=='A')
                    {
                        alert("AMC Customers are not allowed to Buy Parts!!");
                        return false;
                    }
                else if(document.getElementById("USSR").value=='NOUSER')
                        {
                             alert("You Have to Log In Before Buying Parts!!");
                             return false;
                        }
                else
                    {
                     return field_chk();
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
            #right{
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

    <body onload="mark()">
            <%!                     String url="jdbc:oracle:thin:@localhost:1521:xe";
                                    Connection con=null;
                                    Statement st=null;
                                    ResultSet rs=null;
                                    String usrid="",paswd="",us_type="",vld_dt="";
            %>
            <table id="out" align="center" width="650" border="0" cellspacing="0" cellpadding="">
                <tr id="header" bgcolor="">
                    <td id="hdr-logo1" bgcolor="white" width=""><img id="image1" align="middle" src="Final Images/Care logo 1.jpg" height="160" width="200"/></td>
                    <td id="hdr-name" colspan="3" bgcolor="#A05F3B" width="" style="color: #F0FFF0"><h1 style="font-size: xx-large; text-decoration: none; color: white;" align="center">TECHNOPRINT Printing and Services</h1></td>
                    <td id="hdr-logo2" colspan="2" bgcolor="#A05F3B"><img id="image2" align="right" src="Final Images/paperflying03.jpg"/></td>
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
                        <img id="image3" src="Final Images/printer_icon.jpg" width="207" height="210" alt="printer_icon"/>
       
                    </td>
                    <td id="body" colspan="5" width="" bgcolor="">

                        <div id="left">
                            <form name="HF" action="parts_req.jsp" method="POST">
                                <input type="hidden" name="Part1" value="" />
                                <input type="hidden" name="ModelNo1" value="" />
                                <input type="hidden" name="qt1" value="<%=request.getParameter("qt1")%>" />
                                <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>" />
                                <input type="hidden" name="mid" value="<%=request.getParameter("mid")%>" />
                            </form>
                            <%
                                        String hold="",tmp="",slr="",model_take="";
                                        int qnt= 0;
                                        double tot = 0.00 , mrp=0.00;
                                        boolean uc=false, chk = false;

                                        String bURL = request.getRequestURI();
                                        HttpSession mSess = request.getSession(false);

                                        Class.forName("oracle.jdbc.driver.OracleDriver");
                                        con=DriverManager.getConnection(url,"project","project");

                                        if(mSess!=null)
                                        {
                                            usrid = (String)mSess.getAttribute("UsRNamE");
                                        
                                            if(usrid!=null && !usrid.equals(""))
                                            {
                                                   uc = true;
                                                   //paswd = mSess.getAttribute("PasWD").toString();
                                                   us_type = (String)mSess.getAttribute("UsRTypE");
                                                   vld_dt = (String)mSess.getAttribute("ValUp2");

                                                   st=con.createStatement();
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
                                            hold=request.getParameter("Part1");
                                            tmp=request.getParameter("ModelNo1");

                                            if((hold!=null && tmp!=null) && (!hold.equals("Select Any Part") && !tmp.equals("Select Your ModelNo")))
                                                chk = true;

                                            if(chk)
                                            {
                                                            if(!request.getParameter("qt1").equals(""))
                                                                qnt = Integer.parseInt(request.getParameter("qt1"));

                                                            st=con.createStatement();
                                                            rs=st.executeQuery("select parts_mrp from parts where parts_name='"+hold+"' and model_no='"+tmp+"'");
                                                            while(rs.next())
                                                                mrp=rs.getDouble("parts_mrp");
                                                            tot = qnt*mrp;

                                                            rs.close();
                                                            st.close();
                                            }
                                        }
                                        catch(Exception e)
                                        {
                                            out.print(e.getMessage());
                                        }
                               %>
                               
                            <h1>Buy Parts Here</h1>
                            <form name="F1" action="parts_processing.jsp" method="post" onsubmit="return login_chk()">
                                <%
                                    if(uc)
                                        out.print("<input type=\"hidden\" name=\"USSR\" id=\"USSR\" value=\""+usrid.charAt(0)+"\" readonly=\"readonly\" />");
                                    else
                                        out.print("<input type=\"hidden\" name=\"USSR\" id=\"USSR\" value=\"NOUSER\" readonly=\"readonly\" />");
                                %>
                                    <h3>Product Information</h3>
                                    <table>
                                        <tr>
                                            <td>Part:<span style="color:red"> *</span></td>
                                            <td>
                                                <select name="Part" id='PRTS' onchange="resend()">
                                            <option>Select Any Part</option>
                                            <%                                           
                                            try
                                            {
                                                st=con.createStatement();
                                                rs=st.executeQuery("select unique parts_name from parts order by parts_name");
                                                while(rs.next())
                                                {
                                                    tmp = rs.getString("parts_name");
                                            %>                                                    
                                                <option><%= tmp %></option>
                                            <%
                                                }
                                            %>
                                            </select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Model No.:</td>
                                            <td>
                                                <%
                                                    if(uc && usrid.charAt(0)!='E')
                                                    {
                                                        out.print("<select name=\"ModelNo\" onchange=\"resend()\">");
                                                        out.print("<option>"+model_take+"</option>");
                                                    }
                                                    else
                                                        {
                                                            out.print("<select name=\"ModelNo\" onchange=\"resend()\">");
                                                            out.print("<option>Select Your ModelNo</option>");
                                                            st=con.createStatement();
                                                            rs=st.executeQuery("select unique model_no from parts order by model_no");
                                                            while(rs.next())
                                                            {
                                                                hold = rs.getString("model_no");
                                                                out.print("<option >"+hold+"</option>");
                                                            }                                                            
                                                            rs.close();
                                                            st.close();
                                                            con.close();
                                                        }
                                                        out.print("</select>");
                                                }
                                                catch(Exception e)
                                                {
                                                    out.print(e.getMessage());
                                                }
                                                %>                                                
                                            </td>
                                            <td style="font-size: large; font-weight: bold; color: blue">Price:</td>
                                            <td style="font-size: large; font-weight: bold">Rs:</td>
                                            <td style="font-size: large; font-weight: bold; color: red"><%= mrp %></td>
                                        </tr>

                                        <tr>
                                            <td>Quantity:<span style="color:red"> *</span></td>
                                            <td>
                                                <input type="text" name="qt" id='QNT' value="" size="10" onchange="resend()"/>
                                            </td>

                                            <td style="font-size: large; font-weight: bold; color: blue">Total Cost:</td>
                                            <td style="font-size: large; font-weight: bold">Rs:</td>
                                            <td style="font-size: large; font-weight: bold; color: red"><%= tot %></td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Serial No.:<span style="color:red"> *</span></td>
                                            <%
                                            if(uc)
                                                {
                                                    if(usrid.charAt(0)=='E')
                                                        out.print("<td><input type=\"text\" name=\"SerialNo\" value=\"Undefined\" readonly></td>");
                                                    else
                                                        out.print("<td><input type=\"text\" name=\"SerialNo\" value="+slr+" readonly></td>");
                                                }
                                            else
                                                out.print("<td><input type=\"text\" name=\"SerialNo\"></td>");
                                            %>
                                        </tr>
                                    </table>

                                    <H3>Payment Informations</H3>
                                    <table>
                                        <tr>
                                            <td>Card Type</td>
                                            <td>
                                                <select name="crd_type" id='crd_type'>
                                                    <option>Visa</option>
                                                    <option>Master Card</option>
                                                    <option>American Express</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Credit Card No.<span style="color:red"> *</span></td>
                                            <td><input type="text" name="Credit" value="" id='Credit' size="20" maxlength="16"/></td>
                                            <td>( no Spaces or Dashes )</td>
                                        </tr>
                                        <tr><td><br></td></tr>
                                        <tr>
                                            <td valign="top">Card Verification Number<br>(CVN or CSC)<span style="color:red"> *</span></td>
                                            <td valign="top"><input type="text" name="CSC" id='CSC' value="" size="8" maxlength="4"/></td>
                                            <td valign="top" style="border:solid black 1px">
<pre>
For MasterCard or Visa,
it's the last three digits
in the signature area on the
back of your card.For
American Express, it's the four
digits on the front of the card.
</pre>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td>Expiry Date<span style="color:red"> *</span></td>
                                            <td><select name="month">
                                                    <%
                                                        for(int i=1;i<=12;i++)
                                                            out.print("<option>"+i+"</option>");
                                                    %>
                                                </select><span>  month<span style="color:red"> *</span></span></td>
                                            <td><input type="text" name="year" id='year' value="" size="8" maxlength="4"/><span>  year<span style="color:red"> *</span></span></td>
                                        </tr>
                                    </table>

                                <br><br>
                                <input style="border-style: outset" type="submit" value="Submit">
                                <input style="border-style: outset" type="reset" value="Reset">
                            </form>
                        </div>                        
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
                                <input style="border-style: outset" type="submit" value="Log Out" name="logoff" />
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
                            <input style="border-style: outset" type="submit" value="Login" align="" />
                            </form>
                            <%
                            }
                            %>
                        </div>
                        <div id="right1">
                            <img id="image4" style="margin-top: 10px" src="Final Images/support_printers1.jpg" width="195" height="251" alt="support_printers1"/>
                            <img id="image5" style="margin-top: 0px" src="Final Images/printer.jpg" width="195" height="150" alt="printer"/>
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


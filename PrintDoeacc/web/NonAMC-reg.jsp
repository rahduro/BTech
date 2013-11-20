<%-- 
    Document   : index
    Created on : Jun 29, 2009, 1:00:56 PM
    Author     : rinki
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import = "java.sql.*" %>


<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Registration</title>

        <script type="text/javascript">
            window.onload=mnav;
            function mnav(id) 
            {
            var m = document.getElementById(id);
                for (var a = 1; a<=10; a++) {
                    if (document.getElementById('menu'+a)) {document.getElementById('menu'+a).style.display='none';}
                }
            if (m) {m.style.display='block';}
            }

            function validate_required(field, alert_txt)
            {
                with (field)
                {
                    if (value==null||value=="")
                    {
                        warning = warning + "* " + alert_txt + "\n";
                        return false;
                    }
                    else
                        return true;
                }
            }

            function validate_form(thisform)
            {
                var chk = 0,str,uchk = 0;
                warning="";

                with (thisform)
                {
                    if(validate_required(SerialNo,"Product Serial Number is left Empty!")==false)
                        chk = 1;
                    if(validate_required(CustName, "Customer or Company Name is left Empty!")==false)
                        chk = 1;
                    if(validate_required(ContactName, "Contact Name is left Empty!")==false)
                        chk = 1;
                    /*if(validate_required(Mobile, "Mobile Number is left Empty!")==false)
                        chk = 1;
                    if(validate_required(Email, "Email Address is left Empty!")==false)
                        chk = 1;
                    */
                    if(validate_required(Password, "Password Field is left Empty!")==false)
                        chk = 1;

                    if(chk==1)
                        uchk = 1;
                    
                    str = Mobile.value;
                    chk = 0;
                    for(var i=0;i<str.length;i++)
                            if(str[i]!=' ')
                                {
                                    chk = 1;
                                    break;
                                }
                    if(Mobile.value == "" || !chk || isNaN(Mobile.value))
                    {
                        uchk = 1;
                        warning = warning +"* Mobile Numbers Can Only be Numeric!\n";
                    }

                    str = Email.value;
                    var EmailRegEx = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                    if(!str.match(EmailRegEx))
                    {
                        uchk = 1;
                        warning = warning +"* Email Is Invalid!\n";
                    }
                    if(uchk==1)
                        {
                            alert(warning);
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
                        <img id="image3" src="Final Images/printer_icon.jpg" width="208" height="210" alt="printer_icon"/>
                            
                    </td>
                    <td id="body" colspan="5" width="" bgcolor="">

                        <div id="left">                           
                            <h1>Register Products</h1>
                            <p align="justify" style="font-family: sans-serif;"><br>If you have our product and haven’t yet registered it, register your product here to get all supports from our experts. Here registration is fully free of cost and valid for life long. You have to register each of your products separately.<br><br>
                            <form name="F1" onsubmit="return validate_form(this)" action="Reg Processing.jsp" method="post">
                                    <h3>Personal Information</h3>
                                    <table>
                                        <tr>
                                            <td>Customer or Company Name:<span style="color:red"> *</span></td>
                                            <td><input type="text" name="CustName" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>Contact Person Name:<span style="color:red"> *</span></td>
                                            <td><input type="text" name="ContactName" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>Address:</td>
                                            <td><input type="text" name="Address" size="50" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>City:</td>
                                            <td><input type="text" name="City" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>State:</td>
                                            <td><input type="text" name="State" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>Pin Code:</td>
                                            <td><input type="text" name="PinCode" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>Mobile:<span style="color:red"> *</span></td>
                                            <td><input maxlength="10" type="text" name="Mobile" size="10" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>Land Phone (with STD Code):</td>
                                            <td><input maxlength="12" type="text" name="LandPhone" size="10" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>E-mail:<span style="color:red"> *</span></td>
                                            <td><input type="text" name="Email" size="30" style="border-style: solid"></td>
                                        </tr>
                                        <tr>
                                            <td>Password:<span style="color:red"> *</span></td>
                                            <td><input maxlength="10" type="password" name="Password" value="" size="10" style="border-style: solid" /><span style="color:red"> (Max 10 Characters)</span></td>
                                        </tr>
                                    </table>
                                
                                <%! 
                                    String url, hold, tmp;
                                    Connection con1=null, con2=null;
                                    Statement st=null;
                                    ResultSet rs=null,rs1=null;
                                    String usrid="",paswd="",us_type="",vld_dt="";
                                %>
                                
                                    <h3>Product Information</h3>
                                    <table>
                                        <tr>
                                            <td>
                                                Printer Type:
                                            </td>
                                            <td>
                                            <select name="ModelNo">
                                            <%
                                            url="jdbc:oracle:thin:@localhost:1521:xe";
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
                                                       vld_dt = (String)mSess.getAttribute("ValUp2");
                                                }
                                            }
                                            try
                                            {
                                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                                con1=DriverManager.getConnection(url,"project","project");
                                                con2=DriverManager.getConnection(url,"project","project");
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
                                                <%  }   rs.close();%>
                                                </optgroup>
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
                                            <td>Product Serial No.:<span style="color:red"> *</span></td>
                                            <td><input type="text" name="SerialNo" style="border-style: solid"></td>
                                        </tr>
                                    </table>
                                
                                <br><br>
                                <input type="submit" value="Submit">
                                <input type="reset" value="Reset">
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
                                <input type="submit" value="Log Out" name="logoff" />
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
                            <input type="submit" value="Login" align="" />
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
                        contacts: <br>456/2, A.P.C. Road, Kolkata-700007.                 Tel: 9433289564/033-25468758.
                    </td>
                </tr>
            </table>
    </body>
</html>

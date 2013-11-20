<%-- 
    Document   : parts_processing
    Created on : Oct 4, 2009, 2:44:19 AM
    Author     : rinki
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import = "java.sql.*,java.util.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parts Procesing Page</title>

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
                margin-left: 2%;
                width: 65%;
                margin-right: 2%;
                border-style: solid;
                /*border-left-style: solid;
                border-right-style: solid;*/
                /*border-style: solid;*/
                border-color: #A52A2A;
                border-width: thin;
                float: left;
                padding:20px 20px 20px;
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

                    </td>
                    <td id="body" colspan="5" width="" bgcolor="">

                        <div id="left" align="center" style=" color: green; font-size: x-large">
                            <%!
                                String url="jdbc:oracle:thin:@localhost:1521:xe";
                                Connection con;
                                PreparedStatement ps;
                                ResultSet rs;
                                CallableStatement cs;
                                Statement stmt;
                                String usrid="",paswd="",us_type="",vld_dt="";
                            %>
                            <%
                                String prt, mno, slno, prt_id="",card_type,card_no,reqs="",trans="";
                                int qty,chk=0,chk1=0;
                                double mrp=0.0,totcost;
                                Calendar  cal = Calendar.getInstance();
                                java.sql.Date today = new java.sql.Date(cal.getTimeInMillis());

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

                                prt = request.getParameter("Part");
                                mno = request.getParameter("ModelNo");
                                slno = request.getParameter("SerialNo");
                                qty = Integer.parseInt(request.getParameter("qt").trim());
                                card_type = request.getParameter("crd_type");
                                card_no = request.getParameter("Credit").trim();
                                try
                                {                                    
                                    Class.forName("oracle.jdbc.driver.OracleDriver");
                                    con=DriverManager.getConnection(url, "project", "project");
                                    stmt = con.createStatement();

                                    rs= stmt.executeQuery("select * from parts where parts_name='"+prt+"' and model_no='"+mno+"'");

                                    while(rs.next())
                                        {
                                            mrp = rs.getDouble("parts_mrp");
                                            prt_id = rs.getString("parts_id");
                                        }
                                    rs.close();

                                    totcost = mrp*qty;
                                    
                                    cs=con.prepareCall("{call trans_proc(?)}");
                                    cs.registerOutParameter(1, Types.VARCHAR);
                                    cs.execute();
                                    int transid = cs.getInt(1);
                                    trans = "TR"+transid;
                                    cs.close();

                                    cs=con.prepareCall("{call req_proc(?)}");
                                    cs.registerOutParameter(1, Types.VARCHAR);
                                    cs.execute();
                                    int reqid = cs.getInt(1);
                                    reqs = "RQ"+reqid;
                                    cs.close();

                                    ps = con.prepareCall("insert into parts_reqs values(?,?,?,?,?)");
                                    ps.setString(1, reqs);
                                    ps.setString(2, usrid);
                                    ps.setString(3, prt_id);
                                    ps.setInt(4, qty);
                                    ps.setString(5, trans);
                                    chk = ps.executeUpdate();
                                    ps.close();

                                    ps = con.prepareCall("insert into transaction values(?,?,?,?,?)");
                                    ps.setString(1, trans);
                                    ps.setString(2, card_type);
                                    ps.setString(3, card_no);
                                    ps.setDouble(4, totcost);
                                    ps.setDate(5, today);
                                    chk1 = ps.executeUpdate();
                                    ps.close();

                                    stmt.close();
                                    con.close();
                                }
                                catch(Exception e)
                                {
                                    out.print(e.getMessage());
                                }
                                if(chk!=0 && chk1!=0)
                                    {
                                        %>
                                        <h1 align="center">Thank You For Purchasing</h1>
                                        <h2 align="center">Your Parts Requistion ID is <%= reqs %></h2>
                                        <h2 align="center">Your Transaction ID is <%= trans %></h2>
                                        <%
                                    }
                                        %>
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

<%-- 
    Document   : Clearing Paper Jams_BsIJ
    Created on : Oct 10, 2009, 3:15:48 AM
    Author     : rinki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BsIJ Clearing Paper Jams</title>

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
                width: 90%;
                margin-right: 2%;
                border-style: none;
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
                background: url("Final Images/bg.jpg") repeat;
            }
            .spwhite {
                font-family: verdana, arial, sans-serif;
                font-size: 12px;
                font-weight: bold;
                color: #fff;
            }
            #printer li a{
                cursor: pointer;
                padding-left: 10px;
                color: #fff;
                text-decoration: none;
                display: block;
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
        <%!
            String usrid="",paswd="",us_type="",vld_dt="";
        %>
        <%
            String bURL = request.getRequestURI();
            HttpSession mSess = request.getSession(false);
            boolean uc = false;

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
        %>
            <table id="out" align="center" width="650" border="0" cellspacing="0" cellpadding="">
                <tr id="header" bgcolor="">
                    <td id="hdr-logo1" bgcolor="white" width=""><img id="image1" align="middle" src="Final Images/internal-03.jpg" height="224" width="208"/></td>
                    <td id="hdr-name" colspan="3" bgcolor="#A05F3B" width="" style="color: #F0FFF0"><h1 style="font-size: xx-large; text-decoration: none; color: white;" align="center">TECHNOPRINT Printing and Services</h1></td>
                    <td id="hdr-logo2" colspan="2" bgcolor="#A05F3B"><img id="image2" align="right" src="Final Images/paperflying03.jpg"/></td>
                </tr>
                <tr id="row2">
                    <td valign="top" rowspan="0" id="left-col" width="" style="">
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
                        <br><br>
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
                    </td>



                    <td id="body" colspan="5" width="" bgcolor="" style="font-family: sans-serif;">
                        <div id="left">
                            <table border="0" cellpadding="5" style="padding: 0px;">
                                <tr>
                                    <td align="left" style="border: black; font-family: sans-serif; font-size: xx-large; font-weight: normal; color: #4169E1">Business Inkjet 1200 Printer - Clearing Paper Jams</td>
                                </tr>

                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Clearing paper jams</td>
                                </tr>
                                <tr>
                                    <td bgcolor="" style="border: none">
                                        <p><br>If print media is jammed in the printer, follow these instructions to clear the jam.<br>
                                        <ol type="1">
                                            <li style="list-style-type: decimal">Remove all media from the output tray.</li><br>
                                            <li style="list-style-type: decimal">
                                                Check the auto-duplex unit by following the instructions below.<br><br>
                                                <ol type="A">
                                                    <li style="list-style-type: upper-alpha">Push the button on either side of the auto-duplex unit and remove the unit.</li><br>
                                                        <img src="Final Images/Figure 1- Removing the auto-duplex unit.jpg" title="Figure 1: Removing the auto-duplex unit" width="356" height="214" alt="Figure 1- Removing the auto-duplex unit"/><br><br>
                                                    <li style="list-style-type: upper-alpha">Locate any jammed media inside the printer, grasp it with both hands and pull it towards you.</li><br>
                                                    <li style="list-style-type: upper-alpha">If the jam is not there, push the latch on the top of the auto-duplex unit and lower its cover. If the jam is inside, carefully remove it. Close the cover.</li><br>
                                                    <img src="Final Images/Figure 2- Latching on auto-duplex unit.jpg" title="Figure 2: Latching on auto-duplex unit" width="264" height="148" alt="Figure 2- Latching on auto-duplex unit"/><br><br>
                                                    <li style="list-style-type: upper-alpha">If the jam is not there, remove the rear cover from the auto-duplex unit (if installed) by pushing the buttons on either side of the cover and removing it. If the jam is inside, carefully remove it. Slide the rear cover back into the auto-duplex unit until it snaps into place.</li><br>
                                                    <li style="list-style-type: upper-alpha">Reinsert the auto-duplex unit into the printer.</li><br>
                                                </ol>
                                            </li><br>
                                            <li style="list-style-type: decimal">If you cannot locate the jam, lift the output tray and check for a jam in Tray 1. If media is jammed in the tray, do the following:</li><br>
                                                <ol type="A">
                                                    <li style="list-style-type: upper-alpha">Pull out Tray 1.</li><br>
                                                    <li style="list-style-type: upper-alpha">Pull the paper towards you.</li><br>
                                                        <img src="Final Images/Figure 3- Removing paper.jpg" title="Figure 3: Removing paper" width="280" height="170" alt="Figure 3- Removing paper"/><br><br>
                                                    <li style="list-style-type: upper-alpha">Reinsert the tray and lower the output tray.</li><br>
                                                </ol>
                                            <li style="list-style-type: decimal">If the jam has not been found and Tray 2 is installed, pull out the tray and remove the jammed media, if possible. If not, do the following:</li><br>
                                            <ol type="A">
                                                <li style="list-style-type: upper-alpha">Ensure the printer is turned off, and disconnect the power cord.</li><br>
                                                <li style="list-style-type: upper-alpha">Lift the printer off Tray 2.</li><br>
                                                <li style="list-style-type: upper-alpha">Remove the jammed media from the bottom of the printer or from Tray 2.</li><br>
                                                <li style="list-style-type: upper-alpha">Reposition the printer on top of Tray 2.</li><br>
                                            </ol>
                                            <li style="list-style-type: decimal">
                                                Open the top cover. If there is paper remaining inside the printer, ensure the carriage has moved to the right of the printer, free any paper scraps or wrinkled media and pull the media towards you through the top of the printer.
                                                <p style="color: red; padding-left: 3em"><b>WARNING:</b>	 Do not reach into the printer when the printer is on and the carriage is stuck. When you open the top cover, the carriage should return to its position on the right side of the printer. If it does not move to the right, turn off the printer before you remove any jam.</p>
                                            </li>
                                            <li style="list-style-type: decimal">After clearing the jam, close all covers, turn on the printer (if it was turned off), and then press the Resume button to continue printing.</li>
                                        </ol>
                                        The printer will continue printing the next page. You will need to resend any page that was jammed in the printer.<br><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Avoiding paper jams</td>
                                </tr>
                                <tr>
                                    <td bgcolor="" style="border: none">
                                        <p><br>To avoid paper jams, follow the guidelines below.
                                        <ul type="disc" style=" padding-left: 3em">
                                            <li style="list-style-type: disc">Make sure that nothing is blocking the paper path.</li>
                                            <li style="list-style-type: disc">Do not overload the trays.</li>
                                            <li style="list-style-type: disc">Load paper properly.</li>
                                            <li style="list-style-type: disc">Do not use media that is curled or crumpled.</li>
                                            <li style="list-style-type: disc">Always use media that conforms with specifications.</li>
                                            <li style="list-style-type: disc">Make sure the output tray is not overly full when you send a job to print.</li>
                                            <li style="list-style-type: disc">Make sure media is aligned against the right side of the tray.</li>
                                            <li style="list-style-type: disc">Make sure the media length and width guides are adjusted snugly against the media, but do not crinkle or bend it.</li>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>

                        </div>
                    </td>
                </tr>
                <tr align="center">
                    <td id="footer" colspan="6">
                        Contacts: <br>456/2, A.P.C. Road, Kolkata-700007. Tel: 9433289564/033-25468758.
                    </td>
                </tr>
            </table>
    </body>
</html>

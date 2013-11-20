<%-- 
    Document   : Paper Feed_ClIJ
    Created on : Oct 10, 2009, 3:37:42 PM
    Author     : rinki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ClIJ Paper Feed</title>

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
                                    <td align="left" style="border: black; font-family: sans-serif; font-size: xx-large; font-weight: normal; color: #4169E1">Color Inkjet 1150 Printer - Paper Feed Problems</td>
                                </tr>

                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Introduction</td>
                                </tr>
                                <tr>
                                    <td bgcolor="" style="border: none">
                                        <p><br>This document lists general and miscellaneous paper feed problems that may be encountered and possible solutions.<br>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Unsupported media may cause unexpected output</td>
                                </tr>
                                <tr>
                                    <td bgcolor="" style="border: none">
                                        <p><br>Using media that is beyond specification, either very thick or having a unique surface texture, may cause unexpected output. The following are some common results of using unsupported media:
                                        <ul type="disc" style=" padding-left: 3em">
                                            <li style="list-style-type: disc">The printer ejects a blank page.</li>
                                            <li style="list-style-type: disc">Printing starts lower on the page than expected.</li>
                                            <li style="list-style-type: disc">Inconsistent top margin from page to page.</li>
                                            <li style="list-style-type: disc">
                                                Poor print quality.
                                                <p><b>NOTE:</b>	 All HP Inkjet media is compatible with all HP Inkjet printers.
                                                <p><b>NOTE:</b>	 Load only plain paper in the lower paper tray (if present).
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Paper does not feed into the printer properly</td>
                                </tr>
                                <tr>
                                    <td bgcolor="" style="border: none">
                                        <p><br>If the paper does not feed into the printer properly, follow the suggestions below:
                                        <ul type="disc" style=" padding-left: 3em">
                                            <li style="list-style-type: disc">Reload the paper. Too many sheets of paper were loaded; remove some paper.</li>
                                            <li style="list-style-type: disc">The paper is damaged, wrinkled, or curled. Replace or remove the paper.</li>
                                            <li style="list-style-type: disc">Paper in the stack may be of a different type, size, and weight. Make sure papers in the stack are of the same type, size, and weight.</li>
                                            <li style="list-style-type: disc">
                                                Poor print quality.
                                                <p><b>NOTE:</b>	 All HP Inkjet media is compatible with all HP Inkjet printers.
                                                
                                            </li>
                                            <li style="list-style-type: disc">Make sure the paper weight is between 60 to 90 g/m2 (16 to 24 lb.) for letter size paper and between 75 to 90 g/m2 (20 to 24 lb.) for legal size paper when using the main paper tray.</li>
                                            <li style="list-style-type: disc">If the two-sided printing module (duplexer) is not being used, make sure the paper weight is not more than 200 g/m2 or 110 lb. index maximum for cards.</li><br>
                                            <li style="list-style-type: disc">If using the duplexer, the paper weight can be no more than 160 g/m2 or 90 lb. index for cards.</li><br>
                                            <li style="list-style-type: disc">
                                                Try a different type of paper. Try printing with HP media that is supported in the printer, preferably a 20-lb. bond or multipurpose paper. If the printing problems disappear, discontinue use of the problematic media.
<pre>
    <b>CAUTION:</b> Using media that is thicker or heavier than specified can cause damage
             to the printer.
</pre>
                                            </li><br>
                                            <li style="list-style-type: disc">
                                                The paper feed rollers are slipping and require cleaning. Follow the steps below:<br><br>
                                                <ol type="1">
                                                    <li style="list-style-type: decimal">Turn off the printer and unplug the power cord.</li><br>
                                                    <li style="list-style-type: decimal">If the two-sided printing module is installed, simultaneously press the release buttons located on each side of the module to remove it (see Figure 1).</li><br>
                                                    <li style="list-style-type: decimal">If the rear access door is attached, turn the knob on the rear access door counter-clockwise and remove the door.</li><br>
                                                    <li style="list-style-type: decimal">Wipe the feed rollers with a damp, lint-free cloth. Clean one section of the roller and then manually turn the feed rollers to enable cleaning of the entire roller.</li><br>
                                                    <li style="list-style-type: decimal">If reinstalling the two-sided printing module, do not press the buttons on the ends; push the module back into the printer until it snaps firmly into place.</li><br>
                                                    <li style="list-style-type: decimal">If reinstalling the rear access door, lock it in position by turning the knob on the door clockwise to the locked position.</li><br>
                                                    <li style="list-style-type: decimal">Plug in the power cord and turn on the printer.</li><br>
                                                    <li style="list-style-type: decimal">Print the document again.</li>
                                                </ol>
                                            </li><br>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Paper jams</td>
                                </tr>
                                <tr>
                                    <td bgcolor="" style="border: none">
                                        <p><br>Follow each of the steps below until the paper jam is cleared.
                                        <ol type="1">
                                            <li style="list-style-type: decimal">Press the RESUME button.</li><br>
                                            <li style="list-style-type: decimal">Remove the paper from the paper tray.</li><br>
                                            <li style="list-style-type: decimal">Detach the removable paper tray(s), remove any paper stuck in the paper tray slot, replace the tray(s), then press the RESUME button.</li><br>
                                            <li style="list-style-type: decimal">Open the printer front door, remove any visible paper, close the door, then press the RESUME button.</li><br>
                                            <li style="list-style-type: decimal">Remove the duplexer by pressing the release buttons on both sides of the duplexer, and then remove any visible paper jam in the printer. See Figure 1.</li><br>
                                                <table><caption align="top">Figure 1: Removing the duplexer</caption>
                                                    <tr>
                                                        <td>
                                                            <img src="Final Images/Figure 1 Removing the duplexer.jpg" title="Figure 1:  Removing the duplexer" width="240" height="165" alt="Figure 1 Removing the duplexer"/><br><br>
                                                        </td>
                                                    </tr>
                                                </table>                                                
                                            <li style="list-style-type: decimal">After the duplexer is removed, open the duplexer rear access door by pressing the button on top of the duplexer. Remove any paper from the duplexer and then close the rear access door.</li><br>
                                            <li style="list-style-type: decimal">Re-attach the duplexer, then press the RESUME button.</li><br>
                                        </ol>
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
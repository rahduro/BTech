<%--
    Document   : amc
    Created on : Sep 22, 2009, 5:33:06 PM
    Author     : rinki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Regular Tune Up and Maintenance</title>

        <script type="text/javascript">
            window.onload=mnav;
            function mnav(id) {
            var m = document.getElementById(id);
                for (var a = 1; a<=10; a++) {
                    if (document.getElementById('menu'+a)) {document.getElementById('menu'+a).style.display='none';}
                }
            if (m) {m.style.display='block';}
            }
            function el_ctl()
            {
              if(document.F3.care.disabled==true)
                 document.F3.care.disabled=false;
            }
            function babu()
            {
                document.F3.care.disabled=true;
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
                /*padding-top: 25px;*/
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
                width: 60%;
                margin-right: 2%;
                border-style: solid;
                float: left;
                padding:0px 20px 20px;
            }
            #right{
                width: 20%;
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

<body onload="babu()">
            <table id="out" align="center" width="650" border="0" cellspacing="0" cellpadding="0">
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
                        <br>
                    </td>
                    <td id="body" colspan="5" width="" bgcolor="" style="padding: 15px">
                        <form name="F3" action="amc_form.jsp" method="POST">
                            <table id="inner-body" width="100%" border="1" cellspacing="30" cellpadding="5">
                                <thead>
                                    <tr valign="top">
                                        <th colspan="2" align="left" style="border: none; color: #A05F3B; font-family: sans-serif">
                                            <input style="background: white; border: none; font-size: xx-large; font-weight: bold; color: #4169E1" type="text" size="35" name="care" readonly="readonly" value="Regular Tune Up and Maintenance" />
                                            <br>Get Peak Printer Performance
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td rowspan="2" width="55%" align="justify" style="border-left: none; border-right: none; border-bottom: none; border-top-style: solid; border-top-color: blue; border-top-width: thick; font-family: cursive">
                                            If you’re tired of your PC’s sluggish performance, it’s time for a tune-up. Simply give a call to our technicians to service your printers for comprehensive performance boosting.
                                            <p>You can buy Regular Tune Up and Maintenance Care Pack any time with in or out of the standard warranty period of your <b>Colour Laser Jet</b>, <b>Laser Jet</b> and <b>Photosmart</b> Printers only.
                                            <p>Regular Tune Up and Maintenance Care Pack includes checking if all its parts are properly working, clean the dust and environmental effect that can lead to problems or reduce performance, Test data communications, power supply, installation related issues like mounted properly etc.
                                        </td>
                                        <td style="border: none; background-color: #00008B; color: white; font-family: sans-serif; font-size: large">
                                            Purchase Regular Tune Up and Maintenance and get:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#6898d0" style="border: none">
                                            <ul style="padding: 1em;">                                                
                                                <li style="list-style-type: square;color: white; border-bottom-style: solid; border-bottom-width: thin; border-top-style: solid; border-top-width: thin; border-color: #00008B; padding: 10px 0px 10px; font-family: sans-serif; font-size: medium">Increased productivity—by keeping your Printer operation at peak performance</li>
                                                <li style="list-style-type: square;color: white; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #00008B; padding: 10px 0px 10px; font-family: sans-serif; font-size: medium">One-on-one assistance from an expert technician, including: Hardware diagnostics, General system advice, consultation and education and Instruction on how to perform future tune-ups yourself</li>
                                                <li style="list-style-type: square;color: white; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #00008B; padding: 10px 0px 10px; font-family: sans-serif; font-size: medium">24/7 e-mail support and toll-free assistance from our technicians</li>
                                                <li style="list-style-type: square;color: white; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #00008B; padding: 10px 0px 10px; font-family: sans-serif; font-size: medium">Extended parts and labor coverage*</li>
                                            </ul>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="justify" style="border-left: none; border-right: none; border-bottom: none; border-top-style: solid; border-top-color: #8B4513; border-top-width: medium; font-size: larger">
                                            <p><b>Extended coverage for your printer begins on the purchase date of the Regular Tune Up and Maintenance Care Pack and ends 1 year from that date.</b>
                                            <br>You can buy Regular Tune Up and Maintenance Care Pack any time with in or out of the standard warranty period of your Printers.
                                            <br><br><h3>Service limitations</h3>
                                            <ul style="padding: 1em;">
                                                <!--<li style="list-style-type: square">Must be purchased within 1 year of printer purchase date</li>-->
                                                <li style="list-style-type: square">Available only for Colour Laser Jet, Laser Jet and Photosmart Printers. </li>
                                                <li style="list-style-type: square">Assistance limited to Printer performance and problem prevention; does not include break/fix troubleshooting, or repair diagnosis</li>
                                                <li style="list-style-type: square">Single-use (One plan per product) Care Pack service available up to 1 year after Care Pack purchased. Nontransferable; expires if not used within that period.</li>
                                            </ul>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-left: none; border-right: none; border-bottom: none; border-top-style: solid; border-top-color: blue; border-top-width: medium">
                                            <select name="choice">
                                                <option>1 year</option>
                                            </select>
                                            <input onclick="el_ctl()" type="submit" value="Buy now" name="buy" />
                                        </td>
                                        <td style="border: none; color: #00008B; padding: 0">
                                            <table id="price" border="0" width="100%" cellspacing="1" cellpadding="3">
                                                <tbody>
                                                    <tr>
                                                        <td width="35%" align="left" style="color: #00008B; font-family:sans-serif; font-size: x-large; font-weight: bold">Price:</td>
                                                        <td width="35%" align="center" style="color: red; font-size: x-large">Rs.1000</td>
                                                        <td align="center" style="color: blue; font-size: large; font-weight: bold">(1 Year)</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </form>
                    </td>
                </tr>
                <tr align="center">
                    <td id="footer" colspan="6">
                        contacts: <br>456/2, A.P.C. Road, Kolkata-700007. Tel: 9433289564/033-25468758.
                    </td>
                </tr>
            </table>
    </body>
</html>
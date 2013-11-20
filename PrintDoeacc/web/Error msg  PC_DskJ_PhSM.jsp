<%-- 
    Document   : Error msg  PC_DskJ_PhSM
    Created on : Oct 10, 2009, 3:22:14 AM
    Author     : rinki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error msg on  PC_DskJ_PhSM</title>

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
                                    <td align="left" style="border: black; font-family: sans-serif; font-size: xx-large; font-weight: normal; color: #4169E1">Deskjet, and Photosmart Printers - In Windows Vista a'%1 Is Not a Valid Win32 Application' Error Message Displays on the Computer During Installation</td>
                                </tr>

                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Issue</td>
                                </tr>
                                <tr>
                                    <td bgcolor="" style="border: none">
                                        <p><br>When you install the product software in Windows Vista, the following error message displays:%1 is not a valid win32 application .
                                        <p>A defective printer software CD or a defective CD or DVD drive causes this issue.
                                        <p>Try the following solutions in the order presented to resolve the issue. When one of the solutions resolves the issue, there is no need to continue troubleshooting.<br><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Solution one:  Make sure that the computer CD or DVD drive is functioning correctly</td>
                                </tr>
                                <tr>
                                    <td>
                                    <p><br>If the computer has only one CD or DVD drive, or if the previous solutions did not work, make sure that the drive or drives function correctly. To determine hardware functionality, try another CD or a different drive if you have two on the computer.
                                    <br><b>NOTE:</b>	If the CD or DVD drive is not working correctly, the first solution in this document , is the best solution to use. Do not go to the next solution, which requires using the CD or DVD drive.<br><br>
                                </tr>
                                <tr>
                                    <td bgcolor="maroon" style="color: white; text-align: left; font-family: sans-serif; font-weight: bold">Solution two:  Copy the contents of the product software CD to the hard drive and install the software</td>
                                </tr>
                                <tr>
                                    <td bgcolor="" style="border: none">
                                        <p><br>The following steps help you to delete and replace all temporary files on your computer.
                                        <h3>Step one: Delete all the temporary files on the computer</h3>
                                        <ol>
                                            <li style="list-style-type: decimal">Click the Windows icon (<img src="Final Images/windows icon.gif" width="20" height="20" alt="windows icon"/>).</li><br>
                                            <li style="list-style-type: decimal">
                                                In the Start Search box, type temp , and then press Enter to open the temp folder.
                                                <br><b>NOTE:</b>	If the User Account Control window appears, click Continue .
                                            </li><br>
                                            <li style="list-style-type: decimal">In the temp folder, click Organize .</li><br>
                                            <li style="list-style-type: decimal">Click Select All .</li><br>
                                            <li style="list-style-type: decimal">With the files selected, click Organize , and then click Delete to delete all of the files in the temp folder.</li><br>
                                            <li style="list-style-type: decimal">Close the temp folder.</li><br>
                                        </ol>
                                        <h3>Step two: Create a new folder on the hard drive and copy the installation files to that folder</h3>
                                        <ol>
                                            <li style="list-style-type: decimal">Click the Windows icon (<img src="Final Images/windows icon.gif" width="20" height="20" alt="windows icon"/>) and then click Computer .</li><br>
                                            <li style="list-style-type: decimal">Double-click C:\ , where C is the letter of the hard drive where the files will be copied.</li><br>
                                            <li style="list-style-type: decimal">Create a new folder on the hard drive by right-clicking the empty pane in C:\, selecting New , and then clicking Folder .</li><br>
                                            <li style="list-style-type: decimal">Right-click the new folder, and then click Rename .</li><br>
                                            <li style="list-style-type: decimal">Type hpdisk to name the folder, and then press Enter .</li><br>
                                        </ol>
                                        <h3>Step three: Copy the installation files to the hard drive</h3>
                                        <ol>
                                            <li style="list-style-type: decimal">In the temp folder, click Organize .</li><br>
                                            <li style="list-style-type: decimal">Right-click the Windows icon (<img src="Final Images/windows icon.gif" width="20" height="20" alt="windows icon"/>) and then click Explore . Windows Explorer opens.</li><br>
                                            <li style="list-style-type: decimal">On the left side of the window, click the CD or DVD drive letter. The contents of the drive appear on the right side of the window.</li><br>
                                            <li style="list-style-type: decimal">Click Organize and then click Select All .</li><br>
                                            <li style="list-style-type: decimal">With the files selected, click Organize , and then click Copy .</li><br>
                                            <li style="list-style-type: decimal">Exit Windows Explorer.</li><br>
                                            <li style="list-style-type: decimal">Double-click the hpdisk folder created in Step two to open it.</li><br>
                                            <li style="list-style-type: decimal">
                                                Click Organize and then click Paste to paste the installation files in the hpdisk folder.
                                                <p><b>NOTE:</b>	If the error message 'Cannot copy from source disk or drive ' or 'Cannot copy specified file ' displays and other CDs work correctly in the CD or DVD drive, the HP printer software CD is probably defective. Go to Solution five: Order a replacement printer software CD.
                                            </li><br>
                                        </ol>
                                        <h3>Step four: Install the software from the hard drive</h3>
                                        <ol>
                                            <li style="list-style-type: decimal">Click the Windows icon (<img src="Final Images/windows icon.gif" width="20" height="20" alt="windows icon"/>) .</li><br>
                                            <li style="list-style-type: decimal">In the Start Search box, type C:\hpdisk\setup.exe (where C is the letter of the hard drive where the files were copied), and then press Enter .</li><br>
                                            <li style="list-style-type: decimal">Double-click C:\hpdisk\setup.exe .</li><br>
                                            <li style="list-style-type: decimal">On the User Account Control window, click Continue .</li><br>
                                            <li style="list-style-type: decimal">
                                                Follow the on-screen instructions to install the software.
                                                <p><b>NOTE:</b>	If the User Account Control window opens, click Continue .
                                            </li><br>
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
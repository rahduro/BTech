<%-- 
    Document   : amc_processing1
    Created on : Sep 30, 2009, 2:02:40 AM
    Author     : rinki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AMC Scheme1</title>

        <script type="text/javascript">
            window.onload=mnav;
            function mnav(id) {
            var m = document.getElementById(id);
                for (var a = 1; a<=10; a++) {
                    if (document.getElementById('menu'+a)) {document.getElementById('menu'+a).style.display='none';}
                }
            if (m) {m.style.display='block';}
            }
            /*function el_ctl()
            {
              if(document.F3.care.disabled==true)
                 document.F3.care.disabled=false;
            }
            function babu()
            {
                document.F3.care.disabled=true;
            }*/
            function warn_send()
            {                
                if(document.getElementById("warning"))
                {
                    alert(document.getElementById("warning").value);
                    window.location="Home.jsp";
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
            /*#left{
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
            }*/
            #left{
                margin-left: 2%;
                width: 65%;
                margin-right: 2%;
                border-style: solid;
                /*border-left-style: solid;
                border-right-style: solid;*/
                /*border-style: solid;*/
                border-color: #A52A2A;
                border-width: thick;
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
                    <td id="body" colspan="5" width="" bgcolor="">
                        <div id="left" align="center" style=" color: green; font-size: x-large">
                        <%!
                            String url="jdbc:oracle:thin:@localhost:1521:xe",pick[],trans="";
                            Connection con;
                            Statement stmt, stmt1;
                            PreparedStatement ps,ps1, ps2, ps3, ps4, ps5,ps6,ps7;
                            ResultSet rs, rs1, rs2, rs3, rs4;
                            CallableStatement cs=null;
                            String usrid="",paswd="",us_type="",vld_dt="";
                        %>
                        <%
                            int j,tmp,num=0,engjob[],valid_year=0,cnt,count=0,transid;
                            boolean wrn = false,success=true,uc = false;
                            double schmcost=0.0;
                            String temp_type="",eng_name="",eng_mob="",eng_email="",schmtype="",engid[],assgn_eng="",preid="",warn="",schm="",schmid="",c_id="", custnm="", cntname="", cust_type="", addr="", ct="", st="", pin="", mob="", lph="", eml="", mno="", slno="", pre="",cardtype="",cardno="";

                            Calendar cnow = Calendar.getInstance();
                            Calendar ctemp = Calendar.getInstance();
                            java.sql.Date today = new java.sql.Date(cnow.getTimeInMillis());
                            java.sql.Date dt = new java.sql.Date(cnow.getTimeInMillis());
                            java.sql.Date buydate = new java.sql.Date(cnow.getTimeInMillis());
                            java.sql.Date expdate = new java.sql.Date(cnow.getTimeInMillis());
                            java.sql.Date now = new java.sql.Date(cnow.getTimeInMillis());
                            java.sql.Date exp = new java.sql.Date(cnow.getTimeInMillis());

                            char c;
                            StringBuffer paswd = new StringBuffer();

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
                            String bURL = request.getRequestURI();

                            custnm=request.getParameter("CustName").trim();
                            cntname=request.getParameter("ContactName").trim();
                            addr=request.getParameter("Address").trim();
                            ct=request.getParameter("City").trim();
                            st=request.getParameter("State").trim();
                            pin=request.getParameter("PinCode").trim();
                            mob=request.getParameter("Mobile").trim();
                            lph=request.getParameter("LandPhone").trim();
                            eml=request.getParameter("Email").trim();
                            mno=request.getParameter("ModelNo").trim();
                            slno=request.getParameter("SerialNo").trim();
                            schm=request.getParameter("care").trim();

                            cardtype = request.getParameter("CreditType").trim();
                            cardno = request.getParameter("CreditNo").trim();

                            try
                            {
                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                con=DriverManager.getConnection(url, "project", "project");
                                
                                stmt=con.createStatement();
                                stmt1=con.createStatement();
                                rs4=stmt1.executeQuery("select * from amc_scheme where schm_name='"+schm+"'");

                                while(rs4.next())
                                {
                                       schmid=rs4.getString("schm_id");
                                       schmcost = rs4.getDouble("schm_cost");
                                       schmtype=rs4.getString("schm_type");
                                       valid_year=rs4.getInt("year");
                                }

                                //out.print("<p>Scheme Type"+schmtype);

                                ps1=con.prepareStatement("select * from saled_product where serial_no=?");
                                ps2=con.prepareStatement("select * from customer where serial_no=? and c_type='NAMC'");
                                ps3=con.prepareStatement("select * from contract where serial_no=?");
                                ps4=con.prepareStatement("insert into customer values(?,?,?,?,?,?,?,?,?,?,?,?)");

                                ps5=con.prepareStatement("update customer set cust_id=?,c_name=?,contact_name=?,c_type=?,address=?,city=?,state=?,pin=?,mobile=?,land_ph=?,emal=? where serial_no=? and c_type='NAMC'");

                                ps1.setString(1, slno);
                                ps2.setString(1, slno);
                                ps3.setString(1, slno);
                                ps5.setString(12, slno);

                                rs=stmt.executeQuery("select password from login");
                                rs1=ps1.executeQuery();
                                rs2=ps2.executeQuery();
                                rs3=ps3.executeQuery();

                                while(rs.next())
                                        count++;

                                pick = new String[count];

                                rs=stmt.executeQuery("select password from login");

                                j=0;
                                while(rs.next())
                                    {
                                        pick[j]=rs.getString("password");
                                        j++;
                                    }
                                rs.close();

                            }catch(Exception e)
                            {
                                out.print(e.getMessage());
                            }

                            Random r = new Random();

                            while(true)
                                {
                                    boolean chk = true;
                                    for(int i=0;i<6;i++)
                                        {
                                            tmp=r.nextInt(36);
                                            if(tmp<=9)
                                                c = (char)(48+tmp);
                                            else
                                                c = (char)(97+(tmp-10));
                                            paswd.append(c);
                                        }
                                    for(int i=0;i<count;i++)
                                        {
                                            if(pick[i].equals(paswd))
                                                {
                                                    chk = false;
                                                    break;
                                                }
                                        }
                                    if(chk)
                                        break;
                                }

                            rs=stmt.executeQuery("select count(eng_id) count_eng from engineer");

                            while(rs.next())
                                num = rs.getInt("count_eng");

                            engid = new String[num];
                            engjob = new int[num];

                            rs=stmt.executeQuery("select eng_id from engineer");
                            int i=0;
                            while(rs.next())
                                {
                                    engid[i]=rs.getString("eng_id");
                                    i++;
                                }

                            int min=999999;
                            for(j=0;j<num;j++)
                                {
                                        rs=stmt.executeQuery("select count(*) no_job from contract where eng_id='"+engid[j]+"'");
                                        cnt=0;
                                        while(rs.next())
                                            cnt = rs.getInt("no_job");
                                        rs=stmt.executeQuery("select count(*) no_job from assigned_eng where eng_id='"+engid[j]+"'");
                                        while(rs.next())
                                            cnt += rs.getInt("no_job");
                                        engjob[j]=cnt;
                                        if(cnt<min)
                                           {
                                                assgn_eng=engid[j];
                                                min=cnt;
                                           }
                                }
                                rs = stmt.executeQuery("select * from engineer where eng_id='"+assgn_eng+"'");
                                while(rs.next())
                                    {
                                        eng_name = rs.getString("eng_name");
                                        eng_mob = rs.getString("mobile");
                                        eng_email = rs.getString("email");
                                    }
                                rs.close();
                            try
                            {
                                    if(rs1.next())
                                    {
                                        if(rs1.getString("model_no").equals(mno))
                                        {
                                            rs1=ps1.executeQuery();

                                            while(rs1.next())
                                                {
                                                    buydate = rs1.getDate("sale_date");
                                                    expdate = rs1.getDate("warranty_xp_dt");
                                                }

                                            //out.print("<p> Buy Date :"+buydate);
                                            //out.print("<p> Expiry Date :"+expdate);

                                            ctemp.setTime(buydate);
                                            ctemp.add(Calendar.YEAR, 1);
                                            dt = new java.sql.Date(ctemp.getTimeInMillis());

                                            //out.print("<p> Modified Date :"+dt);

                                            if((schmid.equals("SCH01") || schmid.equals("SCH04")) && dt.before(now))
                                                {
                                                    warn = "Sorry, You Can not buy Accidental Damage Protection now for this product!";
                                                    wrn = true;
                                                }

                                            else if((schmid.equals("SCH03") || schmid.equals("SCH06")) && expdate.after(now))
                                                {
                                                    warn = "You can Only Buy Out of Warranty Support only when your procudt's Warranty has Expired!";
                                                    wrn = true;
                                                }

                                            else if(schmid.equals("SCH07") && !(mno.substring(0,4).equals("LasJ") || mno.substring(0,4).equals("ClLJ") || mno.substring(0,4).equals("PhSM")))
                                                {
                                                    warn = "Sorry, Regular Tune Up and Maintenance Support is not Available for your Product!";
                                                    wrn = true;
                                                }
                                            if(wrn)
                                            {
                                                out.print("<p>"+warn);
                                            %>
                                            <input type="hidden" name="warning" id='warning' value="<%= warn %>" readonly="readonly" />
                                            <%
                                            }
                                            else
                                            {
                                            //out.print("<p>Saled Item");

                                            pre="AM";
                                            cust_type="AMC";

                                            if(rs2.next())
                                            {
                                                System.out.println("Ki holo Dhukechis...!!");

                                                cs=con.prepareCall("{call reg_proc(?,?,?,?)}");
                                                cs.registerOutParameter(1, Types.VARCHAR);
                                                cs.setString(2, paswd.toString());
                                                cs.setString(3, pre);
                                                cs.setString(4, cust_type);

                                                cs.execute();

                                                c_id=cs.getString(1);
                                                cs.close();

                                                System.out.println("Ki holo Dhukechis...!!");
                                                rs=stmt.executeQuery("select cust_id from customer where serial_no='"+slno+"'");
                                                while(rs.next())
                                                    preid = rs.getString("cust_id");
                                                rs.close();

                                                stmt.execute("delete from login where usr_id='"+preid+"'");

                                                rs=stmt.executeQuery("select case_id from complain where cust_id='"+preid+"'");
                                                while(rs.next())
                                                    {
                                                        stmt.execute("delete from assigned_eng where case_id='"+rs.getString("case_id")+"'");
                                                    }
                                                rs.close();

                                                stmt.execute("delete from complain where cust_id='"+preid+"'");

                                                out.print("<p>Your Previous NAMC Account has been disabled, so Please re-register Your Pending Problems if there was any");

                                                ps5.setString(1, c_id);
                                                ps5.setString(2, custnm);
                                                ps5.setString(3, cntname);
                                                ps5.setString(4, cust_type);
                                                ps5.setString(5, addr);
                                                ps5.setString(6, ct);
                                                ps5.setString(7, st);
                                                ps5.setString(8, pin);
                                                ps5.setString(9, mob);
                                                ps5.setString(10, lph);
                                                ps5.setString(11, eml);
                                                cnt=ps5.executeUpdate();

                                                cs=con.prepareCall("{call trans_proc(?)}");
                                                cs.registerOutParameter(1, Types.VARCHAR);
                                                cs.execute();
                                                transid = cs.getInt(1);
                                                trans = "TR"+transid;
                                                cs.close();
                                                
                                                ps6=con.prepareStatement("insert into contract values(?,?,?,?,?,?,?,?,?)");

                                                ps6.setString(1, c_id);
                                                ps6.setString(2, mno);
                                                ps6.setString(3, slno);
                                                ps6.setString(4, schmid);
                                                ps6.setString(5, assgn_eng);
                                                ps6.setString(9, trans);

                                                ps6.setDate(8, now);
                                                if(schmtype.equals("ADP"))
                                                {
                                                    rs = stmt.executeQuery("select sale_date from saled_product where serial_no='"+slno+"'");
                                                    while(rs.next())
                                                        now = rs.getDate("sale_date");
                                                }
                                                ps6.setDate(6, now);

                                                cnow.setTime(now);
                                                cnow.add(Calendar.YEAR, valid_year);
                                                exp = new java.sql.Date(cnow.getTimeInMillis());

                                                ps6.setDate(7, exp);

                                                ps6.executeUpdate();
                                                out.print("<p>"+cnt+"Record Updated in Customer table from NAMC to AMC....");
                                                ps6.close();
                                            }
                                            else
                                            {
                                                //out.print("<p>Hurrriilala!");

                                                if(rs3.next())
                                                    {
                                                        //out.print("<p>Hurrriikaka!");

                                                        rs3=ps3.executeQuery();
                                                        boolean chk = false;

                                                        while(rs3.next())
                                                            {
                                                                rs = stmt.executeQuery("select schm_type from amc_scheme where schm_id='"+rs3.getString("scheme_id")+"'");

                                                                while(rs.next())
                                                                    temp_type = rs.getString("schm_type");

                                                                if(schmtype.equals(temp_type))
                                                                {
                                                                    dt = rs3.getDate("valid_upto");
                                                                    if(dt.after(now))
                                                                    {
                                                                        chk = true;
                                                                        break;
                                                                    }
                                                                }
                                                            }
                                                        if(!chk)
                                                        {
                                                            //out.print("<p>Hello Done!!");

                                                            cs=con.prepareCall("{call reg_proc(?,?,?,?)}");
                                                            cs.registerOutParameter(1, Types.VARCHAR);
                                                            cs.setString(2, paswd.toString());
                                                            cs.setString(3, pre);
                                                            cs.setString(4, cust_type);

                                                            cs.execute();

                                                            c_id=cs.getString(1);
                                                            cs.close();

                                                            ps4.setString(1, c_id);
                                                            ps4.setString(2, custnm);
                                                            ps4.setString(3, cntname);
                                                            ps4.setString(4, cust_type);
                                                            ps4.setString(5, addr);
                                                            ps4.setString(6, ct);
                                                            ps4.setString(7, st);
                                                            ps4.setString(8, pin);
                                                            ps4.setString(9, mob);
                                                            ps4.setString(10, lph);
                                                            ps4.setString(11, eml);
                                                            ps4.setString(12, slno);
                                                            cnt=ps4.executeUpdate();

                                                            out.print("<p>Hi Done!!");

                                                            cs=con.prepareCall("{call trans_proc(?)}");
                                                            cs.registerOutParameter(1, Types.VARCHAR);
                                                            cs.execute();
                                                            transid = cs.getInt(1);
                                                            trans = "TR"+transid;
                                                            cs.close();

                                                            ps6=con.prepareStatement("insert into contract values(?,?,?,?,?,?,?,?,?)");

                                                            ps6.setString(1, c_id);
                                                            ps6.setString(2, mno);
                                                            ps6.setString(3, slno);
                                                            ps6.setString(4, schmid);
                                                            ps6.setString(5, assgn_eng);
                                                            ps6.setString(9, trans);
                                                            
                                                            ps6.setDate(8, now);
                                                            if(schmtype.equals("ADP"))
                                                                {
                                                                        rs = stmt.executeQuery("select sale_date from saled_product where serial_no='"+slno+"'");
                                                                        while(rs.next())
                                                                            now = rs.getDate("sale_date");
                                                                }
                                                            ps6.setDate(6, now);

                                                            cnow.setTime(now);
                                                            cnow.add(Calendar.YEAR, valid_year);
                                                            exp = new java.sql.Date(cnow.getTimeInMillis());

                                                            ps6.setDate(7, exp);

                                                            ps6.executeUpdate();

                                                            //out.print("<p>"+cnt+"Record Inserted....");
                                                        }
                                                        else
                                                        {
                                                            out.print("<p>You Already have one AMC of this kind which hasn't expired yet!!");
                                                            success = false;
                                                        }

                                                    }
                                                    else
                                                    {
                                                        //out.print("<p>Hurrriibaba!");

                                                        cs=con.prepareCall("{call reg_proc(?,?,?,?)}");
                                                        cs.registerOutParameter(1, Types.VARCHAR);
                                                        cs.setString(2, paswd.toString());
                                                        cs.setString(3, pre);
                                                        cs.setString(4, cust_type);

                                                        cs.execute();

                                                        c_id=cs.getString(1);

                                                        ps4.setString(1, c_id);
                                                        ps4.setString(2, custnm);
                                                        ps4.setString(3, cntname);
                                                        ps4.setString(4, cust_type);
                                                        ps4.setString(5, addr);
                                                        ps4.setString(6, ct);
                                                        ps4.setString(7, st);
                                                        ps4.setString(8, pin);
                                                        ps4.setString(9, mob);
                                                        ps4.setString(10, lph);
                                                        ps4.setString(11, eml);
                                                        ps4.setString(12, slno);
                                                        cnt=ps4.executeUpdate();

                                                        cs=con.prepareCall("{call trans_proc(?)}");
                                                        cs.registerOutParameter(1, Types.VARCHAR);
                                                        cs.execute();
                                                        transid = cs.getInt(1);
                                                        trans = "TR"+transid;
                                                        cs.close();

                                                        ps6=con.prepareStatement("insert into contract values(?,?,?,?,?,?,?,?,?)");
                                                        ps6.setString(1, c_id);
                                                        ps6.setString(2, mno);
                                                        ps6.setString(3, slno);
                                                        ps6.setString(4, schmid);
                                                        ps6.setString(5, assgn_eng);
                                                        ps6.setString(9, trans);

                                                        ps6.setDate(8, now);
                                                        if(schmtype.equals("ADP"))
                                                                    {
                                                                            rs = stmt.executeQuery("select sale_date from saled_product where serial_no='"+slno+"'");
                                                                            while(rs.next())
                                                                                now = rs.getDate("sale_date");
                                                                    }
                                                        ps6.setDate(6, now);

                                                        cnow.setTime(now);
                                                        cnow.add(Calendar.YEAR, valid_year);
                                                        exp = new java.sql.Date(cnow.getTimeInMillis());

                                                        ps6.setDate(7, exp);
                                                        ps6.executeUpdate();

                                                        //out.print("<p>"+cnt+"Record Saved....");
                                                }
                                            }

                                            if(success)
                                            {
                                                ps7=con.prepareStatement("update login set valid_upto=? where usr_id='"+c_id+"'");
                                                ps7.setDate(1, exp);

                                                ps7.executeUpdate();

                                                ps = con.prepareCall("insert into transaction values(?,?,?,?,?)");
                                                ps.setString(1, trans);
                                                ps.setString(2, cardtype);
                                                ps.setString(3, cardno);
                                                ps.setDouble(4, schmcost);
                                                ps.setDate(5, today);
                                                ps.executeUpdate();
                                                ps.close();


                                                out.print("<p><b>Thank You for Registration!!</b>");
                                                out.print("<p>Your Scheme is\t<b><i>"+schm+"</i></b>");
                                                out.print("<p>Your UserId is\t<b><i>"+c_id+"</i></b>");
                                                out.print("<p>Your Transaction ID is <b><i>"+trans+"</i></b>");
                                                out.print("<p>Your Account Password is\t<b><i>"+paswd+"</i></b>");
                                                out.print("<p>The Engineer Who will provide Service to You is\t<b><i>"+eng_name+"</i></b>");
                                                out.print("<p>His Contact Number is\t<b><i>"+eng_mob+"</i></b>");
                                                out.print("<p>His Email ID is\t<b><i>"+eng_email+"</i></b>");
                                            }
                                        }
                                        }
                                        else
                                            out.print("<p>Serial_No and Model_No do not match!!");
                            }
                            else
                            {
                                out.print("Invalid Serial No......!!!<br>");
                            }
                            }
                            catch(Exception e)
                            {
                                out.print(e.getMessage());
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
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class account_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            String usrid="",paswd="",us_type="",vld_dt="",cname="",url = "jdbc:oracle:thin:@localhost:1521:xe",qtst,take_man[],take_namc[],temp;
            Connection con,con1;
            Statement stmt,stmt1;
            ResultSet rs,rs1;
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Account Page for any User</title>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            window.onload=mnav;\n");
      out.write("            function mnav(id) {\n");
      out.write("            var m = document.getElementById(id);\n");
      out.write("                for (var a = 1; a<=10; a++) {\n");
      out.write("                    if (document.getElementById('menu'+a)) {document.getElementById('menu'+a).style.display='none';}\n");
      out.write("                }\n");
      out.write("            if (m) {m.style.display='block';}\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            body{\n");
      out.write("                background-color: silver;\n");
      out.write("            }\n");
      out.write("            #out{\n");
      out.write("                /*margin-top: 70px;\n");
      out.write("                margin-bottom: 110px;*/\n");
      out.write("                border: green;\n");
      out.write("                border-width: thick;\n");
      out.write("            }\n");
      out.write("            #left-col{\n");
      out.write("                background-color: #00008B;\n");
      out.write("            }\n");
      out.write("            #body{\n");
      out.write("                padding-top: 25px;\n");
      out.write("                background-color: white;\n");
      out.write("                /*background-color: #FFEFD5;*/\n");
      out.write("                /*background-color: #F0FFFF;*/\n");
      out.write("            }\n");
      out.write("            #main{\n");
      out.write("                position:absolute;\n");
      out.write("                margin-top: 30px;\n");
      out.write("                left: 10%;\n");
      out.write("                width: 80%;\n");
      out.write("                border: 3px solid red;\n");
      out.write("                font-family: verdana, arial, sans-serif;\n");
      out.write("                font-size: 90%;\n");
      out.write("            }\n");
      out.write("            #header{\n");
      out.write("                /*border-collapse: separate;*/\n");
      out.write("            }\n");
      out.write("            #left{\n");
      out.write("                width: auto;\n");
      out.write("                margin-right: 5%;\n");
      out.write("                border-style: solid;\n");
      out.write("                float: left;\n");
      out.write("                padding:0px 20px 20px;\n");
      out.write("            }\n");
      out.write("            #right{\n");
      out.write("                margin-left: 10px;\n");
      out.write("                width: 8em;\n");
      out.write("                float: left;\n");
      out.write("                border-style: none;\n");
      out.write("                border-width: thick;\n");
      out.write("                border-color: #A52A2A;\n");
      out.write("                background: #6898d0;\n");
      out.write("                padding: 0px 40px 20px 20px;\n");
      out.write("            }\n");
      out.write("            #footer{\n");
      out.write("                background-color: #00008B;\n");
      out.write("                color: #87CEEB;\n");
      out.write("            }\n");
      out.write("            dl, dt, dd, ul, li {\n");
      out.write("                padding: 0;\n");
      out.write("                list-style-type: none;\n");
      out.write("                color: #000;\n");
      out.write("            }\n");
      out.write("            #menu {\n");
      out.write("                position: relative;\n");
      out.write("                top: 0em;\n");
      out.write("                left: 0em;\n");
      out.write("                width: 13em;\n");
      out.write("            }\n");
      out.write("            #menu dt {\n");
      out.write("                cursor: pointer;\n");
      out.write("                background: #6898d0 url(\"Final Images/arrow7.gif\") no-repeat left;\n");
      out.write("                padding-left: 8px;\n");
      out.write("                height: 25px;\n");
      out.write("                line-height: 25px;\n");
      out.write("                margin: 3px 0;\n");
      out.write("                border: 1px solid #2586d7;\n");
      out.write("                text-align: left;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("            #menu dt a {\n");
      out.write("                padding-left: 5px;\n");
      out.write("                color: #fff;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("            #menu dt a:hover {\n");
      out.write("                text-decoration: underline;\n");
      out.write("                color: #ff3e3e;\n");
      out.write("                background: #fff;\n");
      out.write("            }\n");
      out.write("            #menu dd {\n");
      out.write("                position: absolute;\n");
      out.write("                margin-left: 28px;\n");
      out.write("                z-index: 100;\n");
      out.write("                left: 8em;\n");
      out.write("                margin-top: -1.5em;\n");
      out.write("                width: 18em;\n");
      out.write("                background: #6898d0;\n");
      out.write("                border: 1px solid #2586d7;\n");
      out.write("            }\n");
      out.write("            #menu ul {\n");
      out.write("                padding: 1px;\n");
      out.write("            }\n");
      out.write("            #menu li {\n");
      out.write("                font-size: 85%;\n");
      out.write("                height: 25px;\n");
      out.write("                line-height: 25px;\n");
      out.write("                width: 21em;\n");
      out.write("            }\n");
      out.write("            #menu li a {\n");
      out.write("                padding-left: 10px;\n");
      out.write("                color: #fff;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("            #menu li a:hover {\n");
      out.write("                text-decoration: underline;\n");
      out.write("                color: #ff3e3e;\n");
      out.write("                background: #fff url('Final Images/arrow7.gif') no-repeat left;\n");
      out.write("            }\n");
      out.write("            #hdr-name {\n");
      out.write("                background: url(\"Final Images/bg.jpg\") repeat-x;                \n");
      out.write("            }\n");
      out.write("            .spwhite {\n");
      out.write("                font-family: verdana, arial, sans-serif;\n");
      out.write("                font-size: 12px;\n");
      out.write("                font-weight: bold;\n");
      out.write("                color: #fff;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("\n");
      out.write("            <table id=\"out\" align=\"center\" width=\"650\" border=\"0\" cellspacing=\"0\" cellpadding=\"\">\n");
      out.write("                <tr id=\"header\" bgcolor=\"\">\n");
      out.write("                    <td id=\"hdr-logo1\" bgcolor=\"white\" width=\"\"><img id=\"image1\" align=\"middle\" src=\"Final Images/Care logo 1.jpg\" height=\"160\" width=\"200\"/></td>\n");
      out.write("                    <td id=\"hdr-name\" style=\"color: #F0FFF0\"><h1 align=\"center\">TECHNOPRINT<br>Printing and Services</h1></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr id=\"row2\">\n");
      out.write("                    <td valign=\"top\" id=\"left-col\" width=\"\" style=\"\">\n");
      out.write("                        <br><br>\n");
      out.write("                        <dl id=\"menu\">\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu1');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"Home.jsp\">Home</a></dt>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu2');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"#\">About us</a></dt>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu3');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"support_trouble.jsp\">Support & Troubleshooting</a></dt>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu4');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"NonAMC-reg.jsp\">Product Registration</a></dt>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu5');\"><a class=\"spwhite\" href=\"#\">Care Pack Solutions</a></dt>\n");
      out.write("                                <dd id=\"menu5\" onmouseover=\"javascript:mnav('menu5');\" onmouseout=\"javascript:mnav();\">\n");
      out.write("                                    <ul>\n");
      out.write("                                        <li><a href=\"amc1.jsp\">Accidental Damage Protection</a></li>\n");
      out.write("                                        <li><a href=\"amc2.jsp\">House Call Support</a></li>\n");
      out.write("                                        <li><a href=\"amc3.jsp\">Out Of Warranty Support</a></li>\n");
      out.write("                                        <li><a href=\"amc4.jsp\">Regular Tune Up and Maintenance</a></li>\n");
      out.write("                                     </ul>\n");
      out.write("                                </dd>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu6');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"parts_req.jsp\">Order Parts</a></dt>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu7');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"Complain Lodging.jsp\">Complain Lodging</a></dt>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu8');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"warranty_form.jsp\">Check warranty</a></dt>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu9');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"#\">Contact us</a></dt>\n");
      out.write("                        </dl>\n");
      out.write("                        <div id=\"right\">\n");
      out.write("                            <p>\n");
      out.write("                            ");

                            if(uc)
                            {
                            
      out.write("\n");
      out.write("                            <b>Usrid :</b>\n");
      out.write("                            <br>    <a href=\"account.jsp\"><i>");
      out.print( usrid );
      out.write("</i> </a>\n");
      out.write("                            <br><br>    <b>Account : </b><i>");
      out.print( us_type );
      out.write("</i>\n");
      out.write("                            <br><br>    <b>Valid Upto:</b>\n");
      out.write("                            <br>    <i>");
      out.print( vld_dt );
      out.write("</i>\n");
      out.write("                            <br><br><form name=\"T1\" action=\"logout.jsp\" method=\"POST\">\n");
      out.write("                                <input type=\"hidden\" name=\"backURL\" value=");
      out.print( bURL );
      out.write(" />\n");
      out.write("                                <input type=\"submit\" value=\"Log Out\" name=\"logoff\" />\n");
      out.write("                            </form>\n");
      out.write("                            ");

                            }
                            else
                            {
                            
      out.write("\n");
      out.write("                            <h2>Login</h2>\n");
      out.write("                            <form action=\"userchk.jsp\" method=\"POST\" id=\"F1\">\n");
      out.write("                            <input type=\"hidden\" name=\"backURL\" value=");
      out.print( bURL );
      out.write(" />\n");
      out.write("                            User Name:\n");
      out.write("                            <input type=\"text\" name=\"User Name\" value=\"\" /><br><br>\n");
      out.write("                            Password:\n");
      out.write("                            <input type=\"password\" name=\"Password\" value=\"\" /><br><br>\n");
      out.write("                            <input type=\"submit\" value=\"Login\" align=\"\"  />\n");
      out.write("                            </form>\n");
      out.write("                            ");

                            }
                            
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </td>\n");
      out.write("                    <td id=\"body\" colspan=\"\" width=\"\" bgcolor=\"\">\n");
      out.write("                        <div id=\"left\">\n");
      out.write("                                ");

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
                                
      out.write("\n");
      out.write("                                <table align=\"center\" width=\"100%\" border=\"1\">\n");
      out.write("                                    ");

                                    if(usrid.charAt(0)=='E')
                                        {
                                    
      out.write("\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td align=\"center\" colspan=\"16\"><b style=\"text-decoration:underline;color:green\">Profile Information</b></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <th colspan=\"4\" align=\"center\">Engineer ID</th>\n");
      out.write("                                        <th colspan=\"4\" align=\"center\">Name</th>\n");
      out.write("                                        <th colspan=\"4\" align=\"center\">Contact Number</th>\n");
      out.write("                                        <th colspan=\"4\" align=\"center\">Email</th>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        ");

                                            rs = stmt.executeQuery("select * from Engineer where eng_id='"+usrid+"'");
                                            while(rs.next())
                                                {
                                        
      out.write("\n");
      out.write("                                        <td colspan=\"4\" align=\"center\">");
      out.print( rs.getString("eng_id") );
      out.write("</td>\n");
      out.write("                                        <td colspan=\"4\" align=\"center\">");
      out.print( rs.getString("eng_name") );
      out.write("</td>\n");
      out.write("                                        <td colspan=\"4\" align=\"center\">");
      out.print( rs.getString("mobile") );
      out.write("</td>\n");
      out.write("                                        <td colspan=\"4\" align=\"center\">");
      out.print( rs.getString("email") );
      out.write("</td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr><td style=\"border:none\"><br><br></td></tr>\n");
      out.write("                                        ");

                                                }
                                            rs.close();
                                            out.print("<tr><td colspan=\"16\" align=\"center\"><b style=\"text-decoration:underline;color:green\" >AMC Customer Information</b></td></tr>");
                                        
      out.write("\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th>Customer ID</th>\n");
      out.write("                                            <th>Customer Name</th>\n");
      out.write("                                            <th>Contact Name</th>\n");
      out.write("                                            <th colspan=\"2\">Address</th>\n");
      out.write("                                            <th>City</th>\n");
      out.write("                                            <th>State</th>\n");
      out.write("                                            <th>PinCode</th>\n");
      out.write("                                            <th>Mobile</th>\n");
      out.write("                                            <th>Land Line</th>\n");
      out.write("                                            <th>Email</th>\n");
      out.write("                                            <th colspan=\"2\">Serial No</th>\n");
      out.write("                                            <th>Valid From</th>\n");
      out.write("                                            <th>Valid From</th>\n");
      out.write("                                            <th>Created On</th>\n");
      out.write("                                        </tr>\n");
      out.write("                                        ");

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
                                        
      out.write("\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("cust_id"));
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("c_name"));
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("contact_name"));
      out.write("</td>\n");
      out.write("                                            <td colspan=\"2\" align=\"center\">");
      out.print( rs.getString("address"));
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("city"));
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("state"));
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("pin"));
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("mobile"));
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("land_ph"));
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( rs.getString("emal"));
      out.write("</td>\n");
      out.write("                                            <td colspan=\"2\" align=\"center\">");
      out.print( rs.getString("serial_no"));
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                            <td align=\"center\">");
      out.print( vlfrm);
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( vlupto);
      out.write("</td>\n");
      out.write("                                            <td align=\"center\">");
      out.print( crton);
      out.write("</td>\n");
      out.write("                                        </tr>                                        \n");
      out.write("                                        ");

                                                        }
                                                    rs.close();
                                                }
                                                if(p_chk)
                                                        out.print("<tr><td align=\"center\" colspan=\"17\" style=\"color:blue\">No Records Found</td></tr>");
                                        
      out.write("\n");
      out.write("                                        <tr><td style=\"border:none\"><br><br></td></tr>\n");
      out.write("                                        <tr><td colspan=\"16\" align=\"center\"><b style=\"text-decoration:underline;color:green\">NAMC Customer Information</b></td></tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\">Customer ID</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\">Customer Name</th>\n");
      out.write("                                                            <th align=\"center\">Contact Name</th>\n");
      out.write("                                                            <th colspan=\"3\" align=\"center\">Address</th>\n");
      out.write("                                                            <th align=\"center\">City</th>\n");
      out.write("                                                            <th align=\"center\">State</th>\n");
      out.write("                                                            <th align=\"center\">Pin Code</th>\n");
      out.write("                                                            <th align=\"center\">Mobile</th>\n");
      out.write("                                                            <th align=\"center\">LandLine</th>\n");
      out.write("                                                            <th align=\"center\">Email</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\">Serial No</th>\n");
      out.write("                                        </tr>\n");
      out.write("                                        ");

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
                                        
      out.write("\n");
      out.write("                                                        <tr>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\">");
      out.print( rs.getString("cust_id"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\">");
      out.print( rs.getString("c_name"));
      out.write("</td>\n");
      out.write("                                                            <td align=\"center\">");
      out.print( rs.getString("contact_name"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"3\" align=\"center\">");
      out.print( rs.getString("address"));
      out.write("</td>\n");
      out.write("                                                            <td align=\"center\">");
      out.print( rs.getString("city"));
      out.write("</td>\n");
      out.write("                                                            <td align=\"center\">");
      out.print( rs.getString("state"));
      out.write("</td>\n");
      out.write("                                                            <td align=\"center\">");
      out.print( rs.getString("pin"));
      out.write("</td>\n");
      out.write("                                                            <td align=\"center\">");
      out.print( rs.getString("mobile"));
      out.write("</td>\n");
      out.write("                                                            <td align=\"center\">");
      out.print( rs.getString("land_ph"));
      out.write("</td>\n");
      out.write("                                                            <td align=\"center\">");
      out.print( rs.getString("emal"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\">");
      out.print( rs.getString("serial_no"));
      out.write("</td>\n");
      out.write("                                                        </tr>\n");
      out.write("                                     ");

                                                       }
                                                    rs.close();
                                               }
                                            if(p_chk)
                                                        out.print("<tr><td align=\"center\" colspan=\"17\" style=\"color:blue\">No Records Found</td></tr>");

                                     }
                                    else
                                        {
                                                    
      out.write("\n");
      out.write("                                                    <tr>\n");
      out.write("                                                        <td align=\"center\" colspan=\"24\"><b style=\"text-decoration:underline;color:green\">Profile Information</b></td>\n");
      out.write("                                                    </tr>\n");
      out.write("                                                    ");

                                                    rs = stmt.executeQuery("select * from customer where cust_id='"+usrid+"'");
                                                    while(rs.next())
                                                        {
                                                    
      out.write("\n");
      out.write("                                                        <tr>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>Customer ID</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>Customer Name</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>Contact Name</th>\n");
      out.write("                                                            <th colspan=\"4\" align=\"center\" nowrap>Address</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>City</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>State</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>PinCode</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>Mobile</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>Land Line</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>Email</th>\n");
      out.write("                                                            <th colspan=\"2\" align=\"center\" nowrap>Product Serial No</th>\n");
      out.write("                                                        </tr>\n");
      out.write("                                                        <tr>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("cust_id"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("c_name"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("contact_name"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"4\" align=\"center\" nowrap>");
      out.print( rs.getString("address"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("city"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("state"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("pin"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("mobile"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("land_ph"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("emal"));
      out.write("</td>\n");
      out.write("                                                            <td colspan=\"2\" align=\"center\" nowrap>");
      out.print( rs.getString("serial_no"));
      out.write("</td>\n");
      out.write("                                                        </tr>\n");
      out.write("                                                        <tr><td style=\"border:none\"><br><br></td></tr>\n");
      out.write("                                                        ");

                                                        }
                                                        rs.close();
                                                        if(usrid.charAt(0)=='A')
                                                        {
                                                        
      out.write("\n");
      out.write("                                                        <tr><td align=\"center\" colspan=\"24\"><b style=\"text-decoration:underline;color:green\">Engineer Information</b></td></tr>\n");
      out.write("                                                        <tr>\n");
      out.write("                                                            <th align=\"center\" colspan=\"8\">Engineer's Name</th>\n");
      out.write("                                                            <th align=\"center\" colspan=\"8\">Engineer's Mobile</th>\n");
      out.write("                                                            <th align=\"center\" colspan=\"8\">Engineer's Email</th>\n");
      out.write("                                                        </tr>\n");
      out.write("                                                        ");
                                                                                                                
                                                        rs = stmt.executeQuery("select * from engineer where eng_id='"+take_man[0]+"'");
                                                        while(rs.next())
                                                            {
                                                        
      out.write("\n");
      out.write("                                                             <tr>\n");
      out.write("                                                                 <td align=\"center\" colspan=\"8\">");
      out.print( rs.getString("eng_name"));
      out.write("</td>\n");
      out.write("                                                                 <td align=\"center\" colspan=\"8\">");
      out.print( rs.getString("mobile"));
      out.write("</td>\n");
      out.write("                                                                 <td align=\"center\" colspan=\"8\">");
      out.print( rs.getString("email"));
      out.write("</td>\n");
      out.write("                                                             </tr>\n");
      out.write("                                                        ");

                                                     
                                                            }
                                                        }
                                                        out.print("<tr><td style=\"border:none\"><br><br></td></tr>");
                                     }
                                     
      out.write("\n");
      out.write("                                </table>\n");
      out.write("                                    <br>\n");
      out.write("                                    <br>\n");
      out.write("                                 ");

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
                                
      out.write("\n");
      out.write("                        </div>                        \n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr align=\"center\">\n");
      out.write("                    <td id=\"footer\" colspan=\"6\">\n");
      out.write("                        Contacts:<br>456/2, A.P.C. Road, Kolkata-700007.<br>Tel: 9433289564/033-25468758.\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

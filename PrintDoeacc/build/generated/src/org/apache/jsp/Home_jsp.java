package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            String usrid="",paswd="",us_type="",vld_dt="";
        
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Home Page</title>\n");
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
      out.write("                /*margin-top: 70px;*/\n");
      out.write("                /*margin-bottom: 110px;*/\n");
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
      out.write("                width: 65%;\n");
      out.write("                margin-right: 5%;\n");
      out.write("                float: left;\n");
      out.write("                padding:0px 20px 20px;\n");
      out.write("            }\n");
      out.write("            #right{\n");
      out.write("                width: 15%;\n");
      out.write("                float: left;\n");
      out.write("                border-style: groove;\n");
      out.write("                border-width: thick;\n");
      out.write("                border-color: #A52A2A;\n");
      out.write("                background: #FFF5EE;\n");
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
      out.write("                background: url(\"Final Images/bg.jpg\") repeat;\n");
      out.write("            }\n");
      out.write("            .spwhite {\n");
      out.write("                font-family: verdana, arial, sans-serif;\n");
      out.write("                font-size: 12px;\n");
      out.write("                font-weight: bold;\n");
      out.write("                color: #fff;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("            <table id=\"out\" align=\"center\" width=\"650\" border=\"0\" cellspacing=\"0\" cellpadding=\"\">\n");
      out.write("                <tr id=\"header\" bgcolor=\"\">\n");
      out.write("                    <td id=\"hdr-logo1\" bgcolor=\"white\" width=\"\"><img id=\"image1\" align=\"middle\" src=\"Final Images/Care logo 1.jpg\" height=\"160\" width=\"200\"/></td>\n");
      out.write("                    <td id=\"hdr-name\" bgcolor=\"#A05F3B\" width=\"\" style=\"color: #F0FFF0\"><h1 align=\"center\">TECHNOPRINT Printing and Services</h1></td>\n");
      out.write("                    <td id=\"hdr-logo2\" bgcolor=\"#A05F3B\"><img id=\"image2\" align=\"right\" src=\"Final Images/paperflying03.jpg\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr id=\"row2\">\n");
      out.write("                    <td valign=\"top\" id=\"left-col\" width=\"\" style=\"\">\n");
      out.write("                        <br><br>\n");
      out.write("                        <dl id=\"menu\">\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu1');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"Home.jsp\">Home</a></dt>\n");
      out.write("                            \n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu2');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"#\">About us</a></dt>\n");
      out.write("                                \n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu3');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"support_trouble.jsp\">Support & Troubleshooting</a></dt>\n");
      out.write("                                \n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu4');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"NonAMC-reg.jsp\">Product Registration</a></dt>\n");
      out.write("                               \n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu5');\"><a class=\"spwhite\" href=\"#\">Care Pack Solutions</a></dt>\n");
      out.write("                                <dd id=\"menu5\" onmouseover=\"javascript:mnav('menu5');\" onmouseout=\"javascript:mnav();\">\n");
      out.write("                                    <ul>\n");
      out.write("                                        <li><a href=\"amc1.jsp\">Accidental Damage Protection</a></li>\n");
      out.write("                                        <li><a href=\"amc2.jsp\">House Call Support</a></li>\n");
      out.write("                                        <li><a href=\"amc3.jsp\">Out Of Warranty Support</a></li>\n");
      out.write("                                        <li><a href=\"amc4.jsp\">Regular Tune Up and Maintenance</a></li>\n");
      out.write("                                     </ul>                                                                           \n");
      out.write("                                </dd>\n");
      out.write("\n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu6');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"parts_req.jsp\">Order Parts</a></dt>\n");
      out.write("                               \n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu7');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"Complain Lodging.jsp\">Complain Lodging</a></dt>\n");
      out.write("                              \n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu8');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"warranty_form.jsp\">Check warranty</a></dt>\n");
      out.write("                               \n");
      out.write("                            <dt onmouseover=\"javascript:mnav('menu9');\" onmouseout=\"javascript:mnav();\"><a class=\"spwhite\" href=\"#\">Contact us</a></dt>\n");
      out.write("                               \n");
      out.write("                        </dl>\n");
      out.write("                        <br>\n");
      out.write("                        <!--<img align=\"\" id=\"image3\" src=\"Final Images/composer1.jpg\" width=\"208\" height=\"160\" alt=\"composer1\"/>-->\n");
      out.write("                            \n");
      out.write("                    </td>\n");
      out.write("                    <td id=\"body\" colspan=\"5\" width=\"\" bgcolor=\"\">\n");
      out.write("                                                \n");
      out.write("                        <div id=\"left\">\n");
      out.write("                            <p align=\"justify\">\n");
      out.write("                                TechnoPrint is a world's leading printer manufacturer and service provider. Our highly professional service team provides fast reliable on-site service and carry-in service for our products. For every problem of you with our printer we are always with you. We provide 24x7 hrs service through our website and email services.\n");
      out.write("                            <p align=\"justify\">To get better service you can register your product just after buying. We also provide several contractual plans for regular long term maintenance of your products. We take great pride to fulfill all your needs.\n");
      out.write("                        </div>\n");
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
      out.write("                            <h3>Login</h3>\n");
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
      out.write("                    </td>               \n");
      out.write("                </tr>\n");
      out.write("                <tr align=\"center\">\n");
      out.write("                    <td id=\"footer\" colspan=\"6\">\n");
      out.write("                        Contacts:<br>456/2, A.P.C. Road, Kolkata-700007.<br>Tel: 9433289564/033-25468758.\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

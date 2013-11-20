package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("        <style type=\"text/css\">\n");
      out.write("            body{background:url(images/metal.png) repeat}\n");
      out.write("            #login{margin-left:500px;margin-top:100px;margin-right:500px;border:1px solid black;background-color:silver}\n");
      out.write("          \n");
      out.write("            #f1{text-align:justify}\n");
      out.write("            #inp{position:absolute;right:520px}\n");
      out.write("            #but{position:absolute;left:650px; background-color:#978687; border:ridge; cursor:pointer}\n");
      out.write("            .gradient{\n");
      out.write("                        background: #000 url(images/gradient4-bg.png) repeat-x left bottom;\n");
      out.write("                        padding: 30px 40px 60px 30px;\n");
      out.write("                        margin: 15px 0 20px;\n");
      out.write("                }\n");
      out.write("                .gradient h1 {\n");
      out.write("                        font: normal 350%/100% \"Lucida Grande\", Arial, sans-serif;\n");
      out.write("                        text-align:center;\n");
      out.write("                        margin: 0;\n");
      out.write("                        color: #fff\n");
      out.write("                }\n");
      out.write("                .gradient h2 {\n");
      out.write("                        font: normal 100%/100% Palatino, serif;\n");
      out.write("                        margin: 0;\n");
      out.write("                        color: #b7b7b7;\n");
      out.write("                }\n");
      out.write("        </style>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Code D Basics</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"gradient\" align=\"center\"><h1>Code d basiCs</h1><br style=\"line-height: 1\"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;where ideas turn into real things...</h2></div>\n");
      out.write("        <div id=\"login\" align=\"center\">\n");
      out.write("            <form id=\"f1\"name=\"login\" action=\"check.jsp\" method=\"POST\">\n");
      out.write("                <br>&nbsp;&nbsp;TeamID:<input id=\"inp\" type=\"text\" name=\"team\" value=\"\"/><br><br>\n");
      out.write("                &nbsp;&nbsp;Slot:<input id=\"inp\" type=\"text\" name=\"slot\" value=\"\"/><br><br>\n");
      out.write("                &nbsp;&nbsp;Password:<input id=\"inp\" type=\"password\" name=\"passwd\" value=\"\"/><br><br>\n");
      out.write("                &nbsp;<input id=\"but\" type=\"submit\" value=\"Login\" name=\"login\" /><br><br>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
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

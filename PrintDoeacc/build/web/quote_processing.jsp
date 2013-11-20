<%-- 
    Document   : quote_processing
    Created on : Oct 18, 2009, 2:36:21 AM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quotation Build Final</title>
    </head>
    <body>
        <%!
            String quotid,caseid,engid,modno,serial,quotstat="PENDING",url="jdbc:oracle:thin:@localhost:1521:xe";
            int serv_chrg = 0,qntemp;
            Connection con;
            PreparedStatement ps;
            Statement stmt;
            ResultSet rs;
        %>
        <%
            Calendar cnow = Calendar.getInstance();
            java.sql.Date qdate = new java.sql.Date(cnow.getTimeInMillis());

            quotid = request.getParameter("pquot_id");
            caseid = request.getParameter("pcase_id");
            modno = request.getParameter("pmodel_no");
            engid = request.getParameter("peng_id");
            serial = request.getParameter("pserial_no");
            int dcnt = Integer.parseInt(request.getParameter("cnt"));
            serv_chrg = Integer.parseInt(request.getParameter("serv_chrg"));


            String parts[] = new String[dcnt+1];
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,"project","project");
            stmt=con.createStatement();

            for(int i=1;i<=dcnt;i++)
                {
                    qntemp = 0;
                    String temp = request.getParameter("parts"+i);

                    if(!request.getParameter("qnt"+i).equals(""))
                        qntemp = Integer.parseInt(request.getParameter("qnt"+i));
                    if(!temp.equals("none")&&qntemp!=0 )
                        {
                            rs = stmt.executeQuery("select * from parts where model_no='"+modno+"' and parts_name='"+temp+"'");
                            while(rs.next())
                                parts[i] = rs.getString("parts_id");
                            parts[i] +="#";
                            parts[i] +=qntemp;
                            rs.close();
                        }
                    else
                        parts[i]="invalid";
                }

            ps = con.prepareStatement("insert into quotation values(?,?,?,?,?,?,?,?,?,?,?,?)");

            ps.setString(1, quotid);
            ps.setDate(2, qdate);
            ps.setString(3, modno);
            ps.setString(4, serial);
            ps.setInt(5, serv_chrg);
            ps.setString(6, caseid);
            ps.setString(7, engid);
            ps.setString(8, quotstat);
            
            for(int i=1;i<=4;i++)
                {
                    if(i<=dcnt)
                        ps.setString((i+8), parts[i]);
                    else
                        ps.setString((i+8),"invalid");
                }
            ps.executeUpdate();

            stmt.executeUpdate("update complain set quot="+quotid+" where case_id='"+caseid+"'");

            stmt.close();
            ps.close();
            con.close();
            out.print("<h1 align=\"center\">Your Quotation Has Been Saved</h1>");            
        %>
        <input type="button" value="Go Back To Account" name="Acc_back" onclick="javascrpt: window.location='account.jsp'"/>
    </body>
</html>

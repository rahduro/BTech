<%-- 
    Document   : showquot
    Created on : Oct 16, 2009, 1:58:20 AM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Of Your Quotation</title>
    </head>
    <body>
        <%!
            String url = "jdbc:oracle:thin:@localhost:1521:xe",tmp,id_qnt[],take[],serial,model_no,printer_name,caseid;
            String cname,caddr,ccity,cstate,cmob,cphn,cmail,cpin,custid;
            java.sql.Date qdate;
            int quote_id,srvchrg=0;
            double NetSum=0.00;
            Connection con;
            Statement stmt;
            ResultSet rs,rs1;
        %>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection(url,"project","project");
            stmt = con.createStatement();

            quote_id = Integer.parseInt(request.getParameter("quotid"));

            rs = stmt.executeQuery("select * from quotation where quot_id="+quote_id);
            
            while(rs.next())
            {
                   srvchrg = rs.getInt("serv_chrg");
                   model_no = rs.getString("model_no");
                   qdate = rs.getDate("quot_date");
                   serial = rs.getString("prod_serial");
                   caseid = rs.getString("case_id");
            }
            
            rs.close();

            rs = stmt.executeQuery("select cust_id from complain where case_id='"+caseid+"'");

            while(rs.next())
                custid = rs.getString("cust_id");

            rs.close();

            rs = stmt.executeQuery("select * from customer where cust_id='"+custid+"'");

            while(rs.next())
                {
                    cname = rs.getString("c_name");
                    caddr = rs.getString("address");
                    ccity = rs.getString("city");
                    cstate = rs.getString("state");
                    cpin = rs.getString("pin");
                    cmob = rs.getString("mobile");
                    cphn = rs.getString("land_ph");
                    cmail = rs.getString("emal");
                }
                rs.close();
                
            rs = stmt.executeQuery("select printer_type from printer_model where model_no='"+model_no+"'");

            while(rs.next())
                printer_name = rs.getString("printer_type");
            rs.close();

        %>
        <table align="center" border="1" cellpadding="5">
            <tr>
                <td colspan="3">
                    <pre>
Technoprint India Sales Pvt. Ltd.
Vikas Building, 1st Floor, 1 Dr. U. N. Brahmachari Street
Beside Police Commissioner’s residence
Kolkata West Bengal
Tel : 91 33 22813899 Fax :
Email Id: kolkata.calladmin@hp.com
                    </pre>
                </td>
                <td align="center" valign="middle" colspan="2" nowrap><h2>Quotation/Proforma Invoice</h2>Quotation ID&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%= quote_id %></td>
                <td valign="middle" colspan="2">Chobi</td>
            </tr>
            <tr>
                <td colspan="4">
Mr/Mrs <%= cname%><br><br>
<%= caddr%><br>
<%=ccity%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cstate%><br>
India <%=cpin%><br><br>
Email&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<%=cmail%><br>
Tel(Landline) : <%=cphn%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mobile : <%=cmob%><br>
                </td>
                <td colspan="3">
Date :   <b><%= qdate%></b><br>
Call No. :   <b><%= quote_id%></b><br>
Payment Terms :  100% Advance by Cash/DD<br>
Model :  <b><%= model_no%></b><br>
Description   :  <%= printer_name%> Printer<br>
Serial No :  <b><%= serial%></b><br>
                </td>
            </tr>
            <tr>
                <td colspan="1" align="center"><b>Qty</b></td>
                <td colspan="3" align="left"><b>Description</b></td>
                <td colspan="1" align="center"><b>Unit Price<br>(In Rupees)</b></td>
                <td colspan="2" align="center"><b>Total Price</b></td>
            </tr>
            <tr>
                <td colspan="1" align="center">&nbsp;</td>
                <td colspan="3" align="left"><b>Service Charges</b></td>
                <td colspan="1" align="center"><%= srvchrg %></td>
                <td colspan="2" align="center"><%= srvchrg %></td>
            </tr>
            <tr>
                <td colspan="1" align="center">&nbsp;</td>
                <td colspan="3" align="left" style="text-decoration:underline"><b>Parts To Be Replaced</b></td>
                <td colspan="1" align="center">&nbsp;</td>
                <td colspan="2" align="center">&nbsp;</td>
            </tr>
            <%
                id_qnt = new String[2];
                double mrp=0.0;

                System.out.println("He He"+quote_id);

                rs = stmt.executeQuery("select * from quotation where quot_id='"+quote_id+"'");

                    take = new String[4];
                    while(rs.next())
                        {                            
                            take[0]=rs.getString("part1");
                            take[1]=rs.getString("part2");
                            take[2]=rs.getString("part3");
                            take[3]=rs.getString("part4");
                        }
                    rs.close();
                    
                    for(int i=0;i<4;i++)
                        {
                            if(!take[i].equals("invalid"))
                                {
                                    id_qnt = take[i].split("#");

                                    System.out.println("Hi" + id_qnt.length);

                                    rs1 = stmt.executeQuery("select * from parts where parts_id='"+id_qnt[0]+"'");
                                    while(rs1.next())
                                        {
                                            tmp = rs1.getString("parts_name");
                                            mrp = rs1.getDouble("parts_mrp");
                                        }

                                    out.print("<tr>");
                                    out.print("<td colspan=\"1\" align=\"center\">"+id_qnt[1]+"</td>");
                                    out.print("<td colspan=\"3\" align=\"left\">"+tmp+"&nbsp;&nbsp;&nbsp;&nbsp;"+id_qnt[0]+"</td>");
                                    out.print("<td colspan=\"1\" align=\"center\">"+mrp+"</td>");
                                    out.print("<td colspan=\"2\" align=\"center\">"+(mrp*Integer.parseInt(id_qnt[1]))+"</td>");
                                    out.print("</tr>");
                                    NetSum+=(mrp*Integer.parseInt(id_qnt[1]));
                                    
                                    rs1.close();
                                }
                        }
                    NetSum+=(NetSum*(.145));
                    NetSum+=srvchrg;
            %>
            <tr>
                <td colspan="4" align="center">
                    <b style="text-decoration:underline; font-size:xx-large">Tax :</b>
                </td>
                <td colspan="3" align="center">
                    <b><i>14.5%</i></b><br>(of Total Prices of Parts)
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <b style="text-decoration:underline; font-size:xx-large">Net Total :</b>
                </td>
                <td colspan="3" align="center">
                    <b><i>Rs.</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= NetSum%>&nbsp;&nbsp;&nbsp;&nbsp;/-</b>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="border:none">
                    Accepted This Quotation<br><br><br><br>
                    <span style="text-decoration:overline">Authorised Representative's Name, Designation & Signature</span><br>Company Seal & Date
                </td>
                <td colspan="3" align="center" style="border:none">
                    <br><br><br><br><br>
                    <span style="text-decoration:overline">Authorised Signatory</span>
                </td>
            </tr>
            <tr>
                <td colspan="7" align="center" style="border:none">
                    <br><br><br>
                    <input type="button" value="Print Quotation" name="PrintQuot" onclick="javascript: window.print()"/>
                </td>
            </tr>
        </table>
    </body>
</html>

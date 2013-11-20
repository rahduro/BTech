<%-- 
    Document   : genquot
    Created on : Oct 16, 2009, 1:58:02 AM
    Author     : rahduro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Making A Quotation</title>
        <script type="text/javascript">

            var displayID = 1;

            function addp()
            {
                var obj = document.getElementById("parts"+(displayID+1));

                if(displayID<4)
                    {
                        obj.style.display="table-row";
                        displayID++;
                    }

                if(displayID==2)
                    document.gen_quot.rem_parts.disabled=false;
                
                if(displayID==4)
                    document.gen_quot.add_parts.disabled=true;
                document.gen_quot.cnt.value = displayID;
            }
            function remp()
            {                
                var obj = document.getElementById("parts"+displayID);
                
                if(displayID>1)
                    {
                        obj.style.display="none";                        
                        displayID--;
                    }
                if(displayID==1)
                    document.gen_quot.rem_parts.disabled=true;
                if(displayID==3)
                    document.gen_quot.add_parts.disabled=false;
                document.gen_quot.cnt.value = displayID;
            }
        </script>
    </head>
    <body>
        <%!
            String url = "jdbc:oracle:thin:@localhost:1521:xe",case_id,model_no,cust_id,eng_id,serial_no,q_id;
            Connection con;
            Statement stmt;
            ResultSet rs;
        %>
        <%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(url, "project", "project");
            stmt = con.createStatement();


            case_id = request.getParameter("caseid");
            model_no = request.getParameter("model");
            eng_id = request.getParameter("engid");
            cust_id = request.getParameter("custid");
            serial_no= request.getParameter("serial");
            q_id= request.getParameter("quotid");

            rs = stmt.executeQuery("select parts_name from parts where model_no='"+model_no+"'");
        %>
            <h1 align="center" > Build Quotation Page </h1>
            
            <form name="gen_quot" action="quote_processing.jsp" method="POST">
                <input type="hidden" name="cnt" value="1" readonly="readonly" />
                <table align="center">
                    <tr>
                        <td colspan="2">Quotation ID:</td>
                        <td><input type="text" name="pquot_id" value="<%= q_id%>" size="20" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Case ID:</td>
                        <td><input type="text" name="pcase_id" value="<%= case_id%>" size="20" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Associated Engineer ID:</td>
                        <td><input type="text" name="peng_id" value="<%= eng_id%>" size="20" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Model No of Product:</td>
                        <td><input type="text" name="pmodel_no" value="<%= model_no%>" size="20" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Serial Number of Product:</td>
                        <td><input type="text" name="pserial_no" value="<%= serial_no%>" size="20" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Service Charge:</td>
                        <td><input type="text" name="serv_chrg" value="" size="15" /> Enter and Integer (Rs.)</td>
                    </tr>
                    <tr id="parts1">
                        <td>Select Part to be Replaced :</td>
                        <td>
                            <select name="parts1">
                                <option>None</option>
                                <%
                                    while(rs.next())
                                        {
                                            out.print("<option>"+rs.getString("parts_name")+"</option>");
                                        }
                                    rs.close();
                                %>
                            </select>
                        </td>
                        <td align="right">Quantity</td>
                        <td><input type="text" name="qnt1" value="" size="10" /></td>
                        <td><input type="button" value="Add More" name="add_parts" onclick="addp()"/></td>
                        <td><input type="button" value="Remove" name="rem_parts" onclick="remp()" disabled="disbaled"/></td>
                    </tr>
                    <tr id="parts2" style="display:none">
                        <td>Select Part to be Replaced :</td>
                        <td>
                            <select name="parts2">
                                <option>None</option>
                                <%
                                    rs = stmt.executeQuery("select parts_name from parts where model_no='"+model_no+"'");
                                    while(rs.next())
                                        {
                                            out.print("<option>"+rs.getString("parts_name")+"</option>");
                                        }
                                    rs.close();
                                %>
                            </select>
                        </td>
                        <td align="right">Quantity</td>
                        <td><input type="text" name="qnt2" value="" size="10" /></td>
                    </tr>
                    <tr id="parts3" style="display:none">
                        <td>Select Part to be Replaced :</td>
                        <td>
                            <select name="parts3">
                                <option>None</option>
                                <%
                                    rs = stmt.executeQuery("select parts_name from parts where model_no='"+model_no+"'");
                                    while(rs.next())
                                        {
                                            out.print("<option>"+rs.getString("parts_name")+"</option>");
                                        }
                                    rs.close();
                                %>
                            </select>
                        </td>
                        <td align="right">Quantity</td>
                        <td><input type="text" name="qnt3" value="" size="10" /></td>
                    </tr>
                    <tr id="parts4" style="display:none">
                        <td>Select Part to be Replaced :</td>
                        <td>
                            <select name="parts4">
                                <option>None</option>
                                <%
                                    rs = stmt.executeQuery("select parts_name from parts where model_no='"+model_no+"'");
                                    while(rs.next())
                                        {
                                            out.print("<option>"+rs.getString("parts_name")+"</option>");
                                        }
                                    rs.close();
                                    stmt.close();
                                    con.close();
                                %>
                            </select>
                        </td>
                        <td align="right">Quantity</td>
                        <td><input type="text" name="qnt4" value="" size="10" /></td>
                    </tr>
                    <tr>
                        <td colspan="5" align="center">
                            <input type="submit" value="Finalize Quotation" name="quot_submit" />
                        </td>
                    </tr>
                </table>
            </form>        
    </body>
</html>

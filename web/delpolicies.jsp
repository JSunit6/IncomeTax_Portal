<%-- 
    Document   : delpolicies
    Created on : Mar 9, 2014, 1:38:25 AM
    Author     : Pravin P. Kajarekar
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Premium Series by Free CSS Templates</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
select:style{height:500px;}
select:style{width:190px;}

a:link {color:#660000;}
a:visited {color:orangered;}
a:hover {color:#000033;}
a:active {color:white;}


</style>
<script>
    function delConf()
    {
        var con=confirm("ARE YOU SURE YOU WANT TO DELETE?");
       if(con==true)
           {
               document.delform.action="http://localhost:8080/project/delpolicy"
           }
        else
            {
                window.location.assign("http://localhost:8080/project/empdelete.jsp")
            }
    }
    function enable()
    {
       var x=document.delform.dellst.selectedIndex;
            if(x==0)
            {
              document.delform.btndel.disabled=true;
            }
           if(!(x==0))
            {
                document.delform.btndel.disabled=false;
            }
    }
</script>
</head>
<body>

<div id="header">
	<table border="0">
<tr><td><img src="images/IncomeTaxLogo1.jpg" width="1004" height="138" align="left" /></td></tr>
     </table>

	</div>
	<div id="menu">
		<ul id="main">
			<li class="current_page_item"><a href="home1.jsp">&nbsp;&nbsp;Home page &nbsp;&nbsp;</a></li>

                        <li><a href="policies.jsp">&nbsp;&nbsp;Investments &nbsp;&nbsp;&nbsp;</a></li>
                        <li></li>
			<li><a href="employee.jsp">&nbsp;&nbsp;Employees &nbsp;&nbsp;&nbsp;</a></li>

                        <li><a href="incometax.jsp">&nbsp;&nbsp;Income Tax &nbsp;&nbsp;&nbsp;</a></li>

                        <li><a href="reports.jsp">&nbsp;&nbsp;Reports &nbsp;&nbsp;&nbsp;</a></li>

                        <li><a href="contactus.jsp">&nbsp;&nbsp;Contact Us &nbsp;&nbsp;&nbsp;&nbsp;</a></li>

		</ul>
	</div>
<!-- end header -->

	<!-- start page -->
	<div id="page">
		<div id="sidebar1" class="sidebar">

			<ul>
                            <li>
                                <h2>Logged In As:</h2>
                          <ul>
                              <li><b>USERNAME:<%HttpSession hs=request.getSession(false);out.println("<b><font color=red>"+hs.getAttribute("usr")+"</b></font>");%></b></li>
                        <li><b>DATE AND TIME:</b></li>
                        <b><font color="red"><li><%=new Date()%></li></font></b>
                       <b><font color="blue"><li><a href="inclogin.html">LOGOUT</a></li></font></b>
                          </ul>
                        </li>

			<li>
				<h2>SERVICES</h2>
					<ul>
					<li><a href="addemp.jsp"><b>Add employee details</b></a></li>
                                        <li><a href="empdelete.jsp"><b>Delete employee details</b></a></li>
					<li><a href="updateemp.jsp"><b>Update employee details</b></a></li>
					<li><a href="viewemp.jsp"><b>View employee details</b></a></li>
                                        <li><a href="incometax.jsp"><b>Calculate Income Tax</b></a></li>
                                        <li><a href="policies.jsp"><b>Choose/add/delete investments</b></a></li>
                                        <li><a href="reports.jsp"><b>View reports</b></a></li>
                 
                                        </ul>

		</li>

<li>
<h2>OUR PARTNERS</h2>
  <ul>
 <li><a href="www.lic.com"><img src="images/lic.jpg" width="196" height="137"/></a></li>
  <li><a href="www.birlasunlife.com"><img src="images/birlasun.jpg" width="197" height="131"/></a></li>
  <li><a href="www.newindia.com"><img src="images/new india.jpg" width="181" height="155" /></a></li>
 </ul></li>
                       </ul></div>
                       <div id="content">
		<div class="incometax"><img src="images/images_1.jpg" alt="" width="730" height="270" /></div>
                <%!
                Connection con;
                Statement stmt;
                ResultSet rs;
                ResultSetMetaData rsmd;
                DatabaseMetaData dmd;
                %>
<%!
public void jspInit()
    {
    try
        {
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         con=DriverManager.getConnection("jdbc:odbc:departmentjava");
         stmt=con.createStatement();

    }
catch(Exception e)
    {
    e.printStackTrace();
    }
         }
%>
                <form name="delform" method="post">
                <center>
                    <font size="6">DELETE EMPLOYEE DETAILS</font><br/><br/><br/><br/><br/><br/>
                    <font size="4" color="ochure yellow" style="font-weight: bolder">
                        SELECT POLICY NAME TO DELETE:&nbsp;<select   name="dellst" style="width: 100px" onclick="return enable()"  >
                            <option>SELECT</option>
        <%
              rs=stmt.executeQuery("select * from policy where username='"+hs.getAttribute("usr")+"'");
              while(rs.next())
                  {
        %>
        <option><%=rs.getString(2)%></option>
               <%
                  }
                %>
           </select>
                    </font>
           <br/><br/><br/>
           <input type="submit" name="btndel" value="DELETE" onclick="delConf()" disabled="true"/>&nbsp;<input type="reset" value="RESET"/>
                </center>
                       </form>
                       </div>
                       <div style="clear: both;">&nbsp;</div>
	              </div>
                         <div id="footer">
    <p class="copyright">&copy;&nbsp;&nbsp;2014 All Rights Reserved &nbsp;&bull;&nbsp; Designed by <strong>Sunit P. Kajarekar</strong>.</p>
	<p class="link"><a href="#">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="#">Terms of Use</a></p>
</div>

<div class="downlinks">
<table border=0 align="center">
<tr style="font-weight:bolder">
<td><a href="home1.jsp">HOME</a></td>&nbsp;<td>&nbsp;</td><td>&nbsp;</td><td><a href="employee.jsp">EMPLOYEES</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="incometax.jsp">INCOME TAX</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="reports.jsp">REPORTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="policies.jsp">INVESTMENTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="contactus.jsp">CONTACT US</a></td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</table>
</div>

</body>
</html>

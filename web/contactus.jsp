<%-- 
    Document   : contactus
    Created on : Mar 2, 2014, 5:55:49 PM
    Author     : Pravin P. Kajarekar
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
       <link href="bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap-theme.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap-theme.min.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap.min.css" rel="stylesheet" type="text/css" media="screen" />
       <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
    <style type="text/css">
a:link {color:#660000;}
a:visited {color:orangered;}
a:hover {color:#000033;}
a:active {color:white;}

</style>
       <script src="bootstrap.js"></script>
       <script src="bootstrap.min.js"></script>
    </head>
    <body>
        <div id="header">
	<table border="0">
<tr><td><img src="images/IncomeTaxLogo1.jpg" width="1004" height="138" align="left"/></td></tr>
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
<div id="wrapper">
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
                       </ul>
                </div>
	<!-- start content -->
	  <div id="content">
 		<div class="incometax"><img src="images/contactus.jpg" alt="" width="730" height="270" /></div>

                    <p>
                    <pre>
<b>
    <font size="7" color="red">CONTACT US</font>
    <font size="3" color="black" face="Arial black">

    INCOME TAX

    Contact us
    Directorate of Income - Tax (Systems)
    A R A Center,
    E-2, Jhandewalan Extn.
    New Delhi- 110055

    Email-Id
    <a href="webmaster@incometaxindia.gov.in">webmaster@incometaxindia.gov.in</a>




</font>   </b>

                    </pre>
                        </p>


		</div>
		<!-- end content -->
		<!-- start sidebars -->
				<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
   <div id="footer">
    <p class="copyright">&copy;&nbsp;&nbsp;2014 All Rights Reserved &nbsp;&bull;&nbsp; Designed by <strong>Sunit P. Kajarekar</strong>.</p>
	<p class="link"><a href="#">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="#">Terms of Use</a></p>
</div>

<div class="downlinks">
<table border=0 align="center">
    <tr style="font-weight: bolder">
    <td><a href="home1.jsp">HOME</a></td>&nbsp;<td>&nbsp;</td><td>&nbsp;</td><td><a href="employee.jsp">EMPLOYEES</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="incometax.jsp">INCOME TAX</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="reports.jsp">REPORTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="policies.jsp">INVESTMENTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="contactus.jsp">CONTACT US</a></td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</table>
</div>

    </body>
</html>

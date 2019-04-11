<%@page import="java.util.Date"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>HOME PAGE</title>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
  <link href="bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap-theme.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap-theme.min.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap.min.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">

a:link {color:#660000;}
a:visited {color:orangered;}
a:hover {color:#000033;}
a:active {color:white;}


</style>
<script src="bootstrap.js"></script>
       <script src="bootstrap.min.js"></script>
<script>

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
			<li class="current_page_item"><a href="#">&nbsp;&nbsp;Home page &nbsp;&nbsp;</a></li>
			
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
                              <%
                              HttpSession hs;
                              hs=request.getSession(false);
                              if(hs.getAttribute("usr").equals(""))
                                  response.sendRedirect("inclogin.html");
                              %>
                              <li><b>USERNAME:<%hs=request.getSession(false);out.println("<b><font color=red>"+hs.getAttribute("usr")+"</b></font>");%></b></li>
                        <li><b>DATE AND TIME:</b></li>
                        <b><font color="red"><li><%=new Date()%></li></font></b>
                        <b><font color="blue"><li>
                                    <a href="logout.jsp">LOGOUT</a></li></font></b>
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
 	<!-- start content -->
		<div id="content">
 		<div class="incometax"><img src="images/income-tax.jpg" alt="" width="730" height="270" /></div>
 		
                    <p>
                    <pre>
<b>
    <marquee><font size="7" color="red">WELCOME TO OUR WEBSITE!</font></marquee>
    <font size="3" color="black" face="Arial black">

    The Central Government has been empowered by
    Entry 82 of the Union List of Schedule VII of the Constitution of India
    to levy tax on all income other than agricultural income
    (subject to Section 10).
    The Income Tax Law comprises The Income Tax Act 1961,
    Income Tax Rules 1962,
    Notifications and Circulars issued by Central Board of Direct Taxes (CBDT),
    Annual Finance Acts and Judicial pronouncements by Supreme Court
    and High Courts.
    The government of India imposes an income tax on taxable income
    of all persons including individuals,
    Hindu Undivided Families (HUFs),
    companies, firms, association of persons, body of individuals,
    local authority and any other artificial judicial person.
    Levy of tax is separate on each of the persons.
    The levy is governed by the Indian Income Tax Act, 1961.
    The Indian Income Tax Department is governed by
    CBDT and is part of the Department of Revenue under the Ministry
    of Finance, Govt. of India.
    Income tax is a key source of funds that the government uses to fund
    its activities and serve the public.
    The Income Tax Department is the biggest revenue mobilizer
    for the Government.
    The total tax revenues of the Central Government increased
    from 1392.26 billion in 1997-98 to 5889.09 billion in 2007-08.
  
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
    <tr style="font-weight:bolder">
<td><a href="home1.jsp">HOME</a></td>&nbsp;<td>&nbsp;</td><td>&nbsp;</td><td><a href="employee.jsp">EMPLOYEES</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="incometax.jsp">INCOME TAX</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="reports.jsp">REPORTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="policies.jsp">INVESTMENTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="contactus.jsp">CONTACT US</a></td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</table>
</div>
</body>
</html>

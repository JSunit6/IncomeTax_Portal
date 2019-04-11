<%-- 
    Document   : policies
    Created on : Feb 27, 2014, 1:39:54 PM
    Author     : Pravin P. Kajarekar
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Timer"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>POLICIES</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen"/>
<style type="text/css">
a:link {color:red;}
a:visited {color:orangered;}
a:hover {color:#000033;}
a:active {color:white;}

</style>
<script>
      function isBlank(s)
{
    var len;
    len=s.length;
    for(i=0;i<=len;i++)
        {
            if(s.charAt(i)!="")
                {
                    return false;
                }
        }
        return true;
}
function isString(s)
{
    var reg=/^[a-zA-Z]*$/;
    var len;
    var s=document.getElementById("polname").value;
    len=s.length;
    for(i=0;i<=len;i++)
        {
            if(!(s.match(reg)))
                {
                  alert("PLEASE ENTER ALPHABETS!");
                }
        }

   

}
function isNumber()
{

var reg=/^[a-zA-Z]*$/;
var s=document.getElementById("polname").value;
    var len;
    len=s.length;
    for(i=0;i<=len;i++)
        {
            if((s.match(reg)))
                {
                  alert("PLEASE ENTER NUMBERS!");
                }
        }


   

}

function validateempName()
{
var str=document.polform.txtempname.value;
     if(isBlank(str))
        {
            document.getElementById("empname").innerHTML="CANNOT BE BLANK";
            document.polform.txtempname.value="";
            return false;
        }
       if(isString(str)==false)
        {
            document.getElementById("empname").innerHTML="ENTER ALPHABETS";
            document.polform.txtempname.value="";
            return false;
        }
        if(isBlank(str)==false || isString(str)==false)
            {
                document.getElementById("empname").innerHTML="";
            }
}
function validatePPFamt()
{
 var str=document.polform.txtppfamt.value;
    if(isBlank(str))
        {
            document.getElementById("ppfamt").innerHTML="CANNOT BE BLANK";
            document.polform.txtppfamt.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("ppfamt").innerHTML="ENTER NUMBERS";
            document.polform.txtppfamt.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("ppfamt").innerHTML="";
            }
}
function validateNSCamt()
{
var str=document.polform.txtnscamt.value;
    if(isBlank(str))
        {
            document.getElementById("nscamt").innerHTML="CANNOT BE BLANK";
            document.polform.txtnscamt.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("nscamt").innerHTML="ENTER NUMBERS";
            document.polform.txtnscamt.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("nscamt").innerHTML="";
            }
}
function validateFeesamt()
{
var str=document.polform.txtfeesamt.value;
    if(isBlank(str))
        {
            document.getElementById("feesamt").innerHTML="CANNOT BE BLANK";
            document.polform.txtfeesamt.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("feesamt").innerHTML="ENTER NUMBERS";
            document.polform.txtfeesamt.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("feesamt").innerHTML="";
            }
}
    
    
</script>
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
		<div class="incometax"><img src="images/images_1.jpg" alt="" width="730" height="270" /></div>
		<center><font size="6">INVESTMENTS</font></center><br/><br/><br/>
                <div class="post">
			
                        <form name="polform" method="post" action="policies">
                            <font color="#990000" size="3" style="font-weight: bolder">
                            <center>

                                <%!
                                Connection con;
                                Statement stmt;
                                ResultSet rs;
                                ResultSetMetaData rsmd;
                                int i;
                                %>
                                <%!
                        public void jspInit()
                            {
                        try
                        {
                            i=1;
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
                                <%
                                rs=stmt.executeQuery("select * from policy");
                                rsmd=rs.getMetaData();

                                %>
                                
                                
                                <br>
                                
                                <table style="line-height: 220%">
                                    <tr>
                                        <td>EMPLOYEE NAME:</td><td></td><td><input type="text" name="txtname"/></td>
                                    </tr>
                                    
                                    <tr>
                                        <td id="polname"><%=rsmd.getColumnName(2)%></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>AMOUNT</td>
                                    </tr>
                                    <tr></tr>
                                    <tr></tr>
                                    <%
                                    while(rs.next())
                                        {
                                        String s=rs.getString(2);
                                        %>
                                        
                                        <tr>
                                            <td><%=s%></td><td></td><td><input type="text" name="<%=s%>"  onblur="return isNumber()"></td>

                                        </tr>
                                        <tr></tr>
                                        <%
                                        
                                        i++;
                                         }
                                        %>
                                        <tr><td><input type="submit" value="CHOOSE" name="btnpolicies"></td><td></td><td><input type="reset" value="RESET" name="btnreset"></td></tr>
                                         <tr><td><input type="submit" value="ADD MORE POLICIES" name="btnpolicies"></td></tr>
                                         <tr><td><input type="submit" value="DELETE POLICIES" name="btnpolicies"></td></tr>
                                </table>
                                  </center>
                               </font>
                              </form>
			 </div>
		  <!-- end content -->
		  <!-- start sidebars -->
		 		 <!-- end sidebars -->
		  <div style="clear: both;">&nbsp;</div>
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

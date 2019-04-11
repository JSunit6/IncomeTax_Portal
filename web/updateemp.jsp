<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>EMPLOYEES</title>
        <meta name="keywords" content="" />
        <meta name="Premium Series" content="" />
        <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
        <style type="text/css"> 
             a:link {color:#660000;}
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
    len=s.length;
    for(i=0;i<=len;i++)
        {
            if(s.match(reg))
                {
                    return true;
                }
        }

   return false;

}
function isNumber(s)
{

    var reg=/^[a-z A-Z]*$/;
    var len;
    len=s.length;
    for(i=0;i<=len;i++)
        {
            if(!(s.match(reg)))
                {
                    return true;
                }
        }

   return false;

}
function lenPan(s)
{
    var len;
    len=s.length;
    if(len==10)
        {
            return true;
        }
return false;
}
function limitproftax(s)
{
    if(s>=0 && s<=2500)
        {
            return true;
        }
        return false;
}
function limittrav(s)
{

    if(!(s>=0 && s<=9600))
        {
            return false;
        }
        return true;

}


function validateName()
{
    var str=document.myform.txtempname.value;
    if(isBlank(str))
        {
            document.getElementById("valusr").innerHTML="CANNOT BE BLANK";
            document.myform.txtempname.value="";
            return false;
        }
       if(isString(str)==false)
        {
            document.getElementById("valusr").innerHTML="ENTER ALPHABETS";
            document.myform.txtempname.value="";
            return false;
        }
        if(isBlank(str)==false || isString(str)==false)
            {
                document.getElementById("valusr").innerHTML="";
            }


}
function validateDesg()
{
    var str=document.myform.txtempdesg.value;
    if(isBlank(str))
        {
            document.getElementById("valdesg").innerHTML="CANNOT BE BLANK";
            document.myform.txtempdesg.value="";
            return false;
        }
       if(isString(str)==false)
        {
            document.getElementById("valdesg").innerHTML="ENTER ALPHABETS";
            document.myform.txtempdesg.value="";
            return false;
        }
           if(isBlank(str)==false || isString(str)==false)
            {
                document.getElementById("valdesg").innerHTML="";
            }

}
function validateID()
{
    var str=document.myform.txtempid.value;
    if(isBlank(str))
        {
            document.getElementById("valId").innerHTML="CANNOT BE BLANK";
            document.myform.txtempid.value="";
            return false;
        }

        if(isBlank(str)==false)
            {
                document.getElementById("valId").innerHTML="";
            }


}

function validatePanno()
{
    var str=document.myform.txtemppan.value;

    if (lenPan(str)==false)
        {
           document.getElementById("valpan").innerHTML="ENTER 10 CHARACTERS";
           return true;
    }
    if(isBlank(str))
        {
            document.getElementById("valpan").innerHTML="CANNOT BE BLANK";
            document.myform.txtemppan.value="";
            return false;
        }
        if(isBlank(str)==false || lenPan(str)==true)
            {
                document.getElementById("valpan").innerHTML="";
            }

}
function validateGrosssal()
{
    var str=document.myform.txtgrssal.value;
    if(isBlank(str))
        {
            document.getElementById("valsal").innerHTML="CANNOT BE BLANK";
            document.myform.txtgrssal.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("valsal").innerHTML="ENTER NUMBERS";
            document.myform.txtgrssal.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("valsal").innerHTML="";
            }

}
function validateProftax()
{
    var str=document.myform.txtprtax.value;
    if(isBlank(str))
        {
            document.getElementById("valprof").innerHTML="CANNOT BE BLANK";
            document.myform.txtprtax.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("valprof").innerHTML="ENTER NUMBERS";
            document.myform.txtprtax.value="";
            return true;
        }
        if(limitproftax(str)==false)
            {
            document.getElementById("valprof").innerHTML="MUST BE LESS THAN OR EQUAL TO 2500";
            document.myform.txtprtax.value="";
            return true;
            }
            if(isBlank(str)==false || isNumber(str)==true || limitproftax(str)==true)
            {
                document.getElementById("valprof").innerHTML="";
            }

}
function validateTravall()
{
    var str=document.myform.txttrall.value;
    if(isBlank(str))
        {
            document.getElementById("valtrav").innerHTML="CANNOT BE BLANK";
            document.myform.txttrall.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("valtrav").innerHTML="ENTER NUMBERS";
            document.myform.txttrall.value="";
            return true;
        }
        if(limittrav(str)==false)
            {
            document.getElementById("valtrav").innerHTML="MUST BE LESS THAN OR EQUAL TO 9600";
            document.myform.txttrall.value="";
            return true;
            }
        if(isBlank(str)==false || isNumber(str)==true || limittrav(str)==true)
            {
                document.getElementById("valtrav").innerHTML="";
            }

}
function validateGPF()
{
    var str=document.myform.txtgenpf.value;
    if(isBlank(str))
        {
            document.getElementById("valGPF").innerHTML="CANNOT BE BLANK";
            document.myform.txtgenpf.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("valGPF").innerHTML="ENTER NUMBERS";
            document.myform.txtgenpf.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("valGPF").innerHTML="";
            }

}
function validateGIS()
{
    var str=document.myform.txtgrpinsch.value;
    if(isBlank(str))
        {
            document.getElementById("valGIS").innerHTML="CANNOT BE BLANK";
            document.myform.txtgrpinsch.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("valGIS").innerHTML="ENTER NUMBERS";
            document.myform.txtgrpinsch.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("valGIS").innerHTML="";
            }

}
function validatePPF()
{
    var str=document.myform.txtppf.value;
    if(isBlank(str))
        {
            document.getElementById("valPPF").innerHTML="CANNOT BE BLANK";
            document.myform.txtppf.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("valPPF").innerHTML="ENTER NUMBERS";
            document.myform.txtppf.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("valPPF").innerHTML="";
            }

}
function validateNSC()
{
    var str=document.myform.txtnatcer.value;
    if(isBlank(str))
        {
            document.getElementById("valNSC").innerHTML="CANNOT BE BLANK";
            document.myform.txtnatcer.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("valNSC").innerHTML="ENTER NUMBERS";
            document.myform.txtnatcer.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("valNSC").innerHTML="";
            }

}
function validateSCHCOLG()
{
    var str=document.myform.txtschfee.value;
    if(isBlank(str))
        {
            document.getElementById("valfees").innerHTML="CANNOT BE BLANK";
            document.myform.txtschfee.value="";
            return false;
        }
        if(isNumber(str)==false)
        {
            document.getElementById("valfees").innerHTML="ENTER NUMBERS";
            document.myform.txtschfee.value="";
            return true;
        }
        if(isBlank(str)==false || isNumber(str)==true)
            {
                document.getElementById("valfees").innerHTML="";
            }

}
 function enable()
    {
       var x=document.updateform.updlst.selectedIndex;
            if(x==0)
            {
              document.updateform.btnupdate.disabled=true;
            }
           if(!(x==0))
            {
                document.updateform.btnupdate.disabled=false;
            }
    }

</script>


    </head>
    <body>
        <div id="header">
	<table border="0">
<tr><td><img  src="images/IncomeTaxLogo1.jpg" width="1004" height="138" align="left" /></td></tr>
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

</body>
<div id="page">
		<div id="sidebar1" class="sidebar">
			<ul>
			<li>

                         <h2>Logged In As:</h2>
                         <ul>
                             <%!
                             HttpSession hs;
                             %>
			<li><b>USERNAME:<%hs=request.getSession(false);out.println("<b><font color=red>"+hs.getAttribute("usr")+"</b></font>");%></b></li>
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
    <li><a href="www.lic.com"><img src="images/lic.jpg" width="196" height="137"></a></li>
    <li><a href="www.birlasunlife.com"><img src="images/birlasun.jpg" width="197" height="131"></a></li>
    <li><a href="www.newindia.com"><img src="images/new india.jpg" width="181" height="155" /></a></li>
  </ul>
 </li>
 </ul>
</div>
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
                <form name="updateform" method="post" action="updateform.jsp">
                <center>
                    <font size="6">UPDATE EMPLOYEE DETAILS</font><br/><br/><br/><br/><br/><br/>
                    <font size="4" color="ochure yellow" style="font-weight: bolder">
                        SELECT EMPLOYEE NAME TO UPDATE:&nbsp;<select   name="updlst" style="width: 100px" onclick="return enable()"  >
                            <option>SELECT</option>
        <%
              rs=stmt.executeQuery("select * from emp_dtls where username='"+hs.getAttribute("usr")+"'");
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
           <input type="submit" name="btnupdate" value="UPDATE"  disabled="true"/>&nbsp;<input type="reset" value="RESET"/>
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
    <font size="2">
<table border=0 align="center">
<tr style="font-weight:bolder">
<td><a href="home1.jsp">HOME</a></td>&nbsp;<td>&nbsp;</td><td>&nbsp;</td><td><a href="employee.jsp">EMPLOYEES</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="incometax.jsp">INCOME TAX</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="reports.jsp">REPORTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="policies.jsp">INVESTMENTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href="contactus.jsp">CONTACT US</a></td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
</table>
    </font>
</div>

     </body>
 </html>

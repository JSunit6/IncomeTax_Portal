<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>employees</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
 <link href="bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap-theme.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap-theme.min.css" rel="stylesheet" type="text/css" media="screen" />
<link href="bootstrap.min.css" rel="stylesheet" type="text/css" media="screen" />


<script src="bootstrap.js"></script>
       <script src="bootstrap.min.js"></script>
<script language="Javascript">
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
    var reg=/^[a-z A-Z]*$/;
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
            document.myform.txtgrpinsch.placeholder="";
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
            document.myform.txtnatcer.placeholder="";
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
var empname=document.myform.txtempname.value;
    var desg=document.myform.txtempdesg.value;
    var id=document.myform.txtempid.value;
    var pan=document.myform.txtemppan.value;
    var grssal=document.myform.txtgrssal.value;
    var prof=document.myform.txtprtax.value;
    var trall=document.myform.txttrall.value;
    var genpf=document.myform.txtgenpf.value;
    var grpinsch=document.myform.txtgrpinsch.value;
    if((empname!="" && desg!="" && id!="" && pan!="" && grssal!="" && prof!="" && trall!="" && genpf!="" && grpinsch!=""))
{
    
    
document.myform.btnaddemp.disabled=false;
}

       
}

</script>
<style type="text/css">
a:link {color:#660000;}
a:visited {color:orangered;}
a:hover {color:#000033;}
a:active {color:white;}

</style>


<title>EMPLOYEES</title>
<meta name="keywords" content="" />
<meta name="Premium Series" content="" />

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


<div id="wrapper">
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
                                        <font face="Arial" size="2" style="font-weight: bolder">
                                        <ul>
					<li><a href="addemp.jsp"><b>Add employee details</b></a></li>
                                        <li><a href="empdelete.jsp"><b>Delete employee details</b></a></li>
					<li><a href="updateemp.jsp"><b>Update employee details</b></a></li>
					<li><a href="viewemp.jsp"><b>View employee details</b></a></li>
                                        <li><a href="incometax.jsp"><b>Calculate Income Tax</b></a></li>
                                        <li><a href="policies.jsp"><b>Choose/add/delete investments</b></a></li>
                                        <li><a href="reports.jsp"><b>View reports</b></a></li>
                 
                                        </ul>
                                        </font>
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
		<!-- start content -->
                <div id="content">
		<div class="incometax"><img src="images/images_1.jpg" alt="" width="730" height="270" /></div>
                <center><font size="6">ADD EMPLOYEE DETAILS</font></center>
		      <form name="myform" method="post" action="addemp">
                             <font color="#990000" size="3" style="font-weight: bolder">
                                 <table border="0" align="left">
                                     <tr><td>NAME:</td><td><input type="text" name="txtempname" onblur="return validateName()" placeholder="ENTER ALPHABETS"></td><td id="valusr"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            <tr><td>DESIGNATION:</td><td><input type="text" name="txtempdesg" onblur="return validateDesg()" placeholder="ENTER ALPHABETS"></td><td id="valdesg"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            <tr><td>ID:</td><td><input type="text" name="txtempid" maxlength="11" onblur="return validateID()"></td><td id="valId"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            <tr><td>EMPLOYEE PAN NO:</td><td><input type="text" name="txtemppan" maxlength="10" onblur="return validatePanno()"></td><td id="valpan"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            <tr><td>GROSS SALARY:</td><td><input type="text" name="txtgrssal" onblur="return validateGrosssal()" placeholder="ENTER NUMBERS"></td><td id="valsal"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            <tr><td>PROFESSION TAX:</td><td><input type="text" name="txtprtax" onblur="return validateProftax()" placeholder="ENTER NUMBERS"></td><td id="valprof"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            <tr><td>TRAVELLING ALLOWANCE:</td><td><input type="text" name="txttrall" onblur="return validateTravall()" placeholder="ENTER NUMBERS"></td><td id="valtrav"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            
                                            <tr><td>GENERAL PROVIDENT FUND:</td><td><input type="text" name="txtgenpf" onblur="return validateGPF()" placeholder="ENTER NUMBERS"></td><td id="valGPF"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            <tr><td>GROUP INSURANCE SCHEME:</td><td><input type="text" name="txtgrpinsch" onblur="return validateGIS()" onfocus="return enable()" placeholder="ENTER NUMBERS"></td><td id="valGIS"></td></tr>
                                            <tr></tr>
                                            <tr></tr>
                                            
                                            
                                            <tr><td><center><font color="red" size="2"><input  type="submit" name="btnaddemp" value="ADD" style="width: 100px" >&nbsp;<input type="reset" name="emprst" value="RESET" style="width:100px"></font></center></td></tr>
                                        </table>

                                    </font>


                        </form>
			</div>
		<!-- end content -->
		<!-- start sidebars -->
				<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	             </div>
</div>
                  <div id="footer">
    <p class="copyright">&copy;&nbsp;&nbsp;2014 All Rights Reserved &nbsp;&bull;&nbsp; Designed by<strong>Sunit P. Kajarekar</strong>.</p>
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
<!-- end page -->
</html>

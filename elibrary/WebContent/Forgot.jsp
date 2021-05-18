<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function validate_admin()
	{
		var len=document.frm_admin.tEmail.value.trim().length
		if(len==0)
		{
			alert("Email can't be left blank");
			document.frm_admin.tEmail.value="";
			document.frm_admin.tEmail.focus();
			return false;
		}
		var len=document.frm_admin.tPass.value.length
		if(len==0)
		{
			alert("Password can't be left blank");
			document.frm_admin.tPass.value="";
			document.frm_admin.tPass.focus();
			return false;
		}
		return true
	}
	
</script>

<body>
<div class="container">
<div id="div_admin" style="position:absolute;left:20px;top:50px" width="100%">
<form name="frm_admin" method="post" action="/eLibrary/ForgetPass">
<table>
	<tr>
	<th align="left">RECOVER PASSWORD</th>
	</tr>
		<TR><TD ><LABEL><font size=2 color=#505050 face=sans-serif>Registration Id:</LABEL></TD><TD><INPUT TYPE=TEXT SIZE=20 name="tId" > </TD></TR><TR></TR><TR><TD><font size=2 color=#505050 face=sans-serif>Security Question</TD><TD>
	<SELECT name="tSec"    onchange="verifysec(),Tip('') " onblur="verifysec(),Tip('')"  >
	<OPTION value=0>- Select your question -
	<OPTION value="What is your pet name?">What is your pet name?
	<OPTION value="What is your favourite teacher's name?">What is your favourite teacher's name?
	<OPTION value="Who is your favourite hero?">Who is your favourite hero?
	<OPTION value="Who is your favourite heroine?">Who is your favourite heroine?
	<OPTION value="What is your favourite sport?">What is your favourite sport?
	</SELECT>
	</TD></TR><TR></TR>
	<TR><TD ><LABEL><font size=2 color=#505050 face=sans-serif>Your Answer:</LABEL></TD><TD><INPUT TYPE=TEXT SIZE=20 name="tAns" class="fields" value="Your Security Answer"> </TD></TR><TR></TR>
		<TR><TD ><LABEL><font size=2 color=#505050 face=sans-serif>New Password</LABEL></TD><TD><INPUT TYPE=password SIZE=20 name="tPass" > </TD></TR><TR></TR>
		<TR><TD ><LABEL><font size=2 color=#505050 face=sans-serif>Confirm Password</LABEL></TD><TD><INPUT TYPE=password SIZE=20 name="tPass" > </TD></TR><TR></TR>
		<TR><TD ><LABEL><font size=2 color=#505050 face=sans-serif>Register:</LABEL></TD><TD><INPUT TYPE=submit SIZE=20 name="submit" > </TD></TR><TR></TR>
	
	<tr><td><label id="lblError_admin">
	</label></td></tr>
</table>
</form>
</div>
</div>


</body>
</html>
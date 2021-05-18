<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>RASE - Registration</title>
<style type="text/css">
#menu14 {
	width: 200px;
	margin: 10px;
	}
	
#menu14  a {
	height: 32px;
  	voice-family: "\"}\""; 
	font-family:Times New Roman;
	font-weight:bold;
  	voice-family: inherit;
  	height: 24px;
	text-decoration: none;
	}	
	
#menu14  a:link, #menu14  a:visited {
	color: #555;
	display: block;
	background:  url(menu14.gif);
	padding: 8px 0 0 10px;
	}
	
#menu14  a:hover {
	color: #FFF;
	display: block;
	background:  url(menu14.gif) 0 -32px;
	padding: 8px 0 0 10px;
	}


.fields
{
color:#BBBBBB;
}
</style>
<script>
var img;
var okimg=new Image();
okimg.src="ok.gif";
var noimg=new Image();
noimg.src="no.gif";
var whiteimg=new Image();
whiteimg.src="white.gif";
var waitimg=new Image();
waitimg.src="wait.gif";
var typeok=false;
var regdnook=false;
var pwdok=false;
var cnpwdok=false;
var nameok=false;
var genderok=false;
var dateok=false;
var branchok=false;
var yostdok=false;
var yopok=false;
var addressok=false;
var phnook=false;
var emailok=false;
var secok=false;
var secansok=false;
function check()
{
   if((typeok==true)&&(regdnook==true)&&(pwdok==true)&&(cnpwdok==true)&&(nameok==true)&&(genderok==true)&&(dateok==true)&&(branchok==true)&&(yostdok==true||regform.type.value=='alu')&&(yopok==true||regform.type.value=='stu')&&(addressok==true)&&(phnook==true)&&(emailok==true)&&(secok==true)&&(secansok==true))
  {
       if(!confirm("Are you sure you want to submit?"))
             window.event.returnValue=false;
   else
   {
	regform.yop.disabled=false;	
	regform.yostd.disabled=false;	
        regform.submit();
	}
  }
  else
       window.alert("Some fields you have entered are wrong \n or you have not entered anything \n Please verify once again");

}

function verifytype()
{
   if(regform.type.selectedIndex==0)
   {
          typeok=false;
          displaywaitno(regform.typeimage);
   }
   else  if(regform.type.selectedIndex==1)
         {
	typeok=true;
	regform.yostd.disabled=false;
	regform.yop.disabled=true;
              displaywaitok(regform.typeimage);
         }
   else  if(regform.type.selectedIndex==2)
         {
	typeok=true;
	regform.yostd.disabled=true;
	regform.yop.disabled=false;
              displaywaitok(regform.typeimage);
         }

}


function verifysec()
{
   if(regform.secque.selectedIndex==0)
   {
          secok=false;
          displaywaitno(regform.secimg);
   }
   else  if(regform.secque.selectedIndex==1||regform.secque.selectedIndex==2||regform.secque.selectedIndex==3||regform.secque.selectedIndex==4||regform.secque.selectedIndex==5)
         {
	secok=true;
              displaywaitok(regform.secimg);
         }

}
function displaywaitno(imgsrc)
{
  img=imgsrc;
  img.src=waitimg.src;
  setTimeout("displayno()",400);
}
function displaywaitok(imgsrc)
{
  img=imgsrc;
  img.src=waitimg.src;
  setTimeout("displayok()",400);
  }
function regdnofocus()
{
   if(regform.regdno.value=='XX761AXXXX')
   {
        regform.regdno.value=""; 
        regform.regdno.style.color="#000000";
   }  
}
function displayok()
{
    img.src=okimg.src;	
}
function displayno()
{
    img.src=noimg.src;	
}
function regdnoblur()
{
       if(regform.regdno.value=='XX761AXXXX'||regform.regdno.value==""||regform.regdno.value.length!=10)
       {
	regdnook=false;
              regform.regdno.style.color="#BBBBBB";
             displaywaitno(regform.regdnoimg);
	regform.regdno.value='XX761AXXXX';
       }
       else
	{
	regdnook=true;
           displaywaitok(regform.regdnoimg);
	}
}

function pwdfocus()
{
        regform.pwd.style.color="#000000";
}

function pwdblur()
{
	if(regform.pwd.value==""||regform.pwd.value.length<6)
	{
	   pwdok=false;
                 displaywaitno(regform.pwdimg);
	}
               else
	{	
	    pwdok=true;
                  displaywaitok(regform.pwdimg);
	}
}

function cnpwdfocus()
{
  regform.cnpwd.style.color="#000000";
}

function cnpwdblur()
{
	if(regform.cnpwd.value==""||regform.cnpwd.value.length<6||regform.pwd.value!=regform.cnpwd.value)
	{
	  cnpwdok=false;
                 displaywaitno(regform.cnpwdimg);
	}
               else
	{
	     cnpwdok=true;
                  displaywaitok(regform.cnpwdimg);
	}
}

function namefocus()
{
   if(regform.name.value=='Your Name')
   {
        regform.name.value=""; 
        regform.name.style.color="#000000";
   }  
}

function nameblur()
{
      if(regform.name.value=='Your Name'||regform.name.value=="")
       {
	 nameok=false;
              regform.name.style.color="#BBBBBB";
              displaywaitno(regform.nameimg);
	regform.name.value='Your Name';
       }
       else
	{
	 nameok=true;
           displaywaitok(regform.nameimg);
	}
}

function verifygender()
{
          if(regform.gender[0].checked||regform.gender[1].checked)
	{
	genderok=true;
            displaywaitok(regform.genimg); 
	}
	else
	{
	genderok=false;
            displaywaitno(regform.genimg);
	}
}

function dobfocus()
{
    regform.dob.style.color="#000000";
  if(regform.dob.value=='DD')
   {
        regform.dob.value=""; 
    } 
}

function dobblur()
{
       if(regform.dob.value=='DD'||regform.dob.value=="")
       {
              regform.dob.style.color="#BBBBBB";
        	regform.dob.value='DD';
       }
}

function mobfocus()
{

  regform.mob.style.color="#000000";
  if(regform.mob.value=='MM')
   {
        regform.mob.value=""; 
    } 
}

function mobblur()
{

      if(regform.mob.value=='MM'||regform.mob.value=="")
       {
              regform.mob.style.color="#BBBBBB";
        	regform.mob.value='MM';
       }
}

function yobfocus()
{
  regform.yob.style.color="#000000";
  if(regform.yob.value=='YYYY')
   {
        regform.yob.value=""; 
    } 
}

function yobblur()
{
      if(regform.yob.value=='YYYY'||regform.yob.value=="")
       {
              regform.yob.style.color="#BBBBBB";
        	regform.yob.value='YYYY';
       }
    validatedate();
}

function validatedate()
{
   dateok=false;
   if(regform.dob.value=='DD')
           displaywaitno(regform.dateimg);
   else if(isNaN(parseInt(regform.dob.value)))
           displaywaitno(regform.dateimg);
   else if(regform.dob.value<1||regform.dob.value>31)
           displaywaitno(regform.dateimg);
   else if(regform.mob.value=='MM')
           displaywaitno(regform.dateimg);
   else if(isNaN(parseInt(regform.mob.value)))
           displaywaitno(regform.dateimg);
   else if(regform.mob.value<1||regform.mob.value>12)
           displaywaitno(regform.dateimg);
  else if(regform.yob.value=='YYYY')
           displaywaitno(regform.dateimg);
   else if(isNaN(parseInt(regform.yob.value)))
           displaywaitno(regform.dateimg);
   else
	{
	dateok=true;
                  displaywaitok(regform.dateimg);
	}
 }

function branchfocus()
{
  regform.branch.style.color="#000000";
  if(regform.branch.value=='Branch')
   {
        regform.branch.value=""; 
    } 
}

function branchblur()
{
if(regform.branch.value==""||!isNaN(parseInt(regform.branch.value)))
{
          branchok=false;
          regform.branch.style.color="#BBBBBB";
          regform.branch.value="Branch"; 
          displaywaitno(regform.branchimg);
}
else
	{
	branchok=true;
        displaywaitok(regform.branchimg);
}
}

function yostdchange()
{
if(regform.yostd.selectedIndex==0)
{
	yostdok=false;
        displaywaitno(regform.yostdimg);
}
else  if(regform.yostd.selectedIndex==1||regform.yostd.selectedIndex==2||regform.yostd.selectedIndex==3||regform.yostd.selectedIndex==4)
{
yostdok=true;
          displaywaitok(regform.yostdimg);
}
}
function yopfocus()
{
  regform.yop.style.color="#000000";
  if(regform.yop.value=='YYYY')
   {
        regform.yop.value=""; 
    } 
}
function yopblur()
{
if(regform.yop.value==""||isNaN(parseInt(regform.yop.value))||regform.yop.value.length!=4)
{
	yopok=false;
          regform.yop.style.color="#BBBBBB";
          regform.yop.value="YYYY"; 
          displaywaitno(regform.yopimg);
}
else
{
	yopok=true;
        displaywaitok(regform.yopimg);
}
}
function addressfocus()
{
  regform.address.style.color="#000000";
  if(regform.address.value=="Address")
            regform.address.value="";
}
function addressblur()
{
if(regform.address.value=="")
{
	addressok=false;
          regform.address.style.color="#BBBBBB";
          regform.address.value="Address"; 
          displaywaitno(regform.addressimg);
}
else
{
	addressok=true;
        displaywaitok(regform.addressimg);
}
}
function phnofocus()
{
  regform.phno.style.color="#000000";
  if(regform.phno.value=='Phone Number')
   {
        regform.phno.value=""; 
    } 
}
function phnoblur()
{
if(regform.phno.value=="")
{
	phnook=false;
          regform.phno.style.color="#BBBBBB";
          regform.phno.value="Phone Number"; 
          displaywaitno(regform.phnoimg);
}
else
{
	phnook=true;
        displaywaitok(regform.phnoimg);
}
}
function emailfocus()
{
  regform.email.style.color="#000000";
  if(regform.email.value=='Email-ID')
   {
        regform.email.value=""; 
    } 
}
function emailblur()
{
if(regform.email.value==""||regform.email.value.search('@')==-1)
{
	emailok=false; 
         regform.email.style.color="#BBBBBB";
          regform.email.value="Email-ID"; 
          displaywaitno(regform.emailimg);
}
else
{
	emailok=true;
        displaywaitok(regform.emailimg);
}
}




function secansfocus()
{
  regform.secans.style.color="#000000";
  if(regform.secans.value=='Your Security Answer')
   {
        regform.secans.value=""; 
    } 
}
function secansblur()
{
if(regform.secans.value=="")
{
	secansok=false; 
         regform.secans.style.color="#BBBBBB";
          regform.secans.value="Your Security Answer"; 
          displaywaitno(regform.secansimg);
}
else
{
        secansok=true;
        displaywaitok(regform.secansimg);
}
}



function clearall()
{
          regform.type.style.color="#000000";
          regform.regdno.style.color="#BBBBBB";
          regform.pwd.style.color="#BBBBBB";
          regform.cnpwd.style.color="#BBBBBB";
          regform.name.style.color="#BBBBBB";
          regform.dob.style.color="#BBBBBB";
          regform.mob.style.color="#BBBBBB";
          regform.yob.style.color="#BBBBBB";
          regform.branch.style.color="#BBBBBB";
          regform.yop.style.color="#BBBBBB";
          regform.address.style.color="#BBBBBB";
          regform.phno.style.color="#BBBBBB";
          regform.email.style.color="#BBBBBB";
          regform.secans.style.color="#BBBBBB";

          regform.type.selectedIndex=0;
          regform.regdno.value="XX761AXXXX";
          regform.pwd.value="";
          regform.cnpwd.value="";
          regform.name.value="Your Name";
          regform.gender[0].checked=false;
          regform.gender[1].checked=false;
          regform.dob.value="DD";
          regform.mob.value="MM";
          regform.yob.value="YYYY";
          regform.branch.value="Branch";
          regform.yostd.selectedIndex=0;
          regform.yop.value="YYYY";
          regform.address.value="Address";
          regform.phno.value="Phone Number";
          regform.email.value="Email-ID";
          regform.secans.value="Your Security Answer";
          regform.yostd.selectedIndex=0;
          regform.type.selectedIndex=0;
          regform.secque.selectedIndex=0;

          regform.typeimage.src="white.gif";
          regform.regdnoimg.src="white.gif";4/16/2009
          regform.pwdimg.src="white.gif";
          regform.cnpwdimg.src="white.gif";
          regform.nameimg.src="white.gif";
          regform.genimg.src="white.gif";
          regform.dateimg.src="white.gif";
          regform.branchimg.src="white.gif";
          regform.yostdimg.src="white.gif";
          regform.yopimg.src="white.gif";
          regform.addressimg.src="white.gif";
          regform.phnoimg.src="white.gif";
          regform.emailimg.src="white.gif";
          regform.secimg.src="white.gif";
          regform.secansimg.src="white.gif";

	typeok=false;
	regdnook=false;
	pwdok=false;
	cnpwdok=false;
	nameok=false;
	genderok=false;
	dateok=false;
	branchok=false;
	yostdok=false;
	yopok=false;
	addressok=false;
	phnook=false;
	emailok=false;
	secok=false;
	secansok=false;
	
}
</SCRIPT>
</HEAD>
<BODY background=regd.jpg vlink="#004cca" alink="#004cca" link="#004cca" onload="clearall()">
<script type="text/javascript" src="wz_tooltip.js"></script>
<script type="text/javascript" src="tip_balloon.js"></script>
<script>
function TTip(text,x,y)
{
Tip("<font color=#004cca>"+text+"",FADEIN,1000,FADEOUT,1000,FIX,[x,y],BORDERCOLOR,'#FFFFFF',BALLOON,true,ABOVE,true);
}
</script>
<form name="regform" method=POST action="/eLibrary/AddStudent" >
<DIV  style="position:absolute;  top:0px; left:130px; width:75%; height:205%; background-color:white; text-align:left; border:1px solid #505050">
<img src=rase.jpg style="float:left;margin-top:10px;margin-left:45px" border=0>
<DIV>
<IMG SRC=rase1.jpg style="float:right;margin-right:-5px;margin-top:0px" align=right border=0><BR>
<BR><BR><BR>
<label><font size=4 color="#004cca" style="float:left;margin-left:60px">Hello! here you can register</font></label><BR>
<label><font size=4 color="#004cca" style="float:left;margin-left:60px"> your self as a Student </font></label>
</DIV>
<center><Label><font size=1 color=gray>........................................................................................................................................................................................................................</font></label></center>
<a href="./home.html" style="float:right;margin-right:50px;"><font size=3>Home</font></a>
<BR><BR>
<label><font size=2 color=#004cca face=sans-serif style="margin-left:100px"><b>1. Enter your login details . .  .</b></font></label>
<BR><BR>
<TABLE ALIGN=LEFT style="MARGIN-LEFT:50px" border=0>
<TR><TD align=right><LABEL style="MARGIN-LEFT:150px"><font size=2 color=#505050 face=sans-serif>Name</LABEL></TD><TD>&nbsp&nbsp
<INPUT TYPE=TEXT SIZE=20 name="tName"  value="Your Name" onfocus="namefocus(),TTip('Please enter your name here',620,420)" onblur="nameblur(),Tip('')">&nbsp&nbsp&nbsp&nbsp<IMG name="tName" src="white.gif"></TD></TR><TR></TR>
<TR><TD align=right><LABEL><font size=2 color=#505050 face=sans-serif>Password</LABEL></TD><TD>&nbsp&nbsp
<INPUT TYPE=password SIZE=20 name="tPass" class="fields" onfocus="pwdfocus(),TTip('Please enter your password here<BR> password length should be atleast 6 characters',620,280)" onblur="pwdblur(),Tip('')" >&nbsp&nbsp&nbsp&nbsp<IMG name="imgPass" src="white.gif"></TD></TR><TR></TR>
<TR><TD align=right><LABEL><font size=2 color=#505050 face=sans-serif>Confirm Password</LABEL></TD><TD>&nbsp&nbsp<INPUT TYPE=password SIZE=20 name="tConfirm" onfocus="cnpwdfocus(),TTip('Please confirm your password here',620,325)" onblur="cnpwdblur(),Tip('')">&nbsp&nbsp&nbsp&nbsp<IMG name="cnpwdimg" src="white.gif"></TD></TR>
<TR><TD align=right><LABEL><font size=2 color=#505050 face=sans-serif>Gender</LABEL></TD>
<TD>&nbsp&nbsp<INPUT TYPE=RADIO name="tGen" value="M"  onblur="verifygender(),Tip('')" onfocus="TTip('Please select your gender here',620,450)">Male
&nbsp&nbsp<INPUT TYPE=RADIO name="tGen" value="F"   onblur="verifygender(),Tip('')" onfocus="TTip('Please select your gender here',620,450)">Female
&nbsp&nbsp&nbsp&nbsp<IMG name="genimg" src="white.gif"></TD></TR><TR></TR>
<TR><TD align=right><LABEL><font size=2 color=#505050 face=sans-serif>Contact No</LABEL></TD><TD>&nbsp&nbsp<INPUT TYPE=TEXT SIZE=20 name="tMobile" class="fields" onfocus="phnofocus(),TTip('Please enter your contact number here',610,770)" onblur="phnoblur(),Tip('')" value="Phone Number" >&nbsp&nbsp&nbsp&nbsp<IMG name="phnoimg" src="white.gif"></TD></TR><TR></TR>
<tr>
<td colspan="2">
<TR><TD <label><font size=2 color=#004cca face=sans-serif style="margin-left:100px"><b>2. For Security . . .</b></font></label>></TD></TR>
</td>
</tr>
<TR><TD align=right><LABEL style="MARGIN-LEFT:80px"><font size=2 color=#505050 face=sans-serif>Security Question</LABEL></TD><TD>&nbsp
<SELECT name="tSec"    onchange="verifysec(),Tip('') " onblur="verifysec(),Tip('')"  onfocus="TTip('Select your security question',680,880)">
<OPTION value=0>- Select your question -
<OPTION value="What is your pet name?">What is your pet name?
<OPTION value="What is your favourite teacher's name?">What is your favourite teacher's name?
<OPTION value="Who is your favourite hero?">Who is your favourite hero?
<OPTION value="Who is your favourite heroine?">Who is your favourite heroine?
<OPTION value="What is your favourite sport?">What is your favourite sport?
</SELECT>
&nbsp&nbsp&nbsp&nbsp<IMG name="secimg" src="white.gif"></TD></TR><TR></TR>
<TR><TD align=right><LABEL><font size=2 color=#505050 face=sans-serif>Your Answer:</LABEL></TD><TD>&nbsp&nbsp<INPUT TYPE=TEXT SIZE=20 name="tAns" class="fields" value="Your Security Answer"     onfocus="secansfocus(),TTip('Please enter your security answer here ',570,920)" onblur="secansblur(),Tip('')" >&nbsp&nbsp&nbsp&nbsp<IMG name="secansimg" src="white.gif"></TD></TR><TR></TR>
<tr>
<td align="right"><input type="submit" value="Register"/></td>
<td align="right"><input type="reset" value="Clear"/></td>
</tr>
</table>

<HR  size=1 color=black width=92% align=center>
<LABEL style="margin-left:50px"><font size=2 color=#505050 >The details you have provided above should match with the <font size=2 color=#004cca >college records</font>.</label>
Then only the <font size=2 color=#004cca >Administrator</font> </label><br>
<LABEL style="margin-left:50px"><font size=2 color=#505050>accepts your <font size=2 color=#004cca >registration request</font>. So please <font size=2 color=#004cca >verify</font> all the details you have entered above.
After registration you</label><BR>
<LABEL style="margin-left:50px">can login by using your <font size=2 color=#004cca >Regd.no</font> and the <font size=2 color=#004cca >Password</font> you have chosen 
</DIV>
</form>




</BODY>
</HTML>


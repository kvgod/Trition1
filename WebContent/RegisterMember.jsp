<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

HttpSession sess = request.getSession();
System.out.println("session.getAttribute(session)"+session.getAttribute("session"));
if(session.getAttribute("session")!=null)
{
%>

	<form action="addNewMember" method="post">
		
		Member Id:<input type="text" id="member_id" name="memberId" placeholder="Member Id" required><br><br>
		
		Name:<input type="text" id="member_name" name="memberName" placeholder="Member Name" required><br><br>
		
		E-Mail:<input type="text" id="email_id" name="Email" placeholder="Email ID" required><br><br>
		
		Contact Number:<input type="text" id="member_contact" name="memberContact" placeholder="Contact Number" required><br><br>
		
		Date of Birth:<input type="date" id="date_of_birth" name="dateOfBirth" placeholder="Date Of Birth" required><br><br>
		
		Address:<textarea rows="4" cols="25" name="address" placeholder="Please Enter Permanent Address" required></textarea><br>
		<br>
		<input type="submit" value="Submit">
		
	</form>

<%
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
%>

</body>
</html>
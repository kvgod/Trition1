<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Pragma" content="no-cache">
<title>Admin Dashboard</title>
</head>
<body>
<%

HttpSession sess = request.getSession();
System.out.println("session.getAttribute(session)"+session.getAttribute("session"));
if(session.getAttribute("session")!=null)
{
%>

<h2>Keep me guessing, It works  </h2>
<br>
<h3 style="color:green;">${success}</h3>

<h3 style="color:red;">${error_member_details}</h3>

<br><br>

<a href="RegisterMember.jsp">Register a member</a>
<br><br>
<a href="viewMembers"> View Member Details</a>
<br><br>
<br>
<br>
<a href="viewBalanceSheet">View Balance Sheet</a>
<br>
<br>
<a href="viewMembers"> View Member Details</a>
<br>
<br>
<a href="Receipt.jsp">Receipt</a>
<br>
<br>

<a href="logout">Logout</a>

<%
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
%>



</body>
</html>
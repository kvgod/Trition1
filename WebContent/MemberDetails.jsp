<%@page import="com.technophillia.test.vo.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
<%
HttpSession sess = request.getSession();
System.out.println("session.getAttribute(session)"+session.getAttribute("session"));
if(session.getAttribute("session")!=null){
%>
<table><tr><th>Sl No</th><th>Member Id</th><th>Member Name</th><th>Contact Number</th><th>E-Mail ID</th><th>Date of Birth</th><th>Address</th></tr>
<%
List<MemberBean> result = (List)request.getAttribute("member_details");
int i=1;
for(MemberBean bean: result){
	%>
	<tr><td><%=i%></td>
	<td><%=bean.getMemberId()%></td>
	<td><%=bean.getMemberName()%></td>
	<td><%=bean.getMemberContactNumber()%></td>
	<td><%=bean.getMemberEmailId()%></td>
	<td><%=bean.getMemberDOB()%></td>
	<td><%=bean.getMemberAddress()%></td>
	</tr>
<%
i++;
}
%>
</table>


<%
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
%>
</body>
</html>
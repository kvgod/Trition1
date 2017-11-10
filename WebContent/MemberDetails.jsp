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
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script>

$(document).ready(function(){
    $('#myTable').DataTable();
});

</script>

</head>
<body>
<%
HttpSession sess = request.getSession();
System.out.println("session.getAttribute(session)"+session.getAttribute("session"));
if(session.getAttribute("session")!=null){
%>

<!-- 
	<script>  
	var request=new XMLHttpRequest();  
	
	function searchInfo()
	{  
		var name=document.vinform.name.value;  
		var url="/Hibernateproject1/viewSpecificMembers?name="+name;  
		  
		try{  
			request.onreadystatechange=function()
			{  
				if(request.readyState==4)
				{  
				var val=request.responseText;  
				document.getElementById('mylocation').innerHTML=val;  
				}  
			}//end of function  
			
			request.open("GET",url,true);  
			request.send();  
		}catch(e){alert("Unable to connect to server");}  
	}  
	</script>
-->


  
</head>  
<body>
<h3>Search</h3>  
<form name="vinform">  
<input type="text" name="name" onkeyup="searchInfo()">  
</form>  


<span id="mylocation"></span>  


<table id="mytable"><tr><th>Sl No</th><th>Member Id</th><th>Member Name</th><th>Contact Number</th><th>E-Mail ID</th><th>Date of Birth</th><th>Address</th></tr>
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
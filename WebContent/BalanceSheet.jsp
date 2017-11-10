<%@page import="com.technophillia.test.vo.BalanceSheetBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Balance Sheet</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">

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
<script type="text/javascript">
$(document).ready(function(){
	alert("Lets See");
    $('#example').DataTable({
    	  "scrollX": true
    });
});

</script>
</head>
<body>
<%
HttpSession sess = request.getSession();
System.out.println("session.getAttribute(session)"+session.getAttribute("session"));
if(session.getAttribute("session")!=null){
%>
		<table id="example" class="display" cellspacing="0" width="100%">
		<thead>
		<tr>
		
		<th>Sl No</th>
		<th>Member Id</th>
		<th>Member Name</th>
		<th>ShareCapital Opening Balance</th>
		<th>ShareCapital Current Year</th>
		<th>ShareCapital Current Balance</th>
		<th>Thrift Opening Balance</th>
		<th>Thrift Current Year</th>
		<th>Thrift Interest</th>
		<th>Thrift Current Balance</th>
		<th>RD Opening Balance</th>
		<th>RD Current Year</th>
		<th>RD Refund</th>
		<th>RD Current Balance</th>
		<th>RD Interest Received</th>
		<th>FD Interest Received</th>
		<th>Loan outstanding</th>
		<th>loan Interest Paid</th>
		<th>Admission Fees</th>
		<th>Dividend</th>
		</tr>
		</thead>
		<tbody>
<%
List<BalanceSheetBean> result = (List)request.getAttribute("member_details");
int i=1;
for(BalanceSheetBean bean: result){
	%>
			<tr><td><%=i%></td>
				<td><%=bean.getMemberId()%></td>
				<td><%=bean.getMemberName()%></td>
				<td><%=bean.getShareCapitalOpeningBalance()%></td>
				<td><%=bean.getShareCapitalCurrentYear()%></td>
				<td><%=bean.getShareCapitalCurrentBalance()%></td>
				<td><%=bean.getThriftopeningBalance()%></td>
				<td><%=bean.getThriftCurrentYear()%></td>
				<td><%=bean.getThriftInterest()%></td>
				<td><%=bean.getThriftCurrentBalance()%></td>
				<td><%=bean.getRecurringDepositOpeningBalance()%></td>
				<td><%=bean.getRecurringDepositCurrentYear()%></td>
				<td><%=bean.getRecurringDepositRefund()%></td>
				<td><%=bean.getRecurringDepositCurrentBalance()%></td>
				<td><%=bean.getRecurringDepositInterestReceived()%></td>
				<td><%=bean.getFixedDepositInterestReceived()%></td>
				<td><%=bean.getLoanOutstanding()%></td>
				<td><%=bean.getLoanInterestPaid()%></td>
				<td><%=bean.getAdmissionFees()%></td>
				<td><%=bean.getDividend()%></td>
			</tr>
<%
i++;
}
%>
</tbody>
</table>


<%
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
%>
</body>
</html>
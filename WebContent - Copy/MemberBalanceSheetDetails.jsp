<%@page import="com.technophillia.test.vo.BalanceSheetBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="sty.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body id="contact">
<style>
/*Contact sectiom*/
.content-header{
  font-family: Agency FB;
  color:#fcc500;
  font-size: 45px;
}
body{
font-family: Agency FB;
font-size:12px;
}

.section-content{
  text-align: center; 

}
#contact{
    
    font-family: Agency FB;
  padding-top: 60px;
  width: 100%;
  
  height: 550px;
  background: #3a6186; /* fallback for old browsers */
  background: -webkit-linear-gradient(to left, #3a6186 , #89253e); /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to left, #062d52 , #ea809b); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  
  
    color : black;    
}
.contact-section{
  padding-top: 40px;
}

.form-group{
  margin-top: 10px;
}
label{
  font-size: 1.3em;
  line-height: 1em;
  font-weight: normal;
}
.form-control{
  font-size: 1.9em;
  color: #080808;
}
textarea.form-control {
    height: 135px;
   /* margin-top: px;*/
}

.submit{
  font-size: 1.1em;
  float: left;
  width: 150px;
  background-color: transparent;
  color: #fff;

}
.validate{
display:none;
color:black;
}

#drop_input{
border: 1px solid white;
border-radius:5px;
padding:2%;
}
.bootstrap-datetimepicker-widget{

color:black !important;
}

#share,#thrift,#recuring,#loan{
margin-top: 0px;
margin-bottom: 0px;
cursor:pointer;
}
</style>
<%
HttpSession sess = request.getSession();
System.out.println("session.getAttribute(session)"+session.getAttribute("session"));
System.out.println("session.getId()"+session.getId());
System.out.println("session.getMaxInactiveInterval()"+session.getMaxInactiveInterval());
if(session.getAttribute("session")!=null){
%>

<%
List<BalanceSheetBean> result = (List)request.getAttribute("member_details");
%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12 form-line">
				<form name="registration" method="post" action="updateBalanceSheet">
				
					<div class="form-group">
						<label for="id">Id</label> <input disabled 
							type="text" class="form-control" id="id" name="id"
							placeholder=" Id" value ="<%=result.get(0).getMemberId()%>">
					</div>


					<div class="form-group">
						<label for="exampleInputUsername">Member name</label> <input disabled 
							type="text" class="form-control" id="name" name="name"
							placeholder=" Enter Name" value ="<%=result.get(0).getMemberName()%>">
					</div>

<div id="drop_input" class="form-group"><h2 id="share">Share Capital</h2>
<div id="sharecapital" style="display:none;">
					<div  class="form-group" >
						<label for="sc_ob">Opening Balance</label> <input type="text"
							class="form-control" id="sc_ob" name="sc_ob"
							placeholder=" Opening Balance" value="<%=result.get(0).getShareCapitalOpeningBalance()%>">
					</div>
					
					<div  class="form-group" >
						<label for="sc_cy">Current Year</label> <input type="text"
							class="form-control" id="sc_cy" name="sc_cy"
							placeholder=" Current Year" value="<%=result.get(0).getShareCapitalCurrentYear()%>">
					</div>
					
					<div  class="form-group" >
						<label for="sc_cb">Current Balance</label> <input type="text"
							class="form-control" id="sc_cb" name="sc_cb"
							placeholder=" Current Balance" value="<%=result.get(0).getShareCapitalCurrentBalance()%>">
					</div>
					</div>
</div>
<div id="drop_input" class="form-group"><h2 id="thrift">Thrift</h2>
<div id="thriftval" style="display:none;">
					<div  class="form-group" >
						<label for="tft_ob">Opening Balance</label> <input type="text"
							class="form-control" id="tft_ob" name="tft_ob"
							placeholder=" Opening Balance" value="<%=result.get(0).getThriftopeningBalance()%>">
					</div>
					
					<div  class="form-group" >
						<label for="tft_cy">Current Year</label> <input type="text"
							class="form-control" id="tft_cy" name="tft_cy"
							placeholder=" Current Year" value="<%=result.get(0).getThriftCurrentYear()%>">
					</div>

					<div  class="form-group" >
						<label for="tft-int">Interest</label> <input type="text"
							class="form-control" id="tft-int" name="tft-int"
							placeholder=" Interest" value="<%=result.get(0).getThriftInterest()%>">
					</div>
					
					<div  class="form-group" >
						<label for="tft_cb">Current Balance</label> <input type="text"
							class="form-control" id="tft_cb" name="tft_cb"
							placeholder=" Current Balance" value="<%=result.get(0).getThriftCurrentBalance()%>">
					</div>
					</div>
</div>
<div id="drop_input" class="form-group"><h2 id="recuring">Recurring Deposit</h2>
<div id="recur" style="display:none;">
					<div  class="form-group" >
						<label for="rec_ob">Opening Balance</label> <input type="text"
							class="form-control" id="rec_ob" name="rec_ob"
							placeholder=" Opening Balance" value="<%=result.get(0).getRecurringDepositOpeningBalance()%>">
					</div>
					
					<div  class="form-group" >
						<label for="rec_cy">Current Year</label> <input type="text"
							class="form-control" id="rec_cy" name="rec_cy"
							placeholder=" Current Year" value="<%=result.get(0).getRecurringDepositCurrentYear()%>">
					</div>

					<div  class="form-group" >
						<label for="rec-int">Refund</label> <input type="text"
							class="form-control" id="rec-int" name="rec-int"
							placeholder=" Interest" value="<%=result.get(0).getRecurringDepositRefund()%>">
					</div>
					
					<div  class="form-group" >
						<label for="rec_cb">Current Balance</label> <input type="text"
							class="form-control" id="rec_cb" name="rec_cb"
							placeholder=" Current Balance" value="<%=result.get(0).getRecurringDepositCurrentBalance()%>">
					</div>
					</div>
</div>
<div id="drop_input" class="form-group"><h2 id="loan">Loan</h2>
<div id="loandetail" style="display:none;">
					<div  class="form-group" >
						<label for="loan_outst">Outstanding</label> <input type="text"
							class="form-control" id="loan_outst" name="loan_outst"
							placeholder=" Outstanding" value="<%=result.get(0).getLoanOutstanding()%>">
					</div>
					
					<div  class="form-group" >
						<label for="loan_int_paid">Interest Paid</label> <input type="text"
							class="form-control" id="loan_int_paid" name="loan_int_paid"
							placeholder=" Interest Paid" value="<%=result.get(0).getLoanInterestPaid()%>">
					</div>

					</div>
</div>
					<div class="form-group">
						<label for="rd_int_rec">RD Interest Received</label> <input
							type="text" class="form-control" id="rd_int_rec" name="rd_int_rec"
							placeholder=" RD Interest Received" value="<%=result.get(0).getRecurringDepositInterestReceived()%>">
					</div>
					<div class="form-group">
						<label for="fd_int_rec">FD Interest Received</label> <input
							type="text" class="form-control" id="fd_int_rec" name="fd_int_rec"
							placeholder=" FD Interest Received" value="<%=result.get(0).getFixedDepositInterestReceived()%>">
					</div>
					<div class="form-group">
						<label for="admission_fees">Admission Fees</label> <input
							type="text" class="form-control" id="admission_fees" name="admission_fees"
							placeholder=" Admission Fees" value="<%=result.get(0).getAdmissionFees()%>">
					</div>
					<div class="form-group">
						<label for="dividend">Dividend</label> <input
							type="text" class="form-control" id="dividend" name="dividend"
							placeholder=" Dividend" value="<%=result.get(0).getDividend()%>">
					</div>




					<div>

						<button type="submit" class="btn btn-default submit">
							<i class="fa fa-paper-plane" aria-hidden="true"></i> Submit
						</button>
					</div>


				</form>
			</div>


		</div>
	</div>
	
	
<script>
$("#share").click(function(){
    $("#sharecapital").toggle("slow");
});
$("#thrift").click(function(){
    $("#thriftval").toggle("slow");
});
$("#recuring").click(function(){
    $("#recur").toggle("slow");
});
$("#loan").click(function(){
    $("#loandetail").toggle("slow");
});


</script>
</body>

<%
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
%>
</body>
</html>
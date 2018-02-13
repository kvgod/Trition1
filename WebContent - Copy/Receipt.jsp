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

<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css">

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
font-size:10px;
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
request.getSession(true).setAttribute("member_balance_sheet", result);
String memberId = result.get(0).getMemberId();
String memberName = result.get(0).getMemberName();
%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12 form-line">
				<form name="receiptCheck" method="post" action="receiptCheck">
				
				
					<div class="form-group">
						<label for="id">Id</label> <input  
							type="text" class="form-control" id="id" name="memberId"
							placeholder=" Id" value ="<%=memberId%>">
					</div>


					<div class="form-group">
						<label for="exampleInputUsername">Member name</label> <input 
							type="text" class="form-control" id="name" name="memberName"
							placeholder=" Enter Name" value ="<%=memberName%>">
					</div>
					
					<div class="form-group">
						<label for="exampleSelectHead">Head</label> 
						<select name="headValue" class="form-control	">
							<option value="-1">Select head</option>
  							<option value="monthly_thrift">Monthly Thrift</option>
							<option value="loan_repayment">Loan Repayment</option>
							<option value="share_capital">Share Capital</option>
							<option value="#">#</option>
						</select>
					</div>
					
					<div class="form-group">
						<label for="id">Rs</label> <input 
						type="text" class="form-control" id="id" name="paymentValue"
							placeholder="Payment in Rupees" >
					</div>

					<div class="form-group">
					 <label for="dob">Transaction Date</label> 
               		 <div class='input-group date' id='datetimepicker1'>
                  		 <input type="date" class="form-control" name="transaction_date" id="transaction_date"/>
                    	 <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    	</span>
                	</div>
           		 	</div>
           		 	
           		 	<div class="form-group">
						<label for="description">Transaction Description</label> <textarea type="text"
							class="form-control" name="transactionDescription" id="transactionDescription"
							placeholder=" Please enter a description for this transaction"></textarea>
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
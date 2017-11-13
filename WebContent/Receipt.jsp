<%@page import="com.technophillia.test.vo.BalanceSheetBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<link rel="stylesheet" 
  href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
  <script type="text/javascript">
  $(document).ready(function() 
	{
	     $(function() 
	    {
	         $("#search").autocomplete(
	        {
	             source : function(request, response)
	             {
		            $.ajax(
		            {
		                    url : "searchAjax",
		                    type : "GET",
		                    data : 
		                    {
		                           term : request.term
		                    },
		                    dataType : "json",
		                    success : function(data) 
		                    {
		                          response(data);
		                          
		                    }
		             });
	          	}
	         
	      });
	        
	   });
	});
  </script>
</head>
<body>
<style>
/*Contact sectiom*/
.content-header{
  font-family: Agency FB;
  color:#fcc500;
  font-size: 45px;
}
body{
font-family: Agency FB;
font-size:25px;
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
if(session.getAttribute("session")!=null)
{
%>

	<form action="#" method="post">
		
		<div class="search-container">
        <div class="ui-widget">Search For Member<input type="text" id="search" name="search" class="search" /></div>
		</div>
		
<%




List<BalanceSheetBean> result = (List)request.getAttribute("member_details");

	System.out.println(result);


%>
		
		
	</form>

<%
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
%>

</body>
</html>
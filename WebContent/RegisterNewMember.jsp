<html>
<head>
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
<link rel="stylesheet" href="sty.css">
<!-- <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css">
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	
<!-- <script src="js/jquery.min.js"></script> -->
<!-- <script src="js/jquery.validate.min.js"></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>

<!-- <script src="bootstrap/js/bootstrap.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js"></script>
<script>
$(document).ready(function() {	

// Wait for the DOM to be ready
$(function() 
{
	  // Initialize form validation on the registration form.
	  // It has the name attribute "registration"
	  $("form[name='registration']").validate({
		// Specify validation rules
		rules: {
		  // The key name on the left side is the name attribute
		  // of an input field. Validation rules are defined
		  // on the right side
		  id: "required",
		  name: "required"
		},
		// Specify validation error messages
		messages: {
		  id: "Please enter an Id",
		  name: "Please enter your name"
		},
		// Make sure the form is submitted to the destination defined
		// in the "action" attribute of the form when valid
		submitHandler: function(form) {
		  form.submit();
		}
	  });
	  
});
	$(function () 
	{
		   var bindDatePicker = function() {
				$(".date").datetimepicker({
				format:'YYYY-MM-DD',
					icons: {
						time: "fa fa-clock-o",
						date: "fa fa-calendar",
						up: "fa fa-arrow-up",
						down: "fa fa-arrow-down"
					}
				}).find('input:first').on("blur",function () {
					// check if the date is correct. We can accept dd-mm-yyyy and yyyy-mm-dd.
					// update the format if it's yyyy-mm-dd
					var date = parseDate($(this).val());

					if (! isValidDate(date)) {
						//create date based on momentjs (we have that)
						date = moment().format('YYYY-MM-DD');
					}

					$(this).val(date);
				});
			}
   
		   var isValidDate = function(value, format) {
				format = format || false;
				// lets parse the date to the best of our knowledge
				if (format) {
					value = parseDate(value);
				}

				var timestamp = Date.parse(value);

				return isNaN(timestamp) == false;
		   }
   
		   var parseDate = function(value) {
				var m = value.match(/^(\d{1,2})(\/|-)?(\d{1,2})(\/|-)?(\d{4})$/);
				if (m)
					value = m[5] + '-' + ("00" + m[3]).slice(-2) + '-' + ("00" + m[1]).slice(-2);

				return value;
		   }
   
		bindDatePicker();
	});
});
</script>


</head>
<body id="contact">
<%
HttpSession sess = request.getSession();
System.out.println("session.getAttribute(session)"+session.getAttribute("session"));
System.out.println("session.getId()"+session.getId());
System.out.println("session.getMaxInactiveInterval()"+session.getMaxInactiveInterval());
if(session.getAttribute("session")!=null){
%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12 form-line">
				<form name="registration" method="post" action="addNewMember">
				
					<div class="form-group">
						<label for="id">Id</label> <input
							type="text" class="form-control" id="id" name="memberId"
							placeholder=" Id">
					</div>


					<div class="form-group">
						<label for="exampleInputUsername">Your name</label> <input
							type="text" class="form-control" id="name" name="memberName"
							placeholder=" Enter Name" >
					</div>


					<div class="form-group">
						<label for="telephone">Mobile No.</label> <input type="text"
							class="form-control" id="telephone" name=memberContact
							placeholder=" Enter 10-digit mobile no.">
					</div>

					<div class="form-group">
						<label for="emailid">Email Id</label> <input type="text"
							class="form-control" name="Email" id="emailid"
							placeholder=" Enter Email id">
					</div>
										
					<div class="form-group">
						<label for="address">Address</label> <textarea type="text"
							class="form-control" name="address" id="address"
							placeholder=" Address"></textarea>
					</div>
       
                    <div class="form-group">
					 <label for="dob">Date of Birth</label> 
                <div class='input-group date' id='datetimepicker1'>
                   <input type="date" class="form-control" name="dateOfBirth" id="dob"/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
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
	

<%
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
%>
</body>
</html>

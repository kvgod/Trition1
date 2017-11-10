<html>
<head>
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
	alert("doc.ready");

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
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12 form-line">
				<form name="registration" method="post" action="registerdb.html">
				
					<div class="form-group">
						<label for="id">Id</label> <input
							type="text" class="form-control" id="id" name="id"
							placeholder=" Id">
					</div>


					<div class="form-group">
						<label for="exampleInputUsername">Your name</label> <input
							type="text" class="form-control" id="name" name="name"
							placeholder=" Enter Name" >
					</div>


					<div class="form-group">
						<label for="telephone">Mobile No.</label> <input type="number"
							class="form-control" id="telephone" name="telephone"
							placeholder=" Enter 10-digit mobile no.">
					</div>

					<div class="form-group">
						<label for="emailid">Email Id</label> <input type="text"
							class="form-control" name="emailid" id="emailid"
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
                    <input type='text' class="form-control" name="dob" id="dob"/>
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
	

</body>
</html>

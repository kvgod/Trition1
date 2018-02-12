<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>

</head>

<body>
<%
try {
    String target = new String("C:\\Program Files\\MongoDB\\Server\\3.4\\bin\\mongod.exe");
//String target = new String("mkdir stackOver");
	System.out.println("Running Scriptlet");
    Runtime rt = Runtime.getRuntime();

    Process proc = rt.exec(target);

    //proc.waitFor();
    StringBuffer output = new StringBuffer();
    BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
    String line = "";                       
    while ((line = reader.readLine())!= null) {
            output.append(line + "\n");
    }
    System.out.println("### " + output);
} catch (Throwable t) {
    t.printStackTrace();
}


%>


	<h1>Welcome to Admin home page</h1>
	
	
	<!-- <img alt="Check Image" src="asset/logo.png"> -->
	
	
	<form action="checkAdmin" method="post">
		Enter your MemberId: <input type="text" name="username" id="mail"/>
		<br> Enter your password: <input type="password" name="password" id="passw"/>
		<br> <button type="submit">Submit</button>

	</form>
	<h2>${error}</h2>
</body>
</html>
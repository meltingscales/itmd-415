<%@page import="java.io.PrintWriter"%>
<%@page import="Final.Customer.*"%>
<%@page import="Final.Customer.Exceptions.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign up!</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/final/css/screen.css" />
</head>
<body>
	<nav><jsp:include page="/navbar.inc"></jsp:include></nav>
	<%
	    try
	    {
	        Customer c = CustomerSignupServlet.createCustomer(request);

	        out.write(c.toString());
	    }
	    catch(FormNotFilledOutException e)
	    {
	        out.write("Missing this form data:");
	        out.write(e.getList());
	    }
	    catch(CustomerAlreadyExistsException e)
	    {
	        out.write(String.format("Username '%s' is taken!", request.getParameter("username")));
	    }
	%>
</body>
</html>
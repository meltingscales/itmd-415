<%@page import="java.io.PrintWriter"%>
<%@page import="Final.*"%>
<%@page import="Final.Product.*"%>
<%@page import="Final.Customer.*"%>
<%@page import="Final.Customer.Exceptions.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%
    ProductHandler ph = new ProductHandler();
    String message = "";
    try
    {
        Product p = ProductCreationServlet.createProduct(request);
    }
    catch (FormNotFilledOutException e)
    {
        message = e.getList();
    }

    if (!message.equalsIgnoreCase(""))
    {
        message = Lib.wrap(message, "ul");
        message = Lib.wrap("Missing form elements: ", "p") + message;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New [OBJECT] created!</title>
<link rel="stylesheet" href="/final/css/screen.css" />
</head>
<body>
  <nav><jsp:include page="/navbar.jsp"></jsp:include></nav>

  <%=message%>
</body>
</html>
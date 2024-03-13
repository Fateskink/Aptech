<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
</head>
<body>
    <h1>Welcome to our website!</h1>
    <p>This is a simple example of a JSP file.</p>
    <%-- Java code embedded within JSP --%>
    <% 
        // Declare and initialize a variable
        String username = "Guest";
        
        // Get the value of a request parameter named "username"
        String requestUsername = request.getParameter("username");
        
        // If requestUsername is not null or empty, update the username
        if (requestUsername != null && !requestUsername.isEmpty()) {
            username = requestUsername;
        }
    %>
    <p>Hello, <%= username %>!</p>
</body>
</html>

<%@ page import="java.util.List" %>
<%@ page import="entities.Employee" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is Employees</h1>           
        <table class="table">
        <tr>
            <th>Employee No</th>
            <th>Employee Name</th>
            <th>Place of Work</th>
            <th>Phone Number</th>
        </tr>
        <%-- Lặp qua danh sách employees và hiển thị thông tin --%>
        <% List<Employee> employees = (List<Employee>) request.getAttribute("employees"); %>
        <% for (Employee employee : employees) { %>
            <tr>
                <td><%= employee.getEmployeeNo() %></td>
                <td><%= employee.getEmployeeName() %></td>
                <td><%= employee.getPlaceOfWork() %></td>
                <td><%= employee.getPhoneNumber() %></td>
            </tr>
        <% } %>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

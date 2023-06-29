<%-- 
    Document   : add_employee.jsp
    Created on : Jun 29, 2023, 7:23:14 PM
    Author     : w11
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    <form action="EmployeeServlet" method="POST">
        <input type="hidden" name="action" value="add">
        
        <label for="employeeNo">Employee No:</label>
        <input type="text" id="employeeNo" name="employeeNo" required>
        <br>
        
        <label for="employeeName">Employee Name:</label>
        <input type="text" id="employeeName" name="employeeName" required>
        <br>
        
        <label for="placeOfWork">Place of Work:</label>
        <input type="text" id="placeOfWork" name="placeOfWork" required>
        <br>
        
        <label for="phoneNo">Phone No:</label>
        <input type="text" id="phoneNo" name="phoneNo">
        <br>
        
        <input type="submit" value="Save">
    </form>
</body>
</html>



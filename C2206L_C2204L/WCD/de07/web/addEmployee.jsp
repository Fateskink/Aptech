<html>
<head>
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
        crossorigin="anonymous">
    <title>Add Employee</title>
</head>
<body>
    <h1>Add Employee</h1>
    <div class="container">
        <form action="EmployeeServlet?action=insert" method="POST" >
        <div class="mb-3">
            <label for="employeeNo" class="form-label">Employee No:</label>
            <input type="text" class="form-control" id="employeeNo" name="employeeNo" required>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="placeOfWork" class="form-label">Place of Work:</label>
            <input type="text" class="form-control" id="placeOfWork" name="placeOfWork" required>
        </div>
        <div class="mb-3">
            <label for="phoneNo" class="form-label">Phone No:</label>
            <input type="text" class="form-control" id="phoneNo" name="phoneNo" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-secondary">Reset</button>
    </form>

    <a href="employees.jsp">Back to List</a>     
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
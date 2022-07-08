<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Login</h1>
    <form action="/users/login" method="post">    
    <table>
        <tr>
            <td>Username</td>
            <td><input type="text" name="username" placeholder="Enter username"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password" placeholder="Enter password"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Login"></td>
            <td></td>
        </tr>
    </table>
    </form>
</body>
</html>
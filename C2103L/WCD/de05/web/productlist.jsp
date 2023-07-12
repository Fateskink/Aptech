<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
    <h2>Product List</h2>
    <form action="ProductServlet" method="GET">
        <label for="search">Search:</label>
        <input type="text" id="search" name="search">
        <input type="submit" value="Search">
    </form>
    <br>
    <table>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
        </tr>
        <%-- Lặp qua danh sách sản phẩm và tạo các hàng trong bảng --%>
        <% for (Product product : productList) { %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getProductName() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getQuantity() %></td>
                <td>
                    <a href="ProductServlet?action=delete&id=<%= product.getId() %>"
                       onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                </td>
            </tr>
        <% } %>
    </table>
</body>
</html>

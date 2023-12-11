
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entities.Product" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
          List<Product> products = (List<Product>) request.getAttribute("products"); 
          int x = 11;
       %>
       <div class="row">
            <% for (Product product : products) { %>
               <div class="col-md-4">
                  <div class="card">
                     <img src="<%= product.getUrl() %>" class="card-img-top" alt="Product Image" width="100" height="100">
                     <div class="card-body">
                        <h5 class="card-title"><%= product.getName() %></h5>
                        <p class="card-text"><strong>Price:</strong> <%= product.getPrice() %></p>
                     </div>
                  </div>
               </div>
            <% } %>
         </div>
    </body>
</html>

<%@page import="models.Mobile"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Mobiles</title>
    <style>
        .product {
            width: 30%;
            display: inline-block;
            margin: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        .product img {
            max-width: 100%;
            height: auto;
        }
        .insert-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>List of Mobiles</h1>

    <%-- Iterate through the list of mobiles and display them in 3 columns --%>
    <div class="product-container">
        <c:forEach var="mobile" items="${mobiles}">
            <div class="product">
        <img src="${mobile.imageSrc}" alt="${mobile.mobileName}">
        <h2>${mobile.mobileName}</h2>
        <p>Price: ${mobile.price}</p>
        <p>Warranty: ${mobile.warranty}</p>
        <p>In Stock: ${mobile.inOutStock == 1 ? 'Yes' : 'No'}</p>
        <p>Accessories: ${mobile.accessories}</p>
        <c:url var="editUrl" value="/MobileServlet">
            <c:param name="action" value="edit" />
            <c:param name="mobileId" value="${mobile.mobileId}" />
        </c:url>
        <a href="${editUrl}">Edit</a>
    </div>

        </c:forEach>
    </div>                
</div>

                
                

    <%-- Link to insert a new product --%>
    <div class="insert-link">
        <a href="<c:url value='/insert-mobile.jsp' />">Insert new product</a>
    </div>
</body>
</html>


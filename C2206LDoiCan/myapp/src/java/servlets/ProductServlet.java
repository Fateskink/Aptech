/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import com.mysql.cj.jdbc.Driver;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import models.Product;

public class ProductServlet extends HttpServlet {
    private EntityManagerFactory entityManagerFactory 
            = Persistence.createEntityManagerFactory("myappPU");
    
    @Override
    //get products by category_id
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        EntityManager entityManager = null;
        try {
            String categoryId = request.getParameter("category_id");
            TypedQuery<Product> query = entityManager.createQuery(
            "SELECT p FROM Product p WHERE p.category.id = :categoryId", Product.class);
            query.setParameter("categoryId", categoryId); // Assuming categoryId is of type Long
            List<Product> products = query.getResultList();
            // Set the products as an attribute in the request
            request.setAttribute("products", products);

            RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle any exceptions
            e.printStackTrace(); // This is just for demonstration, you should handle exceptions appropriately
        } finally {
            // Ensure that the EntityManager is closed to release resources
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}

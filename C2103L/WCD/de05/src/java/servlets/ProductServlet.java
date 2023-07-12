/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sunli
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("your_persistence_unit_name");
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    
    try {
        TypedQuery<Product> query = entityManager.createNamedQuery("Product.findAll", Product.class);
        List<Product> productList = query.getResultList();
        
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("productlist.jsp").forward(request, response);
    } finally {
        entityManager.close();
        entityManagerFactory.close();
    }
}

}

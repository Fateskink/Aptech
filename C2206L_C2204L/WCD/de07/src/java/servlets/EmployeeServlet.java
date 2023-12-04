/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import entities.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.*;
import java.util.List;
import javax.persistence.*;

public class EmployeeServlet extends HttpServlet {
    private RequestDispatcher dispatcher;    
    private EntityManager entityManager;

    @Override
    public void init() throws ServletException {
        super.init(); 
        System.out.println("init...");
    }

    @Override
    public void destroy() {
        super.destroy(); 
        System.out.println("destroy...");
    }
    
    @Override    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //http://localhost:8080/de07/EmployeeServlet?x=2&y=3
        /*
        Integer x = Integer.valueOf(request.getParameter("x"));
        Integer y = Integer.valueOf(request.getParameter("y"));
        Integer sum = x + y;
        request.setAttribute("sum", sum);
        */        
        try {   
             // Lấy giá trị của tham số employeeNo từ URL
            String employeeNo = request.getParameter("employeeNo");        
            // Lấy giá trị của tham số action từ URL
            String action = request.getParameter("action") == null ? "" : 
                    request.getParameter("action");
            entityManager = Persistence
                        .createEntityManagerFactory("de07PU")
                        .createEntityManager();
            if(action.toLowerCase().equals("delete")) {
                entityManager.getTransaction().begin();
                // Tìm nhân viên cần xóa dựa trên mã số nhân viên
                Employee employee = entityManager.find(Employee.class, employeeNo);
                if (employee != null) {
                    // Xóa nhân viên
                    entityManager.remove(employee);
                }
                entityManager.getTransaction().commit();
                //entityManager.close();
            } 
            List<Employee> employees = entityManager.createNamedQuery(
                        "Employee.findAll", Employee.class).getResultList();
                request.setAttribute("employees", employees);
                this.dispatcher = request.getRequestDispatcher("employees.jsp");
                dispatcher.forward(request, response);
                this.entityManager.close();
                this.entityManager.getEntityManagerFactory().close();                        
        } catch (ServletException | IOException e) {
            System.err.println(e.toString());        
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : 
                    request.getParameter("action");
        if(action.toLowerCase().equals("insert")) {
            //chagpt: lam the nao lay duoc du lieu tren form vao day va goi ham insert
            //sau khi insert data thi Back ve doGet o tren
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

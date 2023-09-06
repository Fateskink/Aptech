/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Mobile;
import com.mysql.cj.jdbc.Driver;
import javax.persistence.TypedQuery;

//@WebServlet("/MobileServlet") ko can dong nay neu trong web.xml da config roi
public class MobileServlet extends HttpServlet {
    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        // Khởi tạo EntityManagerFactory
        emf = Persistence.createEntityManagerFactory("de04PU");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // Mặc định hiển thị danh sách Mobile
        }
        //doPut, doDelete ko co => phai switch
        switch (action) {
            case "list":
                listMobiles(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteMobile(request, response);
                break;
            default:
                listMobiles(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // Mặc định hiển thị danh sách Mobile
        }

        switch (action) {
            case "create":
                createMobile(request, response);
                break;
            case "update":
                updateMobile(request, response);
                break;
            default:
                listMobiles(request, response);
        }
    }

    private void listMobiles(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        EntityManager em = emf.createEntityManager();
        TypedQuery<Mobile> query = em.createNamedQuery("Mobile.findAll", Mobile.class);
        List<Mobile> mobiles = query.getResultList();

        em.close();
        
        request.setAttribute("mobiles", mobiles);//truyen du lieu tu servlet len jsp(tu controller len view)
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    //hien thi form edit, ko thay doi gi duoi DB
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int mobileId = Integer.parseInt(request.getParameter("mobileId"));

        EntityManager em = emf.createEntityManager();
        Mobile mobile = em.find(Mobile.class, mobileId);
        em.close();
        
        request.setAttribute("mobile", mobile);
        request.getRequestDispatcher("edit-mobile.jsp").forward(request, response);
    }

    private void createMobile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //lay du lieu tren form
        String mobileName = request.getParameter("mobileName");
        String warranty = request.getParameter("warranty");
        Short inOutStock = Short.parseShort(request.getParameter("inOutStock"));
        Float price = Float.parseFloat(request.getParameter("price"));
        String accessories = request.getParameter("accessories");
        String imageSrc = request.getParameter("imageSrc");

        //tao moi object mobile, dua cac gia tri tu form vao object nay
        Mobile mobile = new Mobile();        
        mobile.setMobileName(mobileName);
        mobile.setWarranty(warranty);
        mobile.setInOutStock(inOutStock);
        mobile.setPrice(price);
        mobile.setAccessories(accessories);
        mobile.setImageSrc(imageSrc);

        //luu vao csdl, phai dung transaction
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(mobile);
        em.getTransaction().commit();
        em.close();

        response.sendRedirect(request.getContextPath() + "/MobileServlet?action=list");
    }

    private void updateMobile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int mobileId = Integer.parseInt(request.getParameter("mobileId"));

        EntityManager em = emf.createEntityManager();
        Mobile mobile = em.find(Mobile.class, mobileId);

        String mobileName = request.getParameter("mobileName");
        String warranty = request.getParameter("warranty");
        Short inOutStock = Short.parseShort(request.getParameter("inOutStock"));
        Float price = Float.parseFloat(request.getParameter("price"));
        String accessories = request.getParameter("accessories");
        String imageSrc = request.getParameter("imageSrc");

        mobile.setMobileName(mobileName);
        mobile.setWarranty(warranty);
        mobile.setInOutStock(inOutStock);
        mobile.setPrice(price);
        mobile.setAccessories(accessories);
        mobile.setImageSrc(imageSrc);

        em.getTransaction().begin();
        em.merge(mobile);
        em.getTransaction().commit();
        em.close();

        response.sendRedirect(request.getContextPath() + "/MobileServlet?action=list");
    }

    private void deleteMobile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int mobileId = Integer.parseInt(request.getParameter("mobileId"));

        EntityManager em = emf.createEntityManager();
        Mobile mobile = em.find(Mobile.class, mobileId);

        em.getTransaction().begin();
        em.remove(mobile);
        em.getTransaction().commit();
        em.close();

        response.sendRedirect(request.getContextPath() + "/MobileServlet?action=list");
    }

    @Override
    public void destroy() {
        // Đóng EntityManagerFactory khi ứng dụng kết thúc
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import models.Product;


@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private EntityManagerFactory entityManagerFactory;

    @Override
    public void init() throws ServletException {
        entityManagerFactory = Persistence
                .createEntityManagerFactory("de08PU");
    }

    @Override
    public void destroy() {
        entityManagerFactory.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int xx = 123;
        String categoryId = request.getParameter("category_id");
        if (categoryId != null) {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Category category = entityManager.find(Category.class, categoryId);
            if (category != null) {
                TypedQuery<Product> query = entityManager
                        .createQuery("SELECT p FROM Product p WHERE p.category_id = :category", Product.class);
                query.setParameter("category", category);
                List<Product> products = query.getResultList();

                request.setAttribute("category", category);
                request.setAttribute("products", products);
                request.getRequestDispatcher("productlist.jsp").forward(request, response);
                entityManager.close();
                return;
            }
            entityManager.close();
        }

        // Nếu không tìm thấy category hoặc có lỗi xảy ra, chuyển hướng về trang chủ
        response.sendRedirect(request.getContextPath());
    }
}

/*
 
 */
package beans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

@Stateless
public class StudentBean implements StudentBeanLocal {
    private EntityManager entityManager = Persistence
            .createEntityManagerFactory("De07-ejbPU")
                .createEntityManager();            
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
    
}

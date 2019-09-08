package br.com.ecommercesmd;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import br.com.ecommercesmd.modelo.Categoria;
import javax.persistence.EntityManager;



/**
 *
 *@author iago
 */
public class EcommerceSMDApplication {

    public static void main(String[] args) {
        System.out.println("Hello World App");
        EntityManagerFactory factory
                = Persistence.createEntityManagerFactory("ecommerceSMDPU");
        
//      Teste de inserção
//      Categoria c = new Categoria();
//      c.setDescricao("Tecnologia");
//      System.out.println(c);
//      EntityManager manager = factory.createEntityManager();
//      manager.getTransaction().begin();
//      manager.persist(c);
//      manager.getTransaction().commit();
//            
//      manager.close();
        factory.close();      
    }
}

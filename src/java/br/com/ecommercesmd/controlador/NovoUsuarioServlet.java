/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ecommercesmd.controlador;

import at.favre.lib.crypto.bcrypt.BCrypt;
import br.com.ecommercesmd.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iagog
 */
public class NovoUsuarioServlet extends HttpServlet {
    
    //Conexão com banco de dados
    EntityManagerFactory factory = 
    Persistence.createEntityManagerFactory("ecommerceSMDPU");
    EntityManager manager = factory.createEntityManager();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
       try {
           
           String n = request.getParameter("nome");
           String e = request.getParameter("endereco");
           String em = request.getParameter("email");
           String l = request.getParameter("login");
           String s = request.getParameter("senha");
           String cs = request.getParameter("confirmaSenha");  
           
           //Se as senhas digitadas são iguais...
           if (s.equals(cs)){
               
                //Crie um novo usuário
                Usuario u = new Usuario();
                u.setNome(n);
                u.setEndereco(e);
                u.setLogin(l);
                
                //Encriptar senha
                String encriptSenha = BCrypt.withDefaults().hashToString(12, s.toCharArray());
                System.out.println("encript senha: "+ encriptSenha);
                u.setSenha(encriptSenha);
               
                manager.getTransaction().begin();
                manager.persist(u);
                //Salve
                manager.getTransaction().commit();

                manager.close();
                factory.close();
                
                System.out.println("Novo usuário criado com sucesso!"+ u.toString());
                
                response.sendRedirect("carrinho.html");
                
           } else {
               response.sendRedirect("erro.html");
           }
           
       } catch(IOException e){
           
           System.out.println("Houve exceção " + e);
           response.sendRedirect("erro.html");      
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

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
 * @author iago
 */
public class LoginServlet extends HttpServlet {
    
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
                 
                String e= request.getParameter("emailLogin");
                String s = request.getParameter("senhaLogin");
                //Consulta usuário no banco
                Long l = new Long(5);
                Usuario consulta = manager.find(Usuario.class,l);

                String encriptSenha = BCrypt.withDefaults().hashToString(12, s.toCharArray());


                if (e.equals(consulta.getLogin())){
                    
                    if(encriptSenha.equals(consulta.getSenha())){

                        System.out.println("Usuário autenticou-se");
                        response.sendRedirect("favoritos.html");
                    }
                    
                } else {
                    System.out.println("Não se autenticou");
                    response.sendRedirect("erro.html");
                }
                
            } catch (IOException e){
                
                System.out.println("Ocorreu exception"+ e);
                response.sendRedirect("erro.html");
                
            }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

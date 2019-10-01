/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador;

import br.com.smd.ecommerce.dao.UsuarioDAO;
import br.com.smd.ecommerce.modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Iago Gomes
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

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
        
            UsuarioDAO usuarioDAO = new UsuarioDAO();
                     
            try {
                //Pega os dados do formulário
                String e = request.getParameter("emailLogin");
                String s = request.getParameter("senhaLogin");
                
                // Usuario e senha não podem ser vazios
                if (e.isEmpty() || s.isEmpty()){
                    System.out.println("Campo de usuário e/ou senha vazio(s)");
                    request.setAttribute("msg", "Campo de usuário e/ou senha vazio(s)");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }
                //String encriptSenha = BCrypt.withDefaults().hashToString(12, s.toCharArray());
                
                //Faz uma consulta ao banco
                Usuario consulta;
                consulta = usuarioDAO.verificarSessao(e, s);
                
                if (consulta != null){
                    
                    //Se os dados baterem, a sessão é preparada
                    System.out.println("Senha bateu com a do banco");
                    HttpSession session = request.getSession();
                    request.setAttribute("msg", "Bem vindo, ");
                    session.setAttribute("cliente", consulta );
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
                } else {
                    
                   //Se o resultado vier nulo, os dados não coincidem, 
                   //enviar mensagem de login inválido
                   System.out.println("Não se autenticou \n"+ e +"\n"+s);
                   request.setAttribute("msg", "Usuário ou senha inválidos");
                   request.getRequestDispatcher("login.jsp").forward(request, response);
                    
                }  
            } catch (IOException e){
                
                //Qualquer erro que ocorrer durante o processo, envie o usuário
                //à página de erro.
                System.out.println("Ocorreu exception"+ e);
                response.sendRedirect("erro.jsp");            
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

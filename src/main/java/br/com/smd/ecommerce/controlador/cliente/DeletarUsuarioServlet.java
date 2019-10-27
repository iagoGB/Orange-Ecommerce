/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.cliente;

import br.com.smd.ecommerce.dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
public class DeletarUsuarioServlet extends HttpServlet {

    UsuarioDAO usDAO = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {

            Long id = Long.parseLong(request.getParameter("usuario_id"));
            System.out.println("Usuario id: "+ id);

            boolean deletou = usDAO.deletarPorId(id);

            if (deletou) {
                
                response.sendRedirect("/logout.do");
                
            } else {
                
                request.setAttribute(
                    "feedbackExclusao",
                    "Ocorreu um erro ao tentar excluir sua conta. \n Tente novamente mais tarde.");
                request.getRequestDispatcher("cliente.jsp").forward(request, response);
                
            }
            
        } catch (Exception e) {
            
           //response.sendRedirect("erro.jsp");
           request.setAttribute(
            "feedbackExclusao",
            "Ocorreu um erro ao tentar excluir sua conta \n Tente novamente mais tarde.");
           request.getRequestDispatcher("cliente.jsp").forward(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

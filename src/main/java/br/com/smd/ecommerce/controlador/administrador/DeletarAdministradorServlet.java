/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.administrador;

import br.com.smd.ecommerce.dao.AdministradorDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */

public class DeletarAdministradorServlet extends HttpServlet {

    AdministradorDAO admDAO = new AdministradorDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("adm_id"));
        System.out.println("Entrou aqui e chegou o id: "+ id);
        boolean deletou = admDAO.deletarPorId(id);
        
        if (deletou) {
            response.sendRedirect("/logout.do");
        } else {
            response.sendRedirect("erro.jsp");
        }
        
       
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

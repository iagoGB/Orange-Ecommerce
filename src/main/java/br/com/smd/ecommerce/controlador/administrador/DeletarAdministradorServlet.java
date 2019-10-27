/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.administrador;

import br.com.smd.ecommerce.dao.AdministradorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iago
 */

public class DeletarAdministradorServlet extends HttpServlet {

    AdministradorDAO admDAO = new AdministradorDAO();

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

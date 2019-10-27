/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.administrador;

import br.com.smd.ecommerce.dao.AdministradorDAO;
import br.com.smd.ecommerce.modelo.Administrador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iago
 */
public class AtualizarAdministradorServlet extends HttpServlet {
    
    AdministradorDAO admDAO = new AdministradorDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       // Pega os novos dados preenchidos no formulário
       Long id = Long.parseLong(request.getParameter("adm_id"));
       String attNome = request.getParameter("attNome");
       String attEmail = request.getParameter("attEmail");
       String attLogin = request.getParameter("attLogin");
       String attSenha = request.getParameter("attSenha");
       String attSenhaConfirma = request.getParameter("attSenhaConfirma");
       
       //Instancia um objeto administrador
       Administrador adm = new Administrador(id, attNome, attEmail, attLogin, attSenha);
       
       //Atualiza com o DAO
       Administrador attAdm = admDAO.atualizar(adm);
        
       System.out.println("Novos dados: "+ attAdm.toString());
       
       //Atualiza os dados na sessão
       HttpSession session = request.getSession();
       session.setAttribute("usuario", adm );
       String path = getServletContext().getContextPath();
        System.out.println("caminho do contexto: "+path);
       
       //response.sendRedirect(path+"admin/homeAdmin.jsp");
       request.setAttribute("feedbackAtualizacao", "Dados atualizados com sucesso!");
       request.getRequestDispatcher(path+"/admin/homeAdmin.jsp").forward(request, response);
       
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

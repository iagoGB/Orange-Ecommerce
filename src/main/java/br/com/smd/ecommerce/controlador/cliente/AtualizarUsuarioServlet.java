/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.cliente;

import br.com.smd.ecommerce.dao.UsuarioDAO;
import br.com.smd.ecommerce.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Iago Gomes
 */
public class AtualizarUsuarioServlet extends HttpServlet {

    UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Pega os novos dados preenchidos no formulário
        Long id = Long.parseLong(request.getParameter("usuario_id"));
        String attNome = request.getParameter("attNome");
        String attEmail = request.getParameter("attEmail");
        String attLogin = request.getParameter("attLogin");
        String attSenha = request.getParameter("attSenha");
        String attSenhaConfirma = request.getParameter("attSenhaConfirma");

        try {

            Usuario usuario = new Usuario(id, attNome, attEmail, attEmail, attLogin, attSenha);

            // Provavelmente precisará refatorar o retorno de usuarioDAO.atualizar
            Usuario us = usuarioDAO.atualizar(usuario);

            //Atualiza os dados na sessão
            HttpSession session = request.getSession();
            session.setAttribute("usuario", us);

            //Envia para página que vizualiza, informando a atualização

            request.setAttribute("feedbackAtualizacao", "Dados atualizados com sucesso!");
            request.getRequestDispatcher("cliente.jsp").forward(request, response);
            //response.sendRedirect("cliente.jsp");

        } catch (Exception e) {
            //Envia para página que vizualiza, informando que ocorreu um erro   
            request.setAttribute("feedbackAtualizacaoNegativa", "Ocorreu um erro ao atualizar os dados.\n Tente novamente mais tarde.");
            request.getRequestDispatcher("cliente.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

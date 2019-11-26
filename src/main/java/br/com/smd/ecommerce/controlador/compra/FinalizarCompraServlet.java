/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.compra;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Iago Gomes
 */
public class FinalizarCompraServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session  = req.getSession();
        
        try {
            
            if (session.getAttribute("usuario") == null){
            
                //O usuário não está logado
                req.setAttribute("mensagemFazerLogin", "Efetue o login para realizar compra!");
                //Guarda a página ao qual ele veio
                req.setAttribute("paginaAnterior", req.getParameter("page"));
                //Redireciona para página de login
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            
            } else {
                //O usuário já está logado, redireciona para salvar a compra
                resp.sendRedirect("/salvarCompra.do");
            }
            
        } catch (Exception e) {
            
            System.err.println("Erro: "+ e);
            resp.sendRedirect("erro.jsp");
        }
        
    }

    
   
}
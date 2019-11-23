/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.carrinho;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iago
 */
public class RemoverProdutoCarrinhoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            //Id do produto que deseja remover 
            String produtoid = request.getParameter("produto");
            Cookie[] c;
            c = request.getCookies();

            for (Cookie cookie : c) {
                //Checa em cada cookie
                if (cookie.getName().equals("prod_" + produtoid)) {
                    //Se o nome for encontrado, delete o cookie
                    cookie.setValue("");
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    response.sendRedirect("/listarProdutoCarrinho.do");
                    return;
                }
            }
            
            response.sendRedirect("/listarProdutoCarrinho.do");
            
        } catch (Exception e) {
            
            System.out.println("Ocorreu um erro ao remover produto do carrinho:"+e);
            response.sendRedirect("erro.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

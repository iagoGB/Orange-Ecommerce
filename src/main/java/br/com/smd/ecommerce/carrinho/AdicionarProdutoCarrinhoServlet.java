/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.carrinho;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
public class AdicionarProdutoCarrinhoServlet extends HttpServlet {

    ProdutoDAO produtoDAO = new ProdutoDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idproduto = request.getParameter("p");

            //Se ele ta vindo do carrinho de compras
            if (request.getParameter("qnt") != null) {

                //Atualiza produto quantidade
                String qnt = request.getParameter("qnt");
                Cookie[] c;
                c = request.getCookies();

                for (Cookie cookie : c) {

                    //Checa se o cookie ja existe
                    if (cookie.getName().equals("prod_" + idproduto)) {
                        //Atualiza o cookie
                        Cookie pck = new Cookie("prod_" + idproduto, qnt);
                        response.addCookie(pck);
                        response.sendRedirect("/listarProdutoCarrinho.do");
                        return;

                    }

                }
                Cookie pck = new Cookie("prod_" + idproduto, qnt);
                response.addCookie(pck);
                response.sendRedirect("/listarProdutoCarrinho.do");

            } else {

                //Adiciona produto
                Cookie pck = new Cookie("prod_" + idproduto, "1");

                response.addCookie(pck);

                //response.sendRedirect(request.getHeader("referer"));
                response.sendRedirect("/listarProdutoCarrinho.do");
            }

        } catch (NumberFormatException e) {

            response.sendRedirect("erro.jsp");

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

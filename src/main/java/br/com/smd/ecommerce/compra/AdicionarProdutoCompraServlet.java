/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.compra;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Produto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
public class AdicionarProdutoCompraServlet extends HttpServlet {

    ProdutoDAO produtoDAO = new ProdutoDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idproduto = request.getParameter("p");
            Cookie[] c;
            c = request.getCookies();

            for (Cookie cookie : c) {

                System.out.println("Nome: " + cookie.getName() + " valor: " + cookie.getValue());

            }

            

            //Adiciona produto
            Cookie pck = new Cookie(idproduto, "1");

            response.addCookie(pck);

            //response.sendRedirect(request.getHeader("referer"));
            response.sendRedirect("/listarProdutoCompra.do");

//            Long id = Long.parseLong(request.getParameter("produto"));
//
//            Produto produto;
//            produto = produtoDAO.encontrarProdutoPorId(id);
//
//            List<Produto> listaPossiveisCompras = new ArrayList<>();
//
//            listaPossiveisCompras.add(produto);
//
//            request.setAttribute("listaDesejo", listaPossiveisCompras);
//            request.getRequestDispatcher("carrinho.jsp");

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

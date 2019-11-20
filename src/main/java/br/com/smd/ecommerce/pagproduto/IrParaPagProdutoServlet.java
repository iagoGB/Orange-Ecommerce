/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.pagproduto;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Produto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Caique
 */
public class IrParaPagProdutoServlet extends HttpServlet {
    
    ProdutoDAO pDAO = new ProdutoDAO();
    Produto produto = new Produto();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String id = request.getParameter("p");
            //Procura o produto pelo id    
            produto = pDAO.encontrarProdutoPorId(Long.parseLong(id));
            request.setAttribute("produto", produto);
            request.getRequestDispatcher("/produto.jsp").forward(request, response);
            //response.sendRedirect("/listarProdutoPagProduto.do");
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

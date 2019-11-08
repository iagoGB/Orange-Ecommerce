/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.compra;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iago
 */
public class ListarProdutoCompraServlet extends HttpServlet {

    ProdutoDAO pDAO = new ProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            Cookie[] cookies = req.getCookies();

            List<Produto> produtoList = new ArrayList<>();

            for (Cookie prod : cookies) {
                
                if (!prod.getName().equals("JSESSIONID")){
                    
                    produtoList.add(pDAO.encontrarProdutoPorId(Long.parseLong(prod.getName())));
               
                }
            }
            
            req.setAttribute("produtoCompraLista", produtoList);
            
            req.getRequestDispatcher("carrinho.jsp").forward(req, resp);

        } catch (Exception e) {
            System.out.println("error: "+e);
            resp.sendRedirect("erro.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

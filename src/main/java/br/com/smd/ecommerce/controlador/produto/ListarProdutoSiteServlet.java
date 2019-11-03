/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.produto;

import br.com.smd.ecommerce.dao.CategoriaDAO;
import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Categoria;
import br.com.smd.ecommerce.modelo.Produto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
public class ListarProdutoSiteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        CategoriaDAO cdao = new CategoriaDAO();
        ProdutoDAO pdao = new ProdutoDAO();
        try {
            
            List<Produto> listaProdutos = null;
            List<Categoria> listaCategorias = null;
            Long categoria = Long.parseLong(req.getParameter("categoria"));
            
            listaProdutos = pdao.mostrarProdutosPorCategoria(categoria);
            listaCategorias = cdao.mostrarCategorias();
            
           
           
            if (listaProdutos == null || listaCategorias == null) {
                
                resp.sendRedirect("erro.jsp");
                
            } else {
                
                req.setAttribute("listaProdutos", listaProdutos);
                req.setAttribute("listaCategorias", listaCategorias);
                req.getRequestDispatcher("categoria.jsp").forward(req, resp);
                
            }
            
            
            
        } catch (Exception e) {
            
            System.out.println("Erro aconteceu: "+e.getMessage());
            resp.sendRedirect("erro.jsp");
            
        }
    }

    
}
      

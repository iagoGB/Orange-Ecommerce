/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador;

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
public class HomeServlet extends HttpServlet {
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    ProdutoDAO produtoDAO = new ProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            
            List<Categoria> listaCategorias = null;
            List<Produto> listaProdutos = null;
            listaCategorias = categoriaDAO.mostrarCategorias();
            listaProdutos = produtoDAO.mostrarProdutos();
            request.setAttribute("listaCategoria", listaCategorias);
            request.setAttribute("listaProduto", listaProdutos);
            System.out.println("Entrou");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
           
        }catch (Exception e){
            
            System.out.println("Ocorreu um erro: "+ e);
            response.sendRedirect("erro.jsp");
        }
           
        
    }

    
    

}

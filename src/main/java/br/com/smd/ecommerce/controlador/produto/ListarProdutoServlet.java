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
 * @author Caique Sampaio
 */
public class ListarProdutoServlet extends HttpServlet {
    
    ProdutoDAO produtoDAO = new ProdutoDAO();
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    
    protected void listarProduto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            List<Produto> listaProduto = null;
            listaProduto = produtoDAO.mostrarProdutos();
            List<Categoria> listaCategoria = null;
            listaCategoria = categoriaDAO.mostrarCategorias();
            request.setAttribute("listaProdutos", listaProduto);
            request.setAttribute("listaCategorias", listaCategoria);
          
            request.getRequestDispatcher("admin/gerenciarProdutos.jsp").forward(request, response);
            System.out.println("URI: "+ request.getRequestURI());

        } catch (Exception e) {
            
            System.out.println("Ocorreu um erro ao listar: " + e);
            response.sendRedirect("/erro.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listarProduto(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listarProduto(request, response);
    }
}

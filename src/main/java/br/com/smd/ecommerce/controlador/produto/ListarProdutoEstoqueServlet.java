/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.produto;


import br.com.smd.ecommerce.dao.ProdutoDAO;
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
public class ListarProdutoEstoqueServlet extends HttpServlet {
    
    ProdutoDAO produtoEstoqueDAO = new ProdutoDAO();
    
    protected void listarProdutoEstoque(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {           
            
            
            List<Produto> listaProdutoEstoque = null;
            
            listaProdutoEstoque = produtoEstoqueDAO.mostrarProdutosEstoque0();
            
            
            request.setAttribute("listaProdutosEstoque", listaProdutoEstoque);
            
          
            
            request.getRequestDispatcher("admin/relatorioProdutosEstoque.jsp").forward(request, response);
            
        } catch (IOException | ServletException e) {
            
            request.setAttribute("feedbackNegativoListarProduto", "Não foi possível listar os produtos");
            
            request.getRequestDispatcher("/admin/relatorioProdutosEstoque.jsp").forward(request, response);  
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listarProdutoEstoque(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listarProdutoEstoque(request, response);
    }
}


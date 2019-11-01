/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.produto;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Produto;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
public class DeletarProdutoServlet extends HttpServlet {

    ProdutoDAO produtoDAO = new ProdutoDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Long id = Long.parseLong(request.getParameter("produto_id"));
            String foto = request.getParameter("imagem");
            String desc = request.getParameter("descricao");
            Double preco = Double.parseDouble(request.getParameter("preco"));
            Integer quantidade = Integer.parseInt(request.getParameter("quantidade"));
            Produto produto = new Produto(id, foto, desc, preco, quantidade);
            
            boolean deletou = produtoDAO.removerProduto(produto);
            
            if (deletou) {
                System.out.println("Deletou o produto");
                response.sendRedirect("/listarProduto.do");
                
            } else {
              System.out.println("Deu erro ao deletar 1 "); 
              request.setAttribute("feedbackNegativoRemoverProduto", " A variável deletou nao ficou true");
              request.getRequestDispatcher("/listarProduto.do").forward(request, response);
              
            }

        } catch (Exception e) {
            System.out.println("Deu erro ao deletar 2 "); 
            System.out.println("Ocorreu um erro ao remover produto : " + e);
            request.setAttribute("feedbackNegativoRemoverProduto", "Não foi possível excluir o produto ");
            request.getRequestDispatcher("/listarProduto.do").forward(request, response);
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.produto;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Produto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Caique Sampaio
 */
public class AtualizarProdutoServlet extends HttpServlet {

    ProdutoDAO produtoDAO = new ProdutoDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Long id = Long.parseLong(request.getParameter("produto_id"));
            String foto = request.getParameter("imagem");
            String desc = request.getParameter("novaDescricao");
            Double preco = Double.parseDouble(request.getParameter("preco"));
            Integer quantidade = Integer.parseInt(request.getParameter("quantidade"));
            String[] listaCategorias = request.getParameterValues("listaCategorias");
            
            List<Long> listCId = new ArrayList<>();
            
            for (String lc : listaCategorias) {
               listCId.add(Long.parseLong(lc));
            }

            Produto produto = new Produto(id, foto, desc, preco, quantidade);

            //Deleta todas as categorias atuais
            produtoDAO.removerCategoriasDoProduto(produto.getProduto_id());

            //Inseri as novas categorias
            boolean alterou = produtoDAO.atualizarProduto(produto,listCId);
            
            if (alterou) {
                response.sendRedirect("/listarProduto.do");
            } else {
               request.setAttribute("feedbackNegativoAdicionarProduto", "Não foi possivel atualizar o produto ");
               request.getRequestDispatcher("/listarProduto.do").forward(request, response);
            }

        } catch (NumberFormatException e) {

            request.setAttribute("feedbackNegativoAdicionarProduto", "Não foi possivel atualizar o produto ");
            request.getRequestDispatcher("/listarProduto.do").forward(request, response);
            
        } catch (Exception e){
            request.setAttribute("feedbackNegativoAdicionarProduto", "Não foi possivel atualizar o produto ");
            request.getRequestDispatcher("/listarProduto.do").forward(request, response);
        }

    }
}
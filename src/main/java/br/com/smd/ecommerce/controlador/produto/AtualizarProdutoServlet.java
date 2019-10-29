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
            Produto produto = new Produto(id, foto, desc, preco, quantidade);
            boolean alterou = produtoDAO.atualizarProduto(produto);
            if (alterou) {
                response.sendRedirect("/listarproduto.do");
            } else {
               response.sendRedirect("erro.jsp");
            }

        } catch (IOException | NumberFormatException e) {

            System.out.println("Ocorreu um erro ao atualizar " + e);
            response.sendRedirect("erro.jsp");
        }

    }
}
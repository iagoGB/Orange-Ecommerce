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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Caique Sampaio
 */
@WebServlet("/adicionarProduto.do")
public class AdicionarProdutoServlet extends HttpServlet {

    ProdutoDAO produtoDAO = new ProdutoDAO();

    protected void adicionarproduto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String descProd = request.getParameter("novoProduto");
            String imgProd = request.getParameter("imagem");
            Double precoProd = Double.parseDouble(request.getParameter("preco"));
            Integer quantProd = Integer.parseInt(request.getParameter("quantidade"));
            Produto p = new Produto();
            p.setDescricao(descProd);
            p.setFoto(imgProd);
            p.setPreco(precoProd);
            p.setQuantidade(quantProd);
            produtoDAO.salvarProduto(p);
            response.sendRedirect("/listarProduto.do");

        } catch (Exception e) {
            
            System.out.println("Ocorreu um erro ao inserir nova categoria: " + e);
            response.sendRedirect("./erro.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        adicionarproduto(request, response);
    }

}


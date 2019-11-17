/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.compra;

import br.com.smd.ecommerce.dao.CompraDAO;
import br.com.smd.ecommerce.dao.ProdutoCompraDAO;
import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.dao.UsuarioDAO;
import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.modelo.Usuario;
import br.com.smd.ecommerce.util.CarrinhoCompras;
import br.com.smd.ecommerce.util.ItemCompra;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Iago
 */
public class SalvarCompraServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CompraDAO compraDAO = new CompraDAO();
        ProdutoCompraDAO pcDAO = new ProdutoCompraDAO();
        ProdutoDAO produtoDAO = new ProdutoDAO();

        try {

            HttpSession session = req.getSession();
            Usuario us = (Usuario) session.getAttribute("usuario");
            CarrinhoCompras cc = (CarrinhoCompras) session.getAttribute("carrinhoComprasSession");

            //Relaciona o usuario com a compra
            Compra compra = compraDAO.salvarCompra(us);

            
            for (ItemCompra ic : cc.getItemCarrinhoList()) {
                
                //Para cada item do carrinho, crie um produto-compra
                pcDAO.insereProdutoCompra(ic.getProduto_id(), ic.getQuantidade(), compra.getCompra_id());
                //Atualiza a quantidade do produto no estoque
                produtoDAO.atualizaQuantidade(ic.getProduto_id(), ic.getQuantidade());

            }
            
            System.out.println("Compra finalizada com sucesso!");

        } catch (Exception e) {
            resp.sendRedirect("error.jsp");
        }

    }

}

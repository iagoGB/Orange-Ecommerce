/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.compra;

import br.com.smd.ecommerce.dao.CompraDAO;
import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.dao.UsuarioDAO;
import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.modelo.Usuario;
import br.com.smd.ecommerce.util.CarrinhoCompras;
import br.com.smd.ecommerce.util.ItemCompra;
import java.io.IOException;
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
        ProdutoDAO produtoDAO = new ProdutoDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        
        //FAZER CHECAGEM DO CARRINHO VAZIO
        try {

            HttpSession session = req.getSession();
            Usuario us = (Usuario) session.getAttribute("usuario");
            CarrinhoCompras cc = (CarrinhoCompras) session.getAttribute("carrinhoComprasSession");

            //Relaciona o usuario com a compra
            Compra compra = compraDAO.salvarCompra(us);

            
            for (ItemCompra ic : cc.getItemCarrinhoList()) {
                
                //Para cada item do carrinho, crie um produto-compra
                compraDAO.insereProdutoCompra(ic.getProduto_id(), ic.getQuantidade(), compra.getCompra_id());
                //Atualiza a quantidade do produto no estoque
                produtoDAO.atualizaQuantidade(ic.getProduto_id(), ic.getQuantidade());

            }
            
            //Atualiza usuário na sessão
            Usuario usuarioAtualizado;
            usuarioAtualizado = usuarioDAO.verificarSessao(us.getLogin(), us.getSenha());
            
            session.setAttribute("usuario", usuarioAtualizado);
            //ESVAZIAR CARRINHO AO FINALIZAR COMPRA
            resp.sendRedirect("/detalhesUsuario.do");

        } catch (Exception e) {
            resp.sendRedirect("erro.jsp");
        }

    }

}

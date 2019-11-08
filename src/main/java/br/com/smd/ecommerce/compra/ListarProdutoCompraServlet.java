/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.compra;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Produto;
import br.com.smd.ecommerce.util.CarrinhoCompras;
import br.com.smd.ecommerce.util.ProdutoCompraView;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iago
 */
public class ListarProdutoCompraServlet extends HttpServlet {

    ProdutoDAO pDAO = new ProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            Cookie[] cookies = req.getCookies();

            List<Produto> produtoList = new ArrayList<>();
            List<ProdutoCompraView> produtoCompraViewList = new ArrayList<>();

            //Acha o produto no banco
            
            for (Cookie prod : cookies) {
                
                if (prod.getName().startsWith("prod_")){
                    
                    String [] result = prod.getName().split("_");
                    produtoList.add(pDAO.encontrarProdutoPorId(Long.parseLong(result[1])));
               
                }
            }
            
            //Transforma para a view
            for (Produto p : produtoList) {
                
                ProdutoCompraView pcv = new ProdutoCompraView(p);
                //Seta o preço total por item
                pcv.setPrecoTotal(pcv.getPrecoUnitario()* p.getQuantidade());
                produtoCompraViewList.add(pcv);
            }
            
            //Cria o carrinho de compras
            CarrinhoCompras cc = new  CarrinhoCompras();
            
            double valorTotalCompras = 0;
            int totalItems = 0;
             
            for (ProdutoCompraView pcv : produtoCompraViewList) {
                
                valorTotalCompras += pcv.getPrecoTotal();
                totalItems += pcv.getQuantidade();
                cc.getItemCarrinhoList().add(pcv);
                
            }
           
            //Valor final da compra
            cc.setTotal(valorTotalCompras);
            //Quantidade de produtos na compra
            cc.setTotalItems(totalItems);
            
            req.setAttribute("carrinhoCompras", cc);
            
            req.getRequestDispatcher("carrinho.jsp").forward(req, resp);

        } catch (IOException | NumberFormatException | ServletException e) {
            
            System.out.println("error: "+ e);
            resp.sendRedirect("erro.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

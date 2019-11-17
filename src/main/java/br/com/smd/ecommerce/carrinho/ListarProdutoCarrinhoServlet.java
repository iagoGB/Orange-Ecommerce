/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.carrinho;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Produto;
import br.com.smd.ecommerce.util.CarrinhoCompras;
import br.com.smd.ecommerce.util.ItemCompra;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iago
 */
public class ListarProdutoCarrinhoServlet extends HttpServlet {

    ProdutoDAO pDAO = new ProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            Cookie[] cookies = req.getCookies();

            List<Produto> produtoList = new ArrayList<>();
            List<ItemCompra> produtoCompraViewList = new ArrayList<>();
            List<Integer> qntProdutoList = new  ArrayList<>();

            //Acha o produto no banco
            
            for (Cookie prod : cookies) {
                
                if (prod.getName().startsWith("prod_")){
                    //Pega a quantidade armazenada no cookie
                    int qnt = Integer.parseInt(prod.getValue());
                    
                    //Separa o prod_ do id do produto
                    String [] result = prod.getName().split("_");
                    Produto p =  new Produto();
                    //Procura o produto pelo id    
                    p = pDAO.encontrarProdutoPorId(Long.parseLong(result[1]));
                    
                     
                    //Cria um novo produto para exibir no carrinho
                    ItemCompra pcv = new ItemCompra(p);
                    //Seta a quantidade de produtos escolhido pelo cliente
                    pcv.setQuantidade(qnt);
                    
                    //Seta o preço total por item
                    pcv.setPrecoTotal(pcv.getPrecoUnitario()* pcv.getQuantidade());
                    produtoCompraViewList.add(pcv);
                   
                    
               
                }
            }
            
            
            //Cria o carrinho de compras
            CarrinhoCompras cc = new  CarrinhoCompras();
            
            double valorTotalCompras = 0;
            int totalItems = 0;
             
            for (ItemCompra pcv : produtoCompraViewList) {
                
                valorTotalCompras += pcv.getPrecoTotal();
                totalItems += pcv.getQuantidade();
                cc.getItemCarrinhoList().add(pcv);
                
            }
           
            //Valor final da compra
            cc.setTotal(valorTotalCompras);
            //Quantidade de produtos na compra
            cc.setTotalItems(totalItems);
            
            //Variavel que faz contagem dos itens do carrinho
            HttpSession session = req.getSession();
            session.setAttribute("quantidadeItensCarrinho", cc.getTotalItems().toString());
            req.setAttribute("carrinhoCompras", cc);
            session.setAttribute("carrinhoComprasSession", cc);
            
            req.getRequestDispatcher("carrinho.jsp").forward(req, resp);

        } catch (IOException | NumberFormatException | ServletException e) {
            
            System.out.println("error: "+ e);
            resp.sendRedirect("erro.jsp");
        } catch (Exception e){
            
            System.out.println("aconteceu um erro na servlet de listar produtos carrinho"+e);
                
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

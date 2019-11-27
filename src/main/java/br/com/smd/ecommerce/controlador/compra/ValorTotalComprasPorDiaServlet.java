/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.compra;

import br.com.smd.ecommerce.dao.CompraDAO;
import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.modelo.ProdutoCompra;
import br.com.smd.ecommerce.util.ValorTotalPorDiaTipo;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
public class ValorTotalComprasPorDiaServlet extends HttpServlet {
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CompraDAO cDAO = new CompraDAO();
        
        try {
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            String dataTextoInicio = request.getParameter("inicio");
            String dataTextoFim = request.getParameter("fim");

            Date dataInicio = dateFormat.parse(dataTextoInicio);
            Date dataFim = dateFormat.parse(dataTextoFim);
            
            List<Compra> recuperarTodasAsComprasClientesPorData = cDAO.recuperarTodasAsComprasClientesPorData(dataInicio, dataFim);
            
            Double valorTotalPorDia = 0.0;
            
            for (Compra compra : recuperarTodasAsComprasClientesPorData) {
                
                Double somaDaCompra = 0.0;
                
                for (ProdutoCompra pc : compra.getProdutos()) {
                    //Quantidade na compra X  preço do produto
                    somaDaCompra += pc.getQuantidade() * pc.getProduto().getPreco();
                    
                }
                
                valorTotalPorDia += somaDaCompra;
            }
            
             
            ValorTotalPorDiaTipo valorTotalPorDiaResult = ValorTotalPorDiaTipo.parseValorTotalPorDiaTipo(dataInicio, dataFim, valorTotalPorDia);
            
            
            request.setAttribute("valorPorDia", valorTotalPorDiaResult);
            request.getRequestDispatcher("admin/relatorioTotalValor.jsp").forward(request, response);
            
        } catch (Exception ex) {
            
            System.err.println("Não foi possível listar dado do relatório: "+ ex);
            request.setAttribute("feedbackNegativoListagem", "Não foi possivel consultar os dados. Tente novamente");
            request.getRequestDispatcher("admin/relatorioTotalValor.jsp").forward(request, response);
        }
        
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

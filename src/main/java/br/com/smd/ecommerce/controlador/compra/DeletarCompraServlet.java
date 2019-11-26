/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.compra;

import br.com.smd.ecommerce.dao.CompraDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago
 */
public class DeletarCompraServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        CompraDAO compraDAO = new CompraDAO();
        
        try {
            
            Long compra_id = Long.parseLong(req.getParameter("cid"));
            System.out.println("Compra id: "+compra_id);
            
            boolean deletarCompra = compraDAO.deletarCompra(compra_id);
            System.out.println("Deletou? "+ deletarCompra);
            
            if (deletarCompra){
                
                req.setAttribute("feedbackPositivoExclusaoCompra", "Compra excluida com sucesso!");
                req.getRequestDispatcher("/gerenciarCompras.do").forward(req, resp);
                
            } else {
                req.setAttribute("feedbackNegativoExclusaoCompra", "Não foi possível deletar a compra. Tente novamente mais tarde");
                req.getRequestDispatcher("/gerenciarCompras.do").forward(req, resp);
            }
            
            
        } catch (IOException | NumberFormatException | ServletException ex) {
            System.err.println("Ocorreu um ero ao tentar deletar compra: "+ ex);
            
            req.setAttribute("feedbackNegativoExclusaoCompra", "Ocorreu um erro ao tentar deletar a compra.");
            req.getRequestDispatcher("/gerenciarCompras.do").forward(req, resp);
        }
        
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    
 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

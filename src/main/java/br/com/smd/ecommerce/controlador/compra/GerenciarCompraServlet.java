/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.compra;

import br.com.smd.ecommerce.dao.CompraDAO;
import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.util.GerenciaCompraTipo;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
public class GerenciarCompraServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CompraDAO compraDAO = new CompraDAO();

        try {

            List<Compra> gerenciaCompras = compraDAO.recuperarTodasAsCompras();

            List<GerenciaCompraTipo> gerenciaCompraTipoList = GerenciaCompraTipo.parseGerenciaCompraTipo(gerenciaCompras);

            req.setAttribute("gerenciaCompraTipoList", gerenciaCompraTipoList);
            System.out.println("Carregou os produtos dos clientes!");
            req.getRequestDispatcher("/admin/gerenciarCompras.jsp").forward(req, resp);
  
        } catch (Exception e) {

            System.err.println("Ocorreu um erro ao recuperar compras: " + e);
            req.setAttribute("feedbackNegativoListagem", "Não foi possível listar as compras. Tente novamente.");
            req.getRequestDispatcher("/admin/gerenciarCompras.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.categoria;

import br.com.smd.ecommerce.dao.CategoriaDAO;
import br.com.smd.ecommerce.modelo.Categoria;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Caique
 */
public class ListarCategoriaServlet extends HttpServlet {

    CategoriaDAO categoriaDAO = new CategoriaDAO();

    protected void listarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            List<Categoria> listaCategorias = null;
            listaCategorias = categoriaDAO.mostrarCategorias();
            request.setAttribute("listaCategorias", listaCategorias);
            request.getRequestDispatcher("admin/gerenciarCategorias.jsp").forward(request, response);
            request.getRequestDispatcher("admin/gerenciarProdutos.jsp").forward(request, response);
            System.out.println("URI: "+ request.getRequestURI());

        } catch (Exception e) {
            
            System.out.println("Ocorreu um erro ao listar: " + e);
            response.sendRedirect("/erro.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listarCategoria(request, response);
    }

}

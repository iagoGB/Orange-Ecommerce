/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.Categoria;

import br.com.smd.ecommerce.dao.CategoriaDAO;
import br.com.smd.ecommerce.modelo.Categoria;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.objects.NativeArray;

/**
 *
 * @author Caique
 */
@WebServlet("/listarCategoria")
public class ListarCategoriaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    CategoriaDAO categoriaDAO = new CategoriaDAO();

    protected void listarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Categoria> listaCategorias = null;
        listaCategorias = categoriaDAO.mostrarCategorias();
        request.setAttribute("listaCategorias", listaCategorias);
        System.out.println("Veio até aqui 2");
        request.getRequestDispatcher("admin/gerenciarCategorias.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        listarCategoria(request, response);
    }

}

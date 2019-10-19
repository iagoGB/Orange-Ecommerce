/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador;

import br.com.smd.ecommerce.dao.CategoriaDAO;
import br.com.smd.ecommerce.modelo.Categoria;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Caique
 */
@WebServlet("/categoria")
public class CategoriasServlet extends HttpServlet {

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
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/inserircategoria":
                inserirCategoria(request, response);
                break;
            case "/deletarcategoria":
                deletarCategoria(request, response);
                break;
            
            case "/atualizarcategoria":
                atualizarCategoria(request, response);
                break;
            default:
                listarCategoria(request, response);
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void inserirCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String d = request.getParameter("descricao");
        Categoria c = new Categoria();
        c.setDescricao(d);
        categoriaDAO.salvarCategoria(c);
        request.getRequestDispatcher("admin.jsp").forward(request, response);

    }
    /*
    protected void deletarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String d = request.getParameter("descricao");
        
        categoriaDAO.removerCategoria(categoria);
        request.getRequestDispatcher("admin.jsp").forward(request, response);

    }
    protected void atualizarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String d = request.getParameter("descricao");
        Categoria c = new Categoria();
        c.setDescricao(d);
        categoriaDAO.salvarCategoria(c);
        request.getRequestDispatcher("admin.jsp").forward(request, response);

    }*/
    protected void listarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List <Categoria> listacategorias = null;
        listacategorias = categoriaDAO.mostrarCategorias();
        request.setAttribute("listacategorias", listacategorias);
        request.getRequestDispatcher("admin.jsp").forward(request, response);

    }
}

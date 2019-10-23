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

/**
 *
 * @author Caique
 */
@WebServlet("/inserircategoria")
public class InserirCategoriasServlet extends HttpServlet {

   
    CategoriaDAO categoriaDAO = new CategoriaDAO();
    
    protected void inserircategoria(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String d = request.getParameter("descricao");
        Categoria c = new Categoria();
        c.setDescricao(d);
        categoriaDAO.salvarCategoria(c);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        inserircategoria(request, response);
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
   
}

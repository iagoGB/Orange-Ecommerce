/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.categoria;

import br.com.smd.ecommerce.dao.CategoriaDAO;
import br.com.smd.ecommerce.modelo.Categoria;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Caique
 */
@WebServlet("/inserirCategoria.do")
public class InserirCategoriaServlet extends HttpServlet {

    CategoriaDAO categoriaDAO = new CategoriaDAO();

    protected void inserircategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String d = request.getParameter("novaCategoria");
            Categoria c = new Categoria();
            c.setDescricao(d);
            categoriaDAO.salvarCategoria(c);
            response.sendRedirect("/listarCategoria.do");
            //request.getRequestDispatcher("admin.jsp").forward(request, response);

        } catch (Exception e) {
            
            System.out.println("Ocorreu um erro ao inserir nova categoria: " + e);
            response.sendRedirect("./erro.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        inserircategoria(request, response);
    }

}

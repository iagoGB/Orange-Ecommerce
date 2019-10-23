/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aluno
 */
@WebServlet("/admin")
public class DispacheServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = request.getParameter("page");
        
        
        request.getRequestDispatcher("pagina-admin/gerenciarCadastros.jsp").forward(request, response);
        
        switch(pagina){
            case "gerenciarCadastros":
                request.getRequestDispatcher("pagina-admin/gerenciarCadastros.jsp").forward(request, response);
            break;
            case "gerenciarCompras":
                request.getRequestDispatcher("pagina-admin/gerenciarCompras.jsp").forward(request, response);
            break;
            case "gerenciarProdutos":
                request.getRequestDispatcher("pagina-admin/gerenciarProdutos.jsp").forward(request, response);
            break;
            case "gerenciarCategorias":
                request.getRequestDispatcher("pagina-admin/gerenciarCategorias.jsp").forward(request, response);
            break;
            
            default:
                request.getRequestDispatcher("pagina-admin/meusDados.jsp").forward(request, response);
            break;          
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        service(req, resp);
    }

}


    


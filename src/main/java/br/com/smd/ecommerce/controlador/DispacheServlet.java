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
        
        
        //request.getRequestDispatcher("admin/gerenciarCadastros.jsp").forward(request, response);
        
        switch(pagina){
            case "gerenciarCadastros":
                response.sendRedirect("admin/gerenciarCadastros.jsp");
                //request.getRequestDispatcher("admin/gerenciarCadastros.jsp").forward(request, response);
            break;
            case "gerenciarCompras":
                response.sendRedirect("admin/gerenciarCompras.jsp");
                //request.getRequestDispatcher("admin/gerenciarCompras.jsp").forward(request, response);
            break;
            case "gerenciarProdutos":
                response.sendRedirect("admin/gerenciarProdutos.jsp");
                //request.getRequestDispatcher("admin/gerenciarProdutos.jsp").forward(request, response);
            break;
            case "gerenciarCategorias":
                response.sendRedirect("admin/gerenciarCategorias.jsp");
                request.getRequestDispatcher("/listarCategoria");
            break;
            case "relatorioProdutosEstoque":
                response.sendRedirect("admin/relatorioProdutosEstoque.jsp");
                //request.getRequestDispatcher("admin/gerenciarProdutos.jsp").forward(request, response);
            break;
            case "relatorioTotalCompras":
                response.sendRedirect("admin/relatorioTotalCompras.jsp");
                //request.getRequestDispatcher("admin/gerenciarProdutos.jsp").forward(request, response);
            break;
            case "relatorioTotalValor":
                response.sendRedirect("admin/relatorioTotalValor.jsp");
                //request.getRequestDispatcher("admin/gerenciarProdutos.jsp").forward(request, response);
            break;
            
            default:
                request.getRequestDispatcher("admin/homeAdmin.jsp").forward(request, response);
            break;          
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        service(req, resp);
    }

}


    


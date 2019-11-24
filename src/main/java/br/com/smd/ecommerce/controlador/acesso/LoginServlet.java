/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.acesso;

import br.com.smd.ecommerce.dao.UsuarioDAO;
import br.com.smd.ecommerce.dao.AdministradorDAO;
import br.com.smd.ecommerce.dao.CompraDAO;
import br.com.smd.ecommerce.modelo.Administrador;
import br.com.smd.ecommerce.modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Iago Gomes
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        CompraDAO compraDAO = new CompraDAO();
        AdministradorDAO administradorDAO = new AdministradorDAO();

        try {

            //Pega os dados do formulário
            String login = request.getParameter("emailLogin");
            String senha = request.getParameter("senhaLogin");

            // Usuario e senha não podem ser vazios
            if (login.isEmpty() || senha.isEmpty()) {
                System.out.println("Campo de usuário e/ou senha vazio(s)");
                request.setAttribute("msg", "Campo de usuário e/ou senha vazio(s)");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            //String encriptSenha = BCrypt.withDefaults().hashToString(12, s.toCharArray());

            //Faz uma consulta ao banco
            Usuario consultaCliente;
            Administrador consultaAdm;
            
            //Aqui já são carregados os relacionamentos do cliente - Compra x Produtos Da Compra
            consultaCliente = usuarioDAO.verificarSessao(login, senha);
            consultaAdm = administradorDAO.verificarSessao(login, senha);

            if (consultaAdm != null) {
                //Se os dados baterem, a sessão é preparada para Administrador
                System.out.println("Senha bateu com a do banco - ADMIN");
                HttpSession session = request.getSession();
                session.setAttribute("administrador", consultaAdm);
                System.out.println("Redirecionou para homeAdmin");
                response.sendRedirect("admin/homeAdmin.jsp");
                //request.getRequestDispatcher("pagina-admin/homeAdmin.jsp").forward(request, response);
                return;
            }

            if (consultaCliente != null) {

                //Se os dados baterem, a sessão é preparada para Cliente
                System.out.println("Senha bateu com a do banco - CLIENTE ");
                HttpSession session = request.getSession();
                request.setAttribute("msg", "Bem vindo, ");

                session.setAttribute("usuario", consultaCliente);

                //Se o usuario veio da página de finalizar compra
                if (request.getParameter("paginaAnterior").equals("c")) {
                    //Mande ele para o passo 2
                    response.sendRedirect("/finalizarCompraP2.do");
                    return;
                } else {
                    //Mande-o para home
                    response.sendRedirect("/home.do");
                    return;
                }

            } else {

                //Se o resultado vier nulo, os dados não coincidem, 
                //enviar mensagem de login inválido
                System.out.println("Não se autenticou \n" + login + "\n" + senha);
                request.setAttribute("msg", "Usuário ou senha inválidos");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            }

        } catch (IOException e) {

            //Qualquer erro que ocorrer durante o processo, envie o usuário
            //à página de erro.
            System.out.println("Ocorreu exception" + e);
            response.sendRedirect("erro.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

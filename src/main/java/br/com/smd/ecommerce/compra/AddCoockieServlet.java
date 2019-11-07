/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.compra;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author iago.barreto
 */
@WebServlet(name = "AddCoockieServlet", urlPatterns = {"/addCookie.do"})
public class AddCoockieServlet extends HttpServlet {

   protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
       
       String idproduto = request.getParameter("p");
       Cookie[] c;
       c = request.getCookies();
       Integer qntProduto = 0;
       
       for (Cookie cookie : c) {
           
           qntProduto += 1;
           System.out.println("Nome: "+ cookie.getName()+" valor: "+cookie.getValue());
           
       }
       
       String qntProdutoCookie = qntProduto.toString();
       
       //Adiciona produto
       Cookie pck = new Cookie("pck", idproduto);
       //Quantidade de coockies
       Cookie ck = new Cookie("qntProduto", qntProdutoCookie);
       
      
       response.addCookie(ck);
       response.addCookie(pck);
       
      
       response.sendRedirect(request.getHeader("referer"));
   
       
   }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

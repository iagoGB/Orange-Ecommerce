/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.produto;

import static br.com.smd.ecommerce.util.Constantes.REPOSITORIO_IMAGEM_PRODUTO;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iago Gomes
 */
public class ExibirFotoProdutoServlet extends HttpServlet {
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
   protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String foto = request.getParameter("foto");
        
        ServletContext servletContext = getServletContext();
        
        String imageFileName;
        imageFileName = REPOSITORIO_IMAGEM_PRODUTO + File.separator + foto;

        String mimeType = servletContext.getMimeType(imageFileName);
        
        if (mimeType == null) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        response.setContentType(mimeType);

        File file = new File(imageFileName);
        response.setContentLength((int) file.length());

        FileInputStream in = new FileInputStream(file);
        OutputStream out = response.getOutputStream();

        byte[] buf = new byte[1024];
        int count = 0;
        while ((count = in.read(buf)) >= 0) {
            out.write(buf, 0, count);
        }
        in.close();
        out.close();
   }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

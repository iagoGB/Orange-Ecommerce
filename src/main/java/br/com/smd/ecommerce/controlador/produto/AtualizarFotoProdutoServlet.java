/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.produto;

import static br.com.smd.ecommerce.util.Constantes.REPOSITORIO_IMAGEM_PRODUTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author iago
 */
public class AtualizarFotoProdutoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        FileItem arquivoFoto = null;
        Long produtoId = null;
        boolean sucessoUpload = false;

        if (isMultipart) {
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setRepository(new File(REPOSITORIO_IMAGEM_PRODUTO + File.separator + "temp"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items;
                items = upload.parseRequest(new ServletRequestContext(request));
                Iterator<FileItem> iter = items.iterator();

                while (iter.hasNext()) {

                    FileItem item = iter.next();

                    if (item.isFormField() && item.getFieldName().equals("produto_id")) {
                        produtoId = Long.parseLong(item.getString());
                        System.out.println("foto id: " + produtoId);
                    }
                    if (!item.isFormField() && item.getFieldName().equals("imagem") && item.getContentType().startsWith("image/")) {
                        arquivoFoto = item;

                    }
                }
                //Deleta foto antiga antiga
                File toDelete = new File(REPOSITORIO_IMAGEM_PRODUTO + File.separator + produtoId + arquivoFoto.getName().substring(arquivoFoto.getName().lastIndexOf(".")));
               
                boolean delete = toDelete.delete();
               //Se deletou
                if (delete) {
                     //Tenta salvar a nova foto no diretório
                    arquivoFoto.write(new File(REPOSITORIO_IMAGEM_PRODUTO + File.separator + produtoId + arquivoFoto.getName().substring(arquivoFoto.getName().lastIndexOf("."))));
                    String caminhoFoto = produtoId + arquivoFoto.getName().substring(arquivoFoto.getName().lastIndexOf("."));
                    sucessoUpload = true;
                }

                if (sucessoUpload) {

                        request.getRequestDispatcher("/listarProduto.do").forward(request, response);

                } else {

                    request.setAttribute("feedbackNegativoAdicionarProduto", "Não foi possivel fazer o upload da imagem ");
                    request.getRequestDispatcher("/listarProduto.do").forward(request, response);

                }

            } catch (FileUploadException ex) {
                Logger.getLogger(AtualizarFotoProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("feedbackNegativoAdicionarProduto", "Não foi possivel fazer o upload da imagem ");
                request.getRequestDispatcher("/listarProduto.do").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(AtualizarFotoProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("feedbackNegativoAdicionarProduto", "Não foi possivel fazer o upload da imagem ");
                request.getRequestDispatcher("/listarProduto.do").forward(request, response);
            }

        }
    }
}

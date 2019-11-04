/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.produto;

import br.com.smd.ecommerce.dao.CategoriaDAO;
import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Categoria;
import br.com.smd.ecommerce.modelo.Produto;
import br.com.smd.ecommerce.modelo.ProdutoCategoria;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.apache.commons.io.FileUtils;
import static br.com.smd.ecommerce.util.Constantes.*;
import java.util.ArrayList;
import java.util.Iterator;
import net.bytebuddy.matcher.FilterableList;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author Caique Sampaio
 */
@WebServlet("/adicionarProduto.do")
public class AdicionarProdutoServlet extends HttpServlet {

    ProdutoDAO produtoDAO = new ProdutoDAO();
    CategoriaDAO categoriaDAO = new CategoriaDAO();

    protected void adicionarproduto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String descricao = null;
            String foto = "";
            Integer quantidade = null;
            Double preco = null;
            Long categoria_id = null;
            FileItem arquivoFoto = null;
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            boolean sucessoUpload = false;
            List<Long> cList;
            cList = new ArrayList<Long>();

            if (isMultipart) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setRepository(new File(REPOSITORIO_IMAGEM_PRODUTO + File.separator + "temp"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
                Iterator<FileItem> iter = items.iterator();

                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    /* caso o parâmetro seja do tipo texto e com a chave id */
                    if (item.isFormField() && item.getFieldName().equals("novoProduto")) {
                        descricao = item.getString();
                        System.out.println("Novo Produto: " + descricao);
                    }
                    if (item.isFormField() && item.getFieldName().equals("preco")) {
                        preco = Double.parseDouble(item.getString());
                        System.out.println("Preço do produto: " + preco);
                    }
                    if (item.isFormField() && item.getFieldName().equals("quantidade")) {
                        quantidade = Integer.parseInt(item.getString());
                        System.out.println("Quantidade em estoque: " + quantidade);
                    }
                    if (item.isFormField() && item.getFieldName().equals("categoria")) {

                        Long cid = Long.parseLong(item.getString());
                       
                        
                        cList.add(cid);
                        
                        //System.out.println("id da categoria: " + categoria_id);
                    }

                    /* caso o parâmetro seja do tipo binário e com chave foto */
                    if (!item.isFormField() && item.getFieldName().equals("imagem") && item.getContentType().startsWith("image/")) {
                        arquivoFoto = item;
                        
                    }
                }

                Produto p = new Produto();
                p.setDescricao(descricao);
                p.setPreco(preco);
                p.setQuantidade(quantidade);
                p.setFoto(foto);

                p = produtoDAO.salvarProduto(p, cList);

                //Tenta salvar a foto do diretório
                arquivoFoto.write(new File(REPOSITORIO_IMAGEM_PRODUTO + File.separator + p.getProduto_id() + arquivoFoto.getName().substring(arquivoFoto.getName().lastIndexOf("."))));
                String caminhoFoto = p.getProduto_id() + arquivoFoto.getName().substring(arquivoFoto.getName().lastIndexOf("."));
                System.out.println("CaminhoFoto: "+ caminhoFoto);
                p = produtoDAO.salvarFoto(p.getProduto_id(), caminhoFoto);
                
                //Um erro acontece no ToString pois ele chama uma array que ainda não foi feito o fetch ProdutoEmCompras
                //System.out.println("Estado do produto após salvar tudo: " + p.toString());
                sucessoUpload = true;
            }

            if (sucessoUpload) {
                
                //"Terminou a execução da servlet com sucesso!"
                request.getRequestDispatcher("/listarProduto.do").forward(request, response);
                
            } else {
                
                request.setAttribute("feedbackNegativoAdicionarProduto", "Não foi possivel fazer o upload da imagem ");
                request.getRequestDispatcher("/listarProduto.do").forward(request, response);
            
            }

        } catch (Exception e) {

            System.out.println("Ocorreu um erro ao adicionar produto : " + e);
            request.setAttribute("feedbackNegativoAdicionarProduto", "Não foi possível cadastrar o novo produto ");
            request.getRequestDispatcher("/listarProduto.do").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        adicionarproduto(request, response);
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.controlador.relatorio;

import br.com.smd.ecommerce.dao.ProdutoDAO;
import br.com.smd.ecommerce.modelo.Produto;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 *
 * @author Iago
 */
public class RelatorioXLSServlet extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheetProdutos = workbook.createSheet("Produtos");

        ProdutoDAO produtoDAO = new ProdutoDAO();
        List<Produto> produtos = produtoDAO.mostrarProdutosEstoque0();

        int numeroLinha = 0;

        for (int i = 0; produtos != null && i < produtos.size(); i++) {
            Row linha = null;
            if (i == 0) {
                linha = sheetProdutos.createRow(numeroLinha++);

                Cell cellId = linha.createCell(0);
                cellId.setCellValue("Id");

                Cell cellDescricao = linha.createCell(1);
                cellDescricao.setCellValue("Descrição");

                Cell cellPreco = linha.createCell(2);
                cellPreco.setCellValue("Preço");
            }

            Produto p = produtos.get(i);

            linha = sheetProdutos.createRow(numeroLinha++);

            Cell cellId = linha.createCell(0);
            cellId.setCellValue(p.getProduto_id());

            Cell cellDescricao = linha.createCell(1);
            cellDescricao.setCellValue(p.getDescricao());

            Cell cellPreco = linha.createCell(2);
            cellPreco.setCellValue(p.getPreco());
        }

        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        workbook.write(byteArrayOutputStream);
        byte[] byteOutputArray = byteArrayOutputStream.toByteArray();

        response.setContentType("application/ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=produtos.xls");
        response.setContentLength(byteOutputArray.length);

        try (OutputStream outputStream = response.getOutputStream()) {
            outputStream.write(byteOutputArray);
            outputStream.flush();
        }
    }

}



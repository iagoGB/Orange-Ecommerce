//
//package br.com.smd.ecommerce.controlador.compra;
//
//
//import br.com.smd.ecommerce.dao.CompraDAO;
//import br.com.smd.ecommerce.modelo.Compra;
//import java.io.IOException;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// *
// * @author Caique Sampaio
// */
//public class ListarTotalComprasServlet extends HttpServlet {
//    
//    CompraDAO compraDAO = new CompraDAO();
//    
//    protected void listarTotalCompras(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        try {           
//            
//            
//            List<Compra> listaCompras = null;
//            
//            listaCompras = compraDAO.mostrarTotalCompras();
//            
//            
//            request.setAttribute("listaCompras", listaCompras);
//            
//          
//            
//            request.getRequestDispatcher("admin/relatorioTotalCompras.jsp").forward(request, response);
//            
//        } catch (IOException | ServletException e) {
//            
//            request.setAttribute("feedbackNegativoListarProduto", "Não foi possível listar os produtos");
//            
//            request.getRequestDispatcher("/admin/relatorioTotalCompras.jsp").forward(request, response);  
//        }
//
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        listarTotalCompras(request, response);
//    }
//    
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        listarTotalCompras(request, response);
//    }
//}
//

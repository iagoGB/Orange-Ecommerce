package br.com.smd.ecommerce.controlador.compra;

import br.com.smd.ecommerce.dao.CompraDAO;
import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.modelo.Usuario;
import br.com.smd.ecommerce.util.TotalComprasClientes;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarTotalComprasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CompraDAO compraDAO = new CompraDAO();

        try {
            //Date datainicio = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(req.getParameter("data_inicio"));
            //Date datafinal = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").parse(req.getParameter("data_final"));
            
            List<Compra> comprasClientes = compraDAO.recuperarTodasAsComprasClientes();
            List<TotalComprasClientes> totalComprasClientesList = TotalComprasClientes.parseTotalComprasClientes(comprasClientes);
            req.setAttribute("totalComprasClientesList", totalComprasClientesList);
            System.out.println("Carregou os produtos dos clientes!");
            req.getRequestDispatcher("/admin/relatorioTotalCompras.jsp").forward(req, resp);
            
            /*if (datainicio == null || datafinal == null) {
                List<Compra> gerenciaCompras = compraDAO.recuperarTodasAsCompras();
                List<GerenciaCompraTipo> gerenciaCompraTipoList = GerenciaCompraTipo.parseGerenciaCompraTipo(gerenciaCompras);
                req.setAttribute("gerenciaCompraTipoList", gerenciaCompraTipoList);
                System.out.println("Carregou os produtos dos clientes!");
                req.getRequestDispatcher("/admin/gerenciarCompras.jsp").forward(req, resp);

                List<TotalComprasClientes> gerenciaCompras = compraDAO.recuperarTodasAsComprasClientes();
                List<TotalComprasClientes> TotalComprasClientesList = TotalComprasClientes.parseTotalComprasClientes(gerenciaCompras);
                req.setAttribute("TotalComprasClientesList", TotalComprasClientesList);
                System.out.println("Carregou os produtos dos clientes!");
                req.getRequestDispatcher("/admin/relatorioTotalCompras.jsp").forward(req, resp);
            } else {
                List<TotalComprasClientes> TotalComprasClientesList = compraDAO.recuperarTodasAsComprasClientes();
                req.setAttribute("TotalComprasClientesList", TotalComprasClientesList);
                System.out.println("Carregou os produtos dos clientes!");
                req.getRequestDispatcher("/admin/relatorioTotalCompras.jsp").forward(req, resp);
            }*/

        } catch (Exception e) {

            System.err.println("Ocorreu um erro ao recuperar compras: " + e);
            req.setAttribute("feedbackNegativoListagem", "Não foi possível listar as compras. Tente novamente.");
            req.getRequestDispatcher("/admin/relatorioTotalCompras.jsp").forward(req, resp);

        }
    }
}

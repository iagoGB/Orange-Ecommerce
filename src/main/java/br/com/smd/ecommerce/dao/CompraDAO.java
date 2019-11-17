/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.modelo.ProdutoCompra;
import br.com.smd.ecommerce.modelo.Usuario;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author Iago Gomes
 */
public class CompraDAO {
    
    public Compra salvarCompra(Usuario us) {
        
        EntityManager manager = new FabricaDeConexao().getConexao();
        Compra cp = new Compra();
        
        try {
           manager.getTransaction().begin();
            us = (Usuario)manager.find(Usuario.class, us.getUsuario_id());
            cp.setUsuario(us);
            cp.setData_compra( new Date());
            manager.persist(cp);
            
            us.getCompras().add(cp);
            manager.merge(us);
            
           manager.getTransaction().commit();
           
        } catch (Exception e) {
            
            cp = null;
            manager.getTransaction().rollback();
            
        } finally{
    
            manager.close();
        }
        return cp;
    }
    
    public List<ProdutoCompra> buscarProdutosDaCompra(Long compra_id){
        EntityManager manager = new FabricaDeConexao().getConexao();
        //Usar produto compra
        List<ProdutoCompra> resultado = null;
        try {
          manager.getTransaction().begin();
          
            Compra c = (Compra)manager.find(Compra.class, compra_id);
            c.getProdutos().size();
            c.setProdutos(c.getProdutos());
            
          manager.getTransaction().commit();
          resultado = c.getProdutos();
        } catch (Exception e) {
            manager.getTransaction().rollback();
        } finally{
            manager.close();
        }
        return resultado;
    }
    
}

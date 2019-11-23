/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.modelo.Produto;
import br.com.smd.ecommerce.modelo.ProdutoCompra;
import br.com.smd.ecommerce.modelo.Usuario;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.hibernate.annotations.common.util.impl.Log_$logger;

/**
 *
 * @author Iago Gomes
 */
public class CompraDAO {
    
    public List<Compra> recuperarTodasAsCompras() {

        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Compra> result = null;
        try {

            manager.getTransaction().begin();

            TypedQuery<Compra> query = manager.createQuery(
                    "Select c from TB_COMPRA as c "
                    + "join fetch c.produtos"
                    , Compra.class
            );

            result = query.getResultList();

            manager.getTransaction().commit();

        } catch (Exception e) {

            System.err.println(" Erro ao consultar compras: " + e);
            manager.getTransaction().rollback();

        } finally {

            manager.close();

        }

        return result;
    }
    
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
    
     public void insereProdutoCompra(Long produto_id, Integer quantidadeDaCompra, Long compra_id) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        
        try {
            manager.getTransaction().begin();
                
                Compra compra = (Compra)manager.find(Compra.class, compra_id);
                Produto produto = (Produto)manager.find(Produto.class, produto_id);
                
                ProdutoCompra produtoCompra = new ProdutoCompra();
                produtoCompra.setProduto(produto);
                produtoCompra.setCompra(compra);
                produtoCompra.setQuantidade(quantidadeDaCompra);
                manager.persist(produtoCompra);
            
            manager.getTransaction().commit();
            
        } catch (Exception e) {
            manager.getTransaction().rollback();
        } finally{
            manager.close();
        }
    }
    
    
    
    public Compra buscarProdutosDaCompra(Long compra_id){
        EntityManager manager = new FabricaDeConexao().getConexao();
        //Usar produto compra
       // List<ProdutoCompra> resultado = null;
       Compra compra = null;
        try {
          manager.getTransaction().begin();
          
//            Compra c = (Compra)manager.find(Compra.class, compra_id);
//            c.getProdutos().size();
//            c.setProdutos(c.getProdutos());

            TypedQuery<Compra> query = manager.createQuery(
                "Select c from TB_COMPRA as c "
                + "join fetch c.produtos pc "
                + "where pc.compra.compra_id = :pId", Compra.class )
                .setParameter("pId", compra_id);
        
        compra = query.getSingleResult();
            
          manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
        } finally{
            manager.close();
        }
        return compra;
    }
    
}

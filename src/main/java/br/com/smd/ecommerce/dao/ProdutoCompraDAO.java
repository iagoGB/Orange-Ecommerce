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
import javax.persistence.EntityManager;

/**
 *
 * @author Iago Gomes
 */
public class ProdutoCompraDAO {

    public void insereProdutoCompra(Long produto_id, Integer quantidadeDaCompra, Long compra_id) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        
        try {
            manager.getTransaction().begin();
                
                Compra compra = (Compra)manager.find(Compra.class, compra_id);
                Produto produto = (Produto)manager.find(Produto.class, produto_id);
                
                ProdutoCompra produtoCompra = new ProdutoCompra(produto,compra,quantidadeDaCompra); 
                
                manager.persist(produtoCompra);
            
            manager.getTransaction().commit();
            
        } catch (Exception e) {
            manager.getTransaction().rollback();
        } finally{
            manager.close();
        }
    }
    
}

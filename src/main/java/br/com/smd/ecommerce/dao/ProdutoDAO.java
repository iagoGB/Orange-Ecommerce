/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import javax.persistence.EntityManager;
import br.com.smd.ecommerce.modelo.Categoria;
import br.com.smd.ecommerce.modelo.Produto;
import java.util.List;

/**
 *
 * @author Caique
 */
public class ProdutoDAO {

    public void salvarProduto(Produto p) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        try {
            manager.getTransaction().begin();
            manager.persist(p);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
    }

     public List<Produto> mostrarProdutos() {
        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Produto> listaProduto = null;
        try {
            
            listaProduto = (List<Produto>)manager.createQuery("FROM TB_PRODUTO p order by p.produto_id asc").getResultList();
            
        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao carregar listas: "+ e);
        }
        return listaProduto;
    }

    public boolean atualizarProduto(Produto p) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean alterou = false;
        try {
            System.out.println(p.getProduto_id());
            manager.getTransaction().begin();
            if (p.getProduto_id() != null) {
                
                manager.merge(p);
            }
            manager.getTransaction().commit();
            alterou = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        return alterou;
    }

    public boolean removerProduto(Produto p) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean deletou = false;
        try {
            Produto toDel = manager.find(Produto.class, p.getProduto_id());
            manager.getTransaction().begin();
            manager.remove(toDel);
            manager.getTransaction().commit();
            deletou = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        return deletou;
    }

}

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
import br.com.smd.ecommerce.modelo.ProdutoCategoria;
import br.com.smd.ecommerce.modelo.ProdutoCategoriaId;
import java.util.List;

/**
 *
 * @author Caique
 */
public class ProdutoDAO {

    public Produto salvarProduto(Produto p, Long categoriaId) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        try {
            
            manager.getTransaction().begin();
            
            Categoria categoria = (Categoria)manager.find(Categoria.class, categoriaId);
           
            ProdutoCategoria pc= new ProdutoCategoria();
            
            pc.setProduto(p);
            pc.setCategoria(categoria);
            p.getListaCategorias().add(pc);
            categoria.getListaProdutos().add(pc);
            
            //PC possui o CASCADE MERGE
            manager.persist(pc);
            
            
            
           
            
            manager.getTransaction().commit();
            
        } catch (Exception ex) {
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        
        return p;
    }

     public List<Produto> mostrarProdutos() {
        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Produto> listaProduto = null;
        try {
            
            listaProduto = (List<Produto>)manager.createQuery("FROM TB_PRODUTO p order by p.produto_id asc").getResultList();
            
        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao carregar listas: "+ e);
        } finally {
            manager.close();
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
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        return deletou;
    }

    public Produto salvarFoto(Long produto_id, String caminhoFoto) {
         EntityManager manager = new FabricaDeConexao().getConexao();
        Produto p = null;
        try {
            manager.getTransaction().begin();
            p = manager.find(Produto.class, produto_id);
            p.setFoto(caminhoFoto);
            manager.merge(p);
            
        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao atualizar a foto: "+e);
        }finally{
            manager.close();
        }
        return p;
    }

}

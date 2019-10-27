/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import javax.persistence.EntityManager;
import br.com.smd.ecommerce.modelo.Categoria;
import java.util.List;

/**
 *
 * @author Caique
 */
public class CategoriaDAO {

    public void salvarCategoria(Categoria c) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        try {
            manager.getTransaction().begin();
            manager.persist(c);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
    }

    public List<Categoria> mostrarCategorias() {
        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Categoria> listaCategoria = null;
        try {
            
            listaCategoria = (List<Categoria>)manager.createQuery("FROM TB_CATEGORIA c order by c.categoria_id desc").getResultList();
            
        } catch (Exception e) {
            System.out.println("Ocorreu um erro ao carregar listas: "+ e);
        }
        return listaCategoria;
    }

    public void atualizarCategoria(Categoria c) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        try {
            manager.getTransaction().begin();
            manager.merge(c);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
    }

    public void removerCategoria(Categoria c) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        try {
            manager.getTransaction().begin();
            manager.remove(c);
            manager.getTransaction().commit();
        } catch (Exception ex) {
            ex.printStackTrace();
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
    }

}

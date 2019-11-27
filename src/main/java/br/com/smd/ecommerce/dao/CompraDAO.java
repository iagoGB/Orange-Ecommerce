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
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

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
            //Distinct para não trazer repetições de compra!
            TypedQuery<Compra> query = manager.createQuery(
                    "Select DISTINCT c from TB_COMPRA as c "
                    + "join fetch c.produtos",
                    Compra.class
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
    
    public List<Compra> recuperarTodasAsComprasClientesPorData(Date dataInicio, Date dataFim) {

        EntityManager manager = new FabricaDeConexao().getConexao();
        List<Compra> result = null;
        try {

            manager.getTransaction().begin();
            //Distinct para não trazer repetições de compra!
            TypedQuery<Compra> query = manager.createQuery(
                    
                "Select distinct c "
                + "from TB_COMPRA c "
                + "join fetch c.usuario WHERE c.data_compra BETWEEN :start AND :end" , Compra.class);
                query.setParameter("start", dataInicio, TemporalType.TIMESTAMP)
                    .setParameter("end", dataFim, TemporalType.TIMESTAMP);
                    
            result = query.getResultList();
            
            for (Compra compra : result) {
                compra.getProdutos().size();
            }

            manager.getTransaction().commit();

        } catch (Exception e) {

            System.err.println(" Erro ao consultar compras: " + e);
            manager.getTransaction().rollback();

        } finally {

            manager.close();

        }
        System.out.println(result);
        return result;
    }
    
    
   

    public Compra salvarCompra(Usuario us) {

        EntityManager manager = new FabricaDeConexao().getConexao();
        Compra cp = new Compra();

        try {
            manager.getTransaction().begin();
            us = (Usuario) manager.find(Usuario.class, us.getUsuario_id());
            cp.setUsuario(us);
            cp.setData_compra(new Date());
            manager.persist(cp);

            us.getCompras().add(cp);
            manager.merge(us);

            manager.getTransaction().commit();

        } catch (Exception e) {

            cp = null;
            manager.getTransaction().rollback();

        } finally {

            manager.close();
        }
        return cp;
    }

    public void insereProdutoCompra(Long produto_id, Integer quantidadeDaCompra, Long compra_id) {
        EntityManager manager = new FabricaDeConexao().getConexao();

        try {
            manager.getTransaction().begin();

            Compra compra = (Compra) manager.find(Compra.class, compra_id);
            Produto produto = (Produto) manager.find(Produto.class, produto_id);

            ProdutoCompra produtoCompra = new ProdutoCompra();
            produtoCompra.setProduto(produto);
            produtoCompra.setCompra(compra);
            produtoCompra.setQuantidade(quantidadeDaCompra);
            manager.persist(produtoCompra);

            manager.getTransaction().commit();

        } catch (Exception e) {
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
    }
    
  

    public Compra buscarProdutosDaCompra(Long compra_id) {
        EntityManager manager = new FabricaDeConexao().getConexao();

        Compra compra = null;
        try {
            manager.getTransaction().begin();

            TypedQuery<Compra> query = manager.createQuery(
                    "Select c from TB_COMPRA as c "
                    + "join fetch c.produtos pc "
                    + "where pc.compra.compra_id = :pId", Compra.class)
                    .setParameter("pId", compra_id);

            compra = query.getSingleResult();

            manager.getTransaction().commit();

        } catch (Exception ex) {
            System.err.println("Ocorreu uma exceção ao tentar buscar produtos da compra: " + ex);
            manager.getTransaction().rollback();
        } finally {
            manager.close();
        }
        return compra;
    }

    public boolean deletarCompra(Long compra_id) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean sucesso = false;

        try {
            manager.getTransaction().begin();

            Compra toDelete = manager.find(Compra.class, compra_id);

            //Retorna os valores de quantidade dos produtos para o estoque
            //Para cada produto da compra
            for (Iterator<ProdutoCompra> iterator = toDelete.getProdutos().iterator(); iterator.hasNext();) {
                ProdutoCompra next = iterator.next();

                //Sete a quantidade com a do estoque mais o que retornou da compra
                next.getProduto().setQuantidade(next.getProduto().getQuantidade() + next.getQuantidade());
                //Atualize o produto
                manager.merge(next.getProduto());

            }

            //Remove a compra da lista de compras do usuário
            toDelete.getUsuario().getCompras().remove(toDelete);
            //A lista de produtoxcompra possui remover orfãos, logo ao deletar compra,
            //suas relações com produto também serão deletadas
            manager.remove(toDelete);

            manager.getTransaction().commit();
            sucesso = true;

        } catch (Exception ex) {

            System.err.println("Ocorreu um erro ao tentar deletar compra: " + ex);
            manager.getTransaction().rollback();

        } finally {
            manager.close();
        }
        return sucesso;
    }


}

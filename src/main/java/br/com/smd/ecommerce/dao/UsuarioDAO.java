/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.modelo.Usuario;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

/**
 *
 * @author Iago Gomes
 */
public class UsuarioDAO {

    public static void salvarCompra(Long usuario_id, Long compra_id) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        
        try {
            manager.getTransaction().begin();
                Usuario us = (Usuario) manager.find(Usuario.class, usuario_id);
                Compra c = (Compra) manager.find(Compra.class, compra_id);
                //Incompleto
                
        } catch (Exception e) {
            manager.getTransaction().rollback();
        } finally{
            manager.close();
        }

    }

    //Consulta se login e senha batem com dados do banco
    public Usuario verificarSessao(String login, String senha) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        Usuario u = null;

        try {

            Query query = manager.createQuery("FROM Usuario u WHERE u.login = :l AND u.senha = :s")
                    .setParameter("l", login)
                    .setParameter("s", senha);
            u = (Usuario) query.getSingleResult();
            
            manager.getTransaction().begin();
            //Pega todos os produtos da compra
            for (Compra compra : u.getCompras()) {
                compra.getProdutos().size();
            }
            manager.getTransaction().commit();
         
            

        } catch (Exception e) {

            System.out.println("Um erro ocorreu ao consultar os dados" + e);

        } finally {
            
            manager.close();
        }

        return u;
    }

    public Usuario consultarPorLogin(String login) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        Usuario u = null;

        try {

            Query query = manager.createQuery("FROM Usuario u WHERE u.login = :l")
                    .setParameter("l", login);

            u = (Usuario) query.getSingleResult();

        } catch (Exception e) {

            System.out.println("Um erro ocorreu ao consultar os dados" + e);

        } finally {
            manager.close();
        }
        return u;
    }

    public Usuario consultarPorEmail(String email) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        Usuario u = null;

        try {

            Query query = manager.createQuery("FROM Usuario u WHERE u.email = :e ")
                    .setParameter("e", email);
            u = (Usuario) query.getSingleResult();

        } catch (Exception e) {

            System.out.println("Um erro ocorreu ao consultar os dados" + e);

        } finally {
            manager.close();
        }
        return u;
    }

    public List<Usuario> listarTodos() {
        return null;
    }
    
    public Usuario listarPorId(){
        return null;
    }

    public boolean salvar(Usuario usuario) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean salvo = false;
        try {

            manager.getTransaction().begin();
            manager.persist(usuario);
            //Salve
            manager.getTransaction().commit();
            //Ação de salvar bem sucedida
            salvo = true;
            System.out.println("Salvamento bem sucedido");

        } catch (Exception e) {

            //Em caso de erro retorne falso
            manager.getTransaction().rollback();
            System.out.println("Erro ao salvar usuário" + e);
            salvo = false;

        } finally {
            manager.close();
        }

        return salvo;
    }

    public Usuario atualizar(Usuario usuario){
        EntityManager em = new FabricaDeConexao().getConexao();
        
        try {
            em.getTransaction().begin();
            if (usuario.getUsuario_id() != null) {
                em.merge(usuario);
            }
            em.getTransaction().commit();

        } catch (Exception e) {

            System.out.println("Ocorreu um erro ao atualizar dados do cliente: " + e);
            em.getTransaction().rollback();

        } finally {

            em.close();

        }

        return usuario;
    }
    
   public boolean deletarPorId(Long id) {
        EntityManager em = new FabricaDeConexao().getConexao();
        Usuario cliente = null;

        boolean deletou = false;

        try {

            cliente = em.find(Usuario.class, id);
            em.getTransaction().begin();
            em.remove(cliente);
            em.getTransaction().commit();
            deletou = true;

        } catch (Exception e) {

            System.out.println("Ocorreu o seguinte erro ao deleter cliente: " + e);
            em.getTransaction().rollback();

        } finally {
            em.close();
        }

        return deletou;
    }
   
    public List<Usuario> recuperarTodos(Date dataInicio, Date dataFim){
        EntityManager em = new FabricaDeConexao().getConexao();
        List<Usuario> listaUsuario = new ArrayList<Usuario>();
        try{
             TypedQuery<Usuario> query = em.createQuery(
                     "FROM Usuario u join fetch u.compras WHERE u.compras.data_compra BETWEEN :start AND :end",
                    Usuario.class
             );
             query.setParameter("start", dataInicio, TemporalType.TIMESTAMP)
                    .setParameter("end", dataFim, TemporalType.TIMESTAMP);

            listaUsuario = query.getResultList();
        }catch(Exception ex){
            System.err.println("Erro ao buscar todos os usuarios : "+ ex);
        }finally{
            em.getTransaction().begin();
        }
        return listaUsuario;
    }
   
   
}

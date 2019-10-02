/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import br.com.smd.ecommerce.modelo.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Iago Gomes
 */
public class UsuarioDAO {
    
    //Consulta se login e senha batem com dados do banco
    public Usuario verificarSessao(String login, String senha){
        EntityManager manager = new FabricaDeConexao().getConexao();
        Usuario u = null;
        
        try {
            
            Query query = manager.createQuery("FROM Usuario u WHERE u.login = :l AND u.senha = :s" )
                    .setParameter("l", login)
                    .setParameter("s", senha);
            u = (Usuario) query.getSingleResult();
            
        } catch (Exception e) {
            
            System.out.println("Um erro ocorreu ao consultar os dados"+ e);
            
        }finally{
            manager.close();
        }
        
        return u;
    }
    
    public Usuario consultarPorLogin(String login){
        EntityManager manager = new FabricaDeConexao().getConexao();
        Usuario u = null;
        
        try {
            
            Query query = manager.createQuery("FROM Usuario u WHERE u.login = :l" )
                    .setParameter("l", login);
                   
            u = (Usuario) query.getSingleResult();
            
        } catch (Exception e) {
          
            System.out.println("Um erro ocorreu ao consultar os dados"+ e);
            
        }finally {
            manager.close();
        }
        return u;
    }
    
    public Usuario consultarPorEmail(String email ){
         EntityManager manager = new FabricaDeConexao().getConexao();
        Usuario u = null;
        
        try {
            
            Query query = manager.createQuery("FROM Usuario u WHERE u.email = :e " )
                    .setParameter("e", email);
            u = (Usuario) query.getSingleResult();
            
        } catch (Exception e) {
            
            System.out.println("Um erro ocorreu ao consultar os dados"+ e);
            
        }finally {
            manager.close();
        }
        return u;
    }
    
    public List<Usuario> listarTodos(){
        return null;
    }
    
    public boolean salvar(Usuario usuario){
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
            System.out.println("Erro ao salvar usuário"+ e);
            salvo = false;
            
        } finally {
             manager.close();
        }
        
        return salvo;
    }
    
    
}

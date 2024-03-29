/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.dao;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import br.com.smd.ecommerce.modelo.Administrador;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Iago Gomes
 */
public class AdministradorDAO {

    //Consulta se login e senha batem com dados do banco
    public Administrador verificarSessao(String login, String senha) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        Administrador adm = null;

        try {

            Query query = manager.createQuery("FROM Administrador adm WHERE adm.login = :l AND adm.senha = :s")
                    .setParameter("l", login)
                    .setParameter("s", senha);
            adm = (Administrador) query.getSingleResult();

        } catch (Exception e) {

            System.out.println("Um erro ocorreu ao consultar os dados: " + e);

        } finally {
            manager.close();
        }

        return adm;
    }

    public Administrador consultarPorLogin(String login) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        Administrador adm = null;

        try {

            Query query = manager.createQuery("FROM Administrador adm WHERE adm.login = :l")
                    .setParameter("l", login);

            adm = (Administrador) query.getSingleResult();

        } catch (Exception e) {

            System.out.println("Um erro ocorreu ao consultar os dados" + e);

        } finally {
            manager.close();
        }
        return adm;
    }

    public Administrador consultarPorEmail(String email) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        Administrador adm = null;

        try {

            Query query = manager.createQuery("FROM Administrador adm WHERE adm.email = :e ")
                    .setParameter("e", email);
            adm = (Administrador) query.getSingleResult();

        } catch (Exception e) {

            System.out.println("Um erro ocorreu ao consultar os dados" + e);

        } finally {
            manager.close();
        }
        return adm;
    }

    public Administrador atualizar(Administrador adm) {
        EntityManager em = new FabricaDeConexao().getConexao();
        try {
            em.getTransaction().begin();
            if (adm.getAdm_id() != null) {
                em.merge(adm);
            }
            em.getTransaction().commit();

        } catch (Exception e) {

            System.out.println("Ocorreu um erro ao atualizar dados: " + e);
            em.getTransaction().rollback();

        } finally {

            em.close();

        }

        return adm;
    }

    public boolean deletarPorLogin(String login) {
        EntityManager manager = new FabricaDeConexao().getConexao();
        boolean deletou = false;

        try {

            Query q = manager.createQuery("delete FROM Administrador adm where adm.login = :l ")
                    .setParameter("l", login);
            q.executeUpdate();
            deletou = true;

        } catch (Exception e) {

            System.out.println("Ocorreu um erro ao  tentar deletar" + e);
            manager.getTransaction().rollback();

        } finally {
            manager.close();
        }

        return deletou;
    }

    public boolean deletarPorId(Long id) {
        EntityManager em = new FabricaDeConexao().getConexao();
        Administrador adm = null;

        boolean deletou = false;

        try {

            adm = em.find(Administrador.class, id);
            em.getTransaction().begin();
            em.remove(adm);
            em.getTransaction().commit();
            deletou = true;

        } catch (Exception e) {

            System.out.println("Ocorreu o seguinnte erro: " + e);
            em.getTransaction().rollback();

        } finally {
            em.close();
        }

        return deletou;
    }
}

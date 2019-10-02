/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.conexao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Iago Gomes 
 */
public class FabricaDeConexao {
     
    //Conexão com banco de dados
    private static  EntityManagerFactory conexao = Persistence.createEntityManagerFactory("ecommerceSMDPU");
    
    //Retorna uma conexão ao banco de dados
    public EntityManager getConexao(){
        return conexao.createEntityManager();
    }
}

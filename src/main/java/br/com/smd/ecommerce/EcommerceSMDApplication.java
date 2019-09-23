package br.com.smd.ecommerce;

import br.com.smd.ecommerce.conexao.FabricaDeConexao;
import javax.persistence.EntityManager;

public class EcommerceSMDApplication {
    public static void main(String[] args) {
        // Execute esta função para gerar o banco 
        EntityManager manager = new FabricaDeConexao().getConexao();
        manager.close();     
    }
}

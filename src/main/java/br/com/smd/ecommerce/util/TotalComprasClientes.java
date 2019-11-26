/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.util;

import br.com.smd.ecommerce.modelo.Compra;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Caique
 */
public class TotalComprasClientes {
    private Long usuario_id;
    private Date data_compra;
    private String usuario_nome;
    private Integer quantidadeCompras;
    
    
    public TotalComprasClientes(){
        
    }

    /**
     * @return the usuario_id
     */
    public Long getUsuario_id() {
        return usuario_id;
    }

    /**
     * @param usuario_id the usuario_id to set
     */
    public void setUsuario_id(Long usuario_id) {
        this.usuario_id = usuario_id;
    }

    /**
     * @return the data_compra
     */
    public Date getData_compra() {
        return data_compra;
    }

    /**
     * @param data_compra the data_compra to set
     */
    public void setData_compra(Date data_compra) {
        this.data_compra = data_compra;
    }

    /**
     * @return the usuario_nome
     */
    public String getUsuario_nome() {
        return usuario_nome;
    }

    /**
     * @param usuario_nome the usuario_nome to set
     */
    public void setUsuario_nome(String usuario_nome) {
        this.usuario_nome = usuario_nome;
    }

    /**
     * @return the quantidadeCompras
     */
    public Integer getQuantidadeCompras() {
        return quantidadeCompras;
    }
    
    

    /**
     * @param quantidadeCompras the quantidadeCompras to set
     */
    public void setQuantidadeCompras(Integer quantidadeCompras ) {
        this.quantidadeCompras = quantidadeCompras;
    }
    
    public static List<TotalComprasClientes> parseTotalComprasClientes(List<Compra> comprasClientes) {

        List<TotalComprasClientes> TotalComprasClientesList = new ArrayList<>();

        for (Compra c : comprasClientes) {

            TotalComprasClientes tcc = new TotalComprasClientes();

            tcc.setUsuario_id(c.getUsuario().getUsuario_id());
            tcc.setUsuario_nome(c.getUsuario().getNome());
            tcc.setQuantidadeCompras(c.getUsuario().getCompras().size());
            //Manipular data
            tcc.setData_compra(c.getData_compra());
  
            TotalComprasClientesList.add(tcc);
        }
        return TotalComprasClientesList;
    }
    
    
}

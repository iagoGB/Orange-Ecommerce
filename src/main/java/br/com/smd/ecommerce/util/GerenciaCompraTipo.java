/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Iago
 */
public class GerenciaCompraTipo {
    
    private Long compra_id;
    private Date data_compra;
    private String cliente;
    private Double valorTotal;
    private List<String> produtosList = new ArrayList<>();
    private List<Integer> quantidadeList =  new ArrayList<>();
    
    public GerenciaCompraTipo(){
        
    }
    
    public Long getCompra_id() {
        return compra_id;
    }

    public void setCompra_id(Long compra_id) {
        this.compra_id = compra_id;
    }

    public Date getData_compra() {
        return data_compra;
    }

    public void setData_compra(Date data_compra) {
        this.data_compra = data_compra;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public Double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public List<String> getProdutosList() {
        return produtosList;
    }

    public void setProdutosList(List<String> produtos) {
        this.produtosList = produtos;
    }

    public List<Integer> getQuantidadeList() {
        return quantidadeList;
    }

    public void setQuantidadeList(List<Integer> quantidade) {
        this.quantidadeList = quantidade;
    }
    
    
    
}

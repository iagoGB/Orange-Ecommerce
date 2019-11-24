/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.util;

import br.com.smd.ecommerce.modelo.Compra;
import br.com.smd.ecommerce.modelo.ProdutoCompra;
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
    
    public static List<GerenciaCompraTipo> parseGerenciaCompraTipo(List<Compra> gerenciaCompras) {

        List<GerenciaCompraTipo> gerenciaCompraTipoList = new ArrayList<>();

        for (Compra compra : gerenciaCompras) {

            GerenciaCompraTipo gct = new GerenciaCompraTipo();

            gct.setCompra_id(compra.getCompra_id());
            gct.setData_compra(compra.getData_compra());
            gct.setCliente(compra.getUsuario().getNome());

            //Para cada produto da compra
            Double valorTotalPorCompra = 0.0;

            for (ProdutoCompra pc : compra.getProdutos()) {

                //Adiciona os nomes
                gct.getProdutosList().add(pc.getProduto().getDescricao());
                gct.getQuantidadeList().add(pc.getQuantidade());

                valorTotalPorCompra += (pc.getQuantidade() * pc.getProduto().getPreco());

            }

            gct.setValorTotal(valorTotalPorCompra);

            gerenciaCompraTipoList.add(gct);

        }
        return gerenciaCompraTipoList;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.util;

import br.com.smd.ecommerce.modelo.Produto;

/**
 *
 * @author Iago Gomes
 */
public class ProdutoCompraView {
    Long produto_id;
    String foto;
    String descricao;
    Integer quantidade;
    Double precoUnitario;
    Double precoTotal;

    public ProdutoCompraView(String foto, String descricao, Integer quantidade, Double precoUnitario, Double precoTotal) {
        
        this.foto = foto;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.precoUnitario = precoUnitario;
        this.precoTotal = precoTotal;
        
    }
    
    public ProdutoCompraView (Produto p){
        
        this.foto = p.getFoto();
        this.descricao = p.getDescricao();
        this.precoUnitario = p.getPreco();
        this.quantidade = p.getQuantidade();
        this.produto_id = p.getProduto_id();
    }

    public ProdutoCompraView(){
        
    }

    public Long getProduto_id() {
        return produto_id;
    }

    public void setProduto_id(Long produto_id) {
        this.produto_id = produto_id;
    }
    
    
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Double getPrecoUnitario() {
        return precoUnitario;
    }

    public void setPrecoUnitario(Double precoUnitario) {
        this.precoUnitario = precoUnitario;
    }

    public Double getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(Double precoTotal) {
        this.precoTotal = precoTotal;
    }

    
}

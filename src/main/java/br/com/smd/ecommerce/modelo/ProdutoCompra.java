/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author iago
 */
@Entity(name = "TB_PRODUTOXCOMPRA")
@IdClass(ProdutoCompraId.class)
public class ProdutoCompra implements Serializable {
    @Id
    @ManyToOne
    @JoinColumn(
        name = "fk_produto_id",
        foreignKey = @ForeignKey(name = "fk_produto_id"),
        nullable = false
    )
    Produto produto;
    
    @Id
    @ManyToOne
    @JoinColumn(
            name = "fk_compra_id",
            foreignKey = @ForeignKey(name = "fk_compra_id"),
            nullable = false 
    )
    Compra compra;
    
    @Column
    private Integer quantidade;  //a quantidade de produtos no pedido
    
    /*
        @Column     //valor total deste produto no pedido, geralmente preço x quantidade
        private Double total;  
    */
    
    public ProdutoCompra(){
    
    }

    public ProdutoCompra(Produto produto, Compra compra, Integer quantidade) {
        this.produto = produto;
        this.compra = compra;
        this.quantidade = quantidade;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
 
}

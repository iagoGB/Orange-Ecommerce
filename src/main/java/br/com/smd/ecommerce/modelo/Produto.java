/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.modelo;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

/**
 *
 * @author iago
 */
@Entity(name = "TB_PRODUTO")
public class Produto implements Serializable {    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long produto_id;
    
    @Column(nullable = false)
    private String descricao;
    
    @Column(nullable = false)
    private Double preco;
    
    @Column(nullable = false)
    private Integer quantidade;
    
    @ManyToMany(mappedBy = "produtos") 
    private List<Categoria> categorias;
    
    @OneToMany(mappedBy = "produto")
    private List<ProdutoCompra> produtoEmCompras;

    public Produto(){
    
    }

    public Produto(Long produto_id, String descricao, Double preco, Integer quantidade, List<Categoria> categorias, List<ProdutoCompra> produtoEmCompras) {
        this.produto_id = produto_id;
        this.descricao = descricao;
        this.preco = preco;
        this.quantidade = quantidade;
        this.categorias = categorias;
        this.produtoEmCompras = produtoEmCompras;
    }

    public Long getProduto_id() {
        return produto_id;
    }

    public void setProduto_id(Long produto_id) {
        this.produto_id = produto_id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public List<Categoria> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }
    
    public List<ProdutoCompra> getProdutoEmCompras() {
        return produtoEmCompras;
    }

    public void setProdutoEmCompras(List<ProdutoCompra> produtoEmCompras) {
        this.produtoEmCompras = produtoEmCompras;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 73 * hash + Objects.hashCode(this.produto_id);
        hash = 73 * hash + Objects.hashCode(this.descricao);
        hash = 73 * hash + Objects.hashCode(this.preco);
        hash = 73 * hash + Objects.hashCode(this.quantidade);
        hash = 73 * hash + Objects.hashCode(this.categorias);
        hash = 73 * hash + Objects.hashCode(this.produtoEmCompras);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Produto other = (Produto) obj;
        if (!Objects.equals(this.produto_id, other.produto_id)) {
            return false;
        }
        if (!Objects.equals(this.descricao, other.descricao)) {
            return false;
        }
        if (!Objects.equals(this.preco, other.preco)) {
            return false;
        }
        if (!Objects.equals(this.quantidade, other.quantidade)) {
            return false;
        }
        if (!Objects.equals(this.categorias, other.categorias)) {
            return false;
        }
        if (!Objects.equals(this.produtoEmCompras, other.produtoEmCompras)) {
            return false;
        }
        return true;
    }
    
    
    
}

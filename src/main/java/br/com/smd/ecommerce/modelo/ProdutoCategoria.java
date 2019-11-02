/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.modelo;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Iago Gomes
 */

@Entity(name = "TB_PRODUTOXCATEGORIA")
@IdClass(ProdutoCategoriaId.class)
public class ProdutoCategoria implements Serializable{
    
    @Id
    @ManyToOne(cascade = CascadeType.MERGE )
    @JoinColumn(
        name = "fk_produto_id",
        foreignKey = @ForeignKey(name = "fk_produto_id"),
        nullable = false
    )
    Produto produto;
    
    @Id
    @ManyToOne(cascade = CascadeType.MERGE )
    @JoinColumn(
            name = "fk_categoria_id",
            foreignKey = @ForeignKey(name = "fk_categoria_id"),
            nullable = false 
    )
    Categoria categoria;

    public ProdutoCategoria(Produto produto, Categoria categoria) {
        this.produto = produto;
        this.categoria = categoria;
    }

    public ProdutoCategoria() {
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 71 * hash + Objects.hashCode(this.produto);
        hash = 71 * hash + Objects.hashCode(this.categoria);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ProdutoCategoria other = (ProdutoCategoria) obj;
        if (!Objects.equals(this.produto, other.produto)) {
            return false;
        }
        if (!Objects.equals(this.categoria, other.categoria)) {
            return false;
        }
        return true;
    }

    

    @Override
    public String toString() {
        return "ProdutoCategoria{" + "produto=" + produto + ", categoria=" + categoria + '}';
    }
    
    
}

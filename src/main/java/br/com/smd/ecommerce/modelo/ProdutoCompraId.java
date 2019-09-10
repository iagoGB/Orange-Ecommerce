/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.modelo;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author iago
 */
public class ProdutoCompraId implements Serializable {
    Long compra;
    Long produto;
   
    public ProdutoCompraId(){
    
    }

    public ProdutoCompraId(Long compra_id, Long produto_id) {
        this.compra = compra_id;
        this.produto = produto_id;
    }

    public Long getCompra() {
        return compra;
    }

    public void setCompra(Long compra) {
        this.compra = compra;
    }

    public Long getProduto() {
        return produto;
    }

    public void setProduto(Long produto) {
        this.produto = produto;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 83 * hash + Objects.hashCode(this.compra);
        hash = 83 * hash + Objects.hashCode(this.produto);
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
        final ProdutoCompraId other = (ProdutoCompraId) obj;
        if (!Objects.equals(this.compra, other.compra)) {
            return false;
        }
        if (!Objects.equals(this.produto, other.produto)) {
            return false;
        }
        return true;
    }
    
    

    
    
    
}

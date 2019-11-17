/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Iago Gomes
 */
@Entity(name = "TB_COMPRA")
public class Compra implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long compra_id;
    
    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date data_compra;
 
    @ManyToOne
    @JoinColumn(
            name = "fk_usuario_id", 
            referencedColumnName = "usuario_id", 
            foreignKey = @ForeignKey( name="fk_usuario_id"),
            nullable = false
    )
    private Usuario usuario;
    
    @OneToMany(mappedBy = "produto", fetch = FetchType.EAGER)
    private List<ProdutoCompra> produtos;
    
    public Compra(){
        this.produtos = new ArrayList<ProdutoCompra>();
    }

    public Compra(Long compra_id, Date data_compra, Usuario usuario, List<ProdutoCompra> produtos) {
        this.compra_id = compra_id;
        this.data_compra = data_compra;
        this.usuario = usuario;
        this.produtos = produtos;
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

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public void setProdutos(List<ProdutoCompra> produtos) {
        this.produtos = produtos;
    }

    public List<ProdutoCompra> getProdutos() {
        return produtos;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + Objects.hashCode(this.compra_id);
        hash = 17 * hash + Objects.hashCode(this.data_compra);
        hash = 17 * hash + Objects.hashCode(this.usuario);
        hash = 17 * hash + Objects.hashCode(this.produtos);
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
        final Compra other = (Compra) obj;
        if (!Objects.equals(this.compra_id, other.compra_id)) {
            return false;
        }
        if (!Objects.equals(this.data_compra, other.data_compra)) {
            return false;
        }
        if (!Objects.equals(this.usuario, other.usuario)) {
            return false;
        }
        if (!Objects.equals(this.produtos, other.produtos)) {
            return false;
        }
        return true;
    }

   
    
    
    
    
}

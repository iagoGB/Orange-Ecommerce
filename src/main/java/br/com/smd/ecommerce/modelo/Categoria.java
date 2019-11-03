/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author iago
 */
@Entity(name = "TB_CATEGORIA")
public class Categoria implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long categoria_id;
    
    @Column(nullable = false)
    private String descricao;
    
    @OneToMany(mappedBy = "categoria", orphanRemoval = true )
    private List<ProdutoCategoria> listaProdutos;
    
    public Categoria() {
        this.listaProdutos = new ArrayList<>();
    }
    
    public Categoria(Long categoria_id, String descricao) {
        this.categoria_id = categoria_id;
        this.descricao = descricao;
    }

    public Categoria(Long categoria_id, String descricao, List<ProdutoCategoria> listaProdutos) {
        this.categoria_id = categoria_id;
        this.descricao = descricao;
        this.listaProdutos = listaProdutos;
    }

    public Long getCategoria_id() {
        return categoria_id;
    }

    public void setCategoria_id(Long categoria_id) {
        this.categoria_id = categoria_id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public List<ProdutoCategoria> getListaProdutos() {
        return listaProdutos;
    }

    public void setListaProdutos(List<ProdutoCategoria> listaProdutos) {
        this.listaProdutos = listaProdutos;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + Objects.hashCode(this.categoria_id);
        hash = 97 * hash + Objects.hashCode(this.descricao);
        hash = 97 * hash + Objects.hashCode(this.listaProdutos);
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
        final Categoria other = (Categoria) obj;
        if (!Objects.equals(this.descricao, other.descricao)) {
            return false;
        }
        if (!Objects.equals(this.categoria_id, other.categoria_id)) {
            return false;
        }
        if (!Objects.equals(this.listaProdutos, other.listaProdutos)) {
            return false;
        }
        return true;
    }
    
}

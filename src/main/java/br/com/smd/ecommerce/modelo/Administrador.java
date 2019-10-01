/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.smd.ecommerce.modelo;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Iago Gomes
 */
@Entity
public class Administrador implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long adm_id;
    
    @Column(nullable = false)
    private String nome;
    
    @Column(nullable = false)
    private String email;
    
    @Column(name = "login", nullable = false)
    private String login;
    
    @Column(nullable = false)
    private String senha;

    public Administrador() {
    }

    public Administrador(Long adm_id, String nome, String email, String login, String senha) {
        this.adm_id = adm_id;
        this.nome = nome;
        this.email = email;
        this.login = login;
        this.senha = senha;
    }

    public Long getAdm_id() {
        return adm_id;
    }

    public void setAdm_id(Long adm_id) {
        this.adm_id = adm_id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.adm_id);
        hash = 29 * hash + Objects.hashCode(this.nome);
        hash = 29 * hash + Objects.hashCode(this.email);
        hash = 29 * hash + Objects.hashCode(this.login);
        hash = 29 * hash + Objects.hashCode(this.senha);
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
        final Administrador other = (Administrador) obj;
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.login, other.login)) {
            return false;
        }
        if (!Objects.equals(this.senha, other.senha)) {
            return false;
        }
        if (!Objects.equals(this.adm_id, other.adm_id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Administrador{" + "adm_id=" + adm_id + ", nome=" + nome + ", email=" + email + ", login=" + login + ", senha=" + senha + '}';
    }
}

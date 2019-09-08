
package br.com.ecommercesmd.modelo;

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
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author iago
 */
@Entity
@Table(
    name = "TB_USUARIO",
    uniqueConstraints = { 
        @UniqueConstraint(
            name = "uk_login_unico",
            columnNames = { "login" }  
        ) 
    }
)
public class Usuario implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long usuario_id;
    
    @Column(nullable = false)
    private String nome;
    
    @Column(nullable = false)
    private String endereco;
    
    @Column(name = "login", nullable = false)
    private String login;
    
    @Column(nullable = false)
    private String senha;
    
    @OneToMany(mappedBy = "usuario")
    private List<Compra> compras;

    public Usuario() {
        this.compras = new ArrayList<>();
    }

    public Usuario(Long usuario_id, String nome, String endereco, String senha, List<Compra> compras) {
        this.usuario_id = usuario_id;
        this.nome = nome;
        this.endereco = endereco;
        this.senha = senha;
        this.compras = compras;
    }

    public Long getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(Long usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
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
    
     public List<Compra> getCompras() {
        return compras;
    }

    public void setCompras(List<Compra> compras) {
        this.compras = compras;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 13 * hash + Objects.hashCode(this.usuario_id);
        hash = 13 * hash + Objects.hashCode(this.nome);
        hash = 13 * hash + Objects.hashCode(this.endereco);
        hash = 13 * hash + Objects.hashCode(this.login);
        hash = 13 * hash + Objects.hashCode(this.senha);
        hash = 13 * hash + Objects.hashCode(this.compras);
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
        final Usuario other = (Usuario) obj;
        if (!Objects.equals(this.usuario_id, other.usuario_id)) {
            return false;
        }
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.login, other.login)) {
            return false;
        }
        if (!Objects.equals(this.senha, other.senha)) {
            return false;
        }
        if (!Objects.equals(this.compras, other.compras)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Usuario{" + "nome=" + nome + ", endereco=" + endereco + ", login=" + login + ", senha=" + senha + ", compras=" + compras + '}';
    }
}
    

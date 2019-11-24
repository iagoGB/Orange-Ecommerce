package br.com.smd.ecommerce.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author Iago Gomes
 */
@Entity
@Table(
        name = "TB_USUARIO",
        uniqueConstraints = {
            @UniqueConstraint(
                    name = "uk_login_unico",
                    columnNames = {"login"}
            ),
            @UniqueConstraint(
                    name = "uk_email_unico",
                    columnNames = {"email"}
            )
        }
)
public class Usuario implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long usuario_id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false)
    private String endereco;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "login", nullable = false)
    private String login;

    @Column(nullable = false)
    private String senha;
    
    @OneToMany(mappedBy = "usuario", fetch = FetchType.EAGER, orphanRemoval = true )
    private List<Compra> compras;

    public Usuario() {
        this.compras = new ArrayList<>();
    }

    public Usuario(Long usuario_id, String nome, String endereco, String email, String login, String senha, List<Compra> compras) {
        this.usuario_id = usuario_id;
        this.nome = nome;
        this.endereco = endereco;
        this.email = email;
        this.login = login;
        this.senha = senha;
        this.compras = compras;
    }

    public Usuario(Long usuario_id, String nome, String endereco, String email, String login, String senha) {
        this.usuario_id = usuario_id;
        this.nome = nome;
        this.endereco = endereco;
        this.email = email;
        this.login = login;
        this.senha = senha;
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

    public List<Compra> getCompras() {
        return compras;
    }

    public void setCompras(List<Compra> compras) {
        this.compras = compras;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 79 * hash + Objects.hashCode(this.usuario_id);
        hash = 79 * hash + Objects.hashCode(this.nome);
        hash = 79 * hash + Objects.hashCode(this.endereco);
        hash = 79 * hash + Objects.hashCode(this.email);
        hash = 79 * hash + Objects.hashCode(this.login);
        hash = 79 * hash + Objects.hashCode(this.senha);
        hash = 79 * hash + Objects.hashCode(this.compras);
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
        final Usuario other = (Usuario) obj;
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.endereco, other.endereco)) {
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
        if (!Objects.equals(this.usuario_id, other.usuario_id)) {
            return false;
        }
        if (!Objects.equals(this.compras, other.compras)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Usuario{" + "usuario_id=" + usuario_id + ", nome=" + nome + ", endereco=" + endereco + ", email=" + email + ", login=" + login + ", senha=" + senha + ", compras=" + compras + '}';
    }
}

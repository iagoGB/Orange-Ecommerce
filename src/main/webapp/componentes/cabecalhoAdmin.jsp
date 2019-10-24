<%-- 
    Document   : cabecalhoadmin
    Created on : 22/10/2019, 14:55:39
    Author     : Iago Gomess
--%>

<%@page import="br.com.smd.ecommerce.modelo.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="container-fluid mb-3">
    <!-- Navbar principal -->
    <div class="row shadow justify-content-start">
        <div class="col-12">
            <!--Navbar -->
            <nav class="mb-1 navbar navbar-light shadow-none">
                <!-- Menu -->
                <button class="navbar-toggler order-sm-1 order-md-1 d-lg-none" id="menuresponsivo" type="button"
                        data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Logo -->
                <a class="navbar-brand mr-auto mr-md-0 order-sm-2 order-md-2 order-lg-1" href="admin.jsp">
                    <img src="${pageContext.request.contextPath}/img/logocor.png" alt="Transparent MDB Logo" id="animated-img1">
                </a>
                <!-- ConteÃºdo do menu -->
                <div class="collapse navbar-collapse order-sm-4 order-md-5 py-3" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <h5>Nossos produtos</h5>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="categoria.jsp">Smartphones
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="categoria.jsp">Notebooks</a>
                        </li>
                        <li class="nav-item border-bottom border-lg-0 mb-3">
                            <a class="nav-link" href="categoria.jsp">PCs</a>
                        </li>
                        <!-- Itens que somem no tamanho sm-->
                        <li class="nav-item d-sm-none">
                            <h5>Conta</h5>
                        </li>

                        <%-- Sï¿½ mostra sair se o usuï¿½rio estiver logado --%>

                        <%
                            if (session.getAttribute("usuario") != null) {
                        %> 
                        <li class="nav-item d-sm-none">
                            <a class="nav-link" href="#">Minha conta</a>
                        </li>
                        <%
                            };
                        %>
                        <li class="nav-item d-sm-none">
                            <a class="nav-link" href="favoritos.jsp">Meus favoritos</a>
                        </li>
                        <li class="nav-item d-sm-none">
                            <a class="nav-link" href="carrinho.jsp">Meu carrinho</a>
                        </li>
                        <li class="nav-item border-bottom border-lg-0 mb-3 d-sm-none">
                            <a class="nav-link" href="/logout">Sair</a>
                        </li>
                    </ul>
                    <form class="d-md-none form-row">
                        <div class="input-group md-form my-0">
                            <input type="search" class="form-control" placeholder="Pesquisar"
                                   aria-label="Pesquisar" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn-sm btn-dark" type="button" id="inputGroupFileAddon">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Conta -->
                <ul class="navbar-nav nav-flex-icons d-none d-sm-inline-flex order-sm-3 order-md-4 order-lg-4">
                    <li class="nav-item dropdown mx-1 mx-lg-2">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user fa-2x"></i>

                        </a>
                        <div class="dropdown-menu dropdown-menu-left dropdown-default"
                             aria-labelledby="navbarDropdownMenuLink-333">

                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/logout">Sair</a>
                        </div>

                    <li>
                        <div>
                            <%
                               // String msg = (String) request.getAttribute("msg");
                                Administrador adm = (Administrador) session.getAttribute("usuario");
                                if (adm != null) {
                            %>
                            <small>   Bem vindo <br> </small> 
                            <small>   <%=  adm.getLogin()%> </small> 
                            <%  }%>
                        </div>
                    </li>
                    </li>
                </ul>


            </nav>
        </div>
    </div>
</div>

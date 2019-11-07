<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<header>
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
                    <a class="navbar-brand mr-auto mr-md-0 order-sm-2 order-md-2 order-lg-1" href="/home.do">
                        <img src="${pageContext.request.contextPath}/img/logocor.png" alt="Transparent MDB Logo" id="animated-img1">
                    </a>
                    <!-- Conteúdo do menu -->
                    <div class="collapse navbar-collapse order-sm-4 order-md-5 py-3" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <h5>Nossos produtos</h5>
                            </li>
                            <c:forEach var="categoria" items="${listaCategoria}">
                                <li class="nav-item border-bottom border-lg-0 mb-3">
                                    <a class="nav-link" href="categoria.jsp">${categoria.descricao}</a>
                                </li>
                            </c:forEach>
                            <!-- Itens que somem no tamanho sm-->
                            <li class="nav-item d-sm-none">
                                <h5>Conta</h5>
                            </li>
                            <li class="nav-item d-sm-none">
                                <a class="nav-link" href="login.jsp">Entrar ou cadastrar</a>
                            </li>
                            <%-- Só mostra sair se o usuário estiver logado --%>

                            <%
                                if (session.getAttribute("usuario") != null) {
                            %> 
                            <li class="nav-item d-sm-none">
                                <a class="nav-link" href="cliente.jsp">Minha conta</a>
                            </li>
                            <li class="nav-item border-bottom border-lg-0 mb-3 d-sm-none">
                                <a class="nav-link" href="/logout.do">Sair</a>
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
                                 aria-labelledby="navbarDropdownMenuLink-333" id="
                                 logar">
                                <%
                                    if (session.getAttribute("usuario") == null) {
                                %>
                                <a class="dropdown-item" href="login.jsp">Entrar ou Cadastrar</a>
                                <%
                                    }
                                %>

                                <%-- Só mostra sair se o usuário estiver logado --%>

                                <%
                                    if (session.getAttribute("usuario") != null) {

                                %> 
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="cliente.jsp">Minha conta</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/logout.do">Sair</a>
                            </div>
                            <%                                        };
                            %>
                        <li>
                            <div>
                                <%
                                    //String msg = (String) request.getAttribute("msg");
                                    Usuario u = (Usuario) session.getAttribute("usuario");
                                    if (u != null) {
                                %>
                                <small>   Bem vindo <br> </small> 
                                <small>   <%=  u.getLogin()%> </small> 
                                <%  }%>
                            </div>
                        </li>

                        </li>
                        <li class="nav-item mx-1 mx-lg-2">
                            <a class="nav-link waves-effect waves-light" href="favoritos.jsp">
                                <i class="fas fa-heart fa-2x"></i>
                                <span class="small badge badge-dark">0</span>
                            </a>
                        </li>
                        <li class="nav-item mx-1 mx-lg-2">
                            <a class="nav-link waves-effect waves-light" href="carrinho.jsp">
                                <i class="fas fa-shopping-basket fa-2x"></i>
                                <span class="small badge badge-dark">${cookie.qntProduto.value}</span>
                            </a>
                        </li>
                    </ul>
                    <!-- Busca -->
                    <div class="col-md-4 d-none d-md-inline-block order-md-3 order-lg-2 mx-md-0 mx-lg-0">
                        <form class="form-row">
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
                    <!-- Menu rápido de categorias -->
                    <div class="dropdown d-none d-lg-block order-lg-3">
                        <button class="btn-md btn-outline-dark shadow-none dropdown-toggle p-1" type="button"
                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                            Nossos produtos
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                            <c:forEach var="categoria" items="${listaCategoria}">
                                <a class="dropdown-item" href="visualizarProduto.do?categoria=${categoria.categoria_id}">${categoria.descricao}</a>
                                <div class="dropdown-divider"></div>
                            </c:forEach>

                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
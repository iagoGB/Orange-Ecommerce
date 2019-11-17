<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@page import="br.com.smd.ecommerce.modelo.Categoria"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

    <%@include file="componentes/head.jsp" %>

<body>
    <!-- CABEÇALHO -->
    <%@include file="componentes/cabecalho.jsp" %>
    <div class="content">
        <section>
            <div class="container-fluid py-4">
                <div class="row pt-2 pb-0 px-3 align-content-center justify-content-center">
                    <div class="col-md-3 col-sm-4">
                        <div class="card">
                            <article class="card-group-item">
                                <header class="card-header">
                                    <h6 class="title">Categorias</h6>
                                </header>
                                <div class="filter-content">
                                    <div class="list-group list-group-flush">
                                        <c:forEach items="${listaCategorias}" var="categoria">
                                            <a href="visualizarProduto.do?categoria=${categoria.categoria_id}" class="list-group-item">
                                                ${categoria.descricao}<span class="float-right badge badge-secondary round">${fn:length(categoria.listaProdutos)}</span> 
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </article>
                            
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-8">
                        <!--Ordenação-->
                        <div class="row pt-2 pb-0 px-3 justify-content-center">
                            <div class="col">
                                <div class="dropdown">
                                    <button class="btn btn-warning dropdown-toggle" type="button"
                                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        Ordenar por
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#">Menor preço</a>
                                        <a class="dropdown-item" href="#">Maior preço</a>
                                        <a class="dropdown-item" href="#">Mais vendido</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Produtos-->
                        <div class="row pt-3 pb-3 px-3">
                            <c:forEach items="${listaProdutos}" var="produto">
                                <div class="col-lg-3 col-md-4 col-sm-12 pb-3">
                                    <div class="card border-dark h-100">
                                    <div class="p-2">
                                        <img class="card-img-top img-responsive" src="exibirFotoProduto.do?foto=${produto.foto}" alt="Imagem de capa do card">
                                    </div>
                                    <div class="card-body">
                                        <a href="produto.jsp">
                                            <h5 class="card-title">${produto.descricao}</h5>
                                            <p class="card-text"><fmt:formatNumber value = "${produto.preco}" type = "currency"/></p>
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <a href="#" class="btn btn-outline-danger"><i class="fas fa-heart"></i></a>
                                        <a href="/adicionarProdutoCarrinho.do?p=${produto.produto_id}" class="btn btn-outline-success"><i class="fas fa-cart-plus"></i></a>
                                    </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- RODAPÉ -->
    <%@include file="componentes/rodape.jsp" %>
</body>

</html>
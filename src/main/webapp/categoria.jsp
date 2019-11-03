<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@page import="br.com.smd.ecommerce.modelo.Categoria"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
                            <article class="card-group-item">
                                <div class="card-body">
                                    <input class="custom-range" min="0" max="100" name="" type="range">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Min</label>
                                            <input type="number" class="form-control" id="inputEmail4" placeholder="$0">
                                        </div>
                                        <div class="form-group col-md-6 text-right">
                                            <label>Max</label>
                                            <input type="number" class="form-control" placeholder="$1,0000">
                                        </div>
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
                                    <div class="card border-warning">
                                        <img class="card-img-top" src="exibirFotoProduto.do?foto=${produto.foto}" alt="Imagem do produto ${produto.descricao}">
                                        <div class="card-body">
                                            <a href="produto.html">
                                                <h5 class="card-title">${produto.descricao}</h5>
                                            </a>
                                            <p class="card-text">Preço:</p>
                                            <p class="card-text"> R$ <fmt:formatNumber type="number" pattern="00.00" value="${produto.preco}" /> </p>
                                            <a href="#" class="btn btn-primary"><i class="fas fa-heart"></i></a>
                                            <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
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
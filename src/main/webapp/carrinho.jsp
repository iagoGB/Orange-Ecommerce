<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include file="componentes/head.jsp" %>
    <head>

    <body>
        <!-- CABEÇALHO -->
        <header>
            <%@include file="componentes/cabecalho.jsp" %>
        </header>

        <div class="content">


            <!--Título-->
            <div class="row pt-5 pb-0 px-3">
                <div class="col">
                    <span class="h4">Carrinho de compras</span>
                    <hr class="bg-dark">
                </div>
            </div>
            <!--Cabeçalho Carrinho-->
            <div class="row pt-2 pb-0 px-md-5 px-sm-2 justify-content-center">
                <div class="bg-primary col-5">
                    <p class="text-light my-auto py-3">Produtos</p>
                </div>
                <div class="bg-primary col-2">
                    <p class="text-light my-auto py-3">Quantidade</p>
                </div>
                <div class="bg-primary col-2">
                    <p class="text-light my-auto py-3">Preço Unitário</p>
                </div>
                 <div class="bg-primary col-2">
                    <p class="text-light my-auto py-3">Preço Total</p>
                </div>
                <div class="bg-primary col-1">
                    <p class="text-light my-auto py-3">Ação</p>
                </div>
            </div>
            <!--produtos-->
            <c:choose>

                <c:when test="${carrinhoCompras.itemCarrinhoList.size() < 1}">
                    <div class="text-center align-middle">
                        <p class="mt-2 mb-2 pt-2">Você não possui produtos no carrinho</p>
                    </div>
                </c:when>

                <c:otherwise>

                    <c:forEach var="produto" items="${carrinhoCompras.itemCarrinhoList}">
                        <form action="/adicionarProdutoCarrinho.do" method="POST">

                            <div class="row pt-3 pb-0 px-md-5 px-sm-2 border-bottom justify-content-center">

                                <div class="col-2">
                                    <img src="exibirFotoProduto.do?foto=${produto.foto}" width="150" height="150" class="img-fluid my-3" alt="Responsive image">
                                </div>
                                <div class="col-3">
                                    <a href="produto.jsp">
                                        <h5 class="text-dark">${produto.descricao}</h5>
                                    </a>
                                    <p class="text-dark">Descrição</p>
                                    <input type="hidden" name="p" value="${produto.produto_id}">


                                </div>
                                <div class="col-2">
                                    <form class="form">
                                        <input type="number" class="text-center form-control bg-light" value="${produto.quantidade}" name="qnt" onchange="this.form.submit()">

                                    </form>
                                </div>
                                <div class="col-1">
                                    <p class="text-dark"><fmt:formatNumber value = "${produto.precoUnitario}" type = "currency"/></p>
                                </div>
                                <div class="col-1">
                                    <p class="text-dark"><fmt:formatNumber value = "${produto.precoTotal}" type = "currency"/></p>
                                </div>
                        </form>  
                        <div class="col-3">

                            <a title="" href="" class="btn btn-outline-success" data-toggle="tooltip"
                               data-original-title="Save to Wishlist"> <i class="fa fa-heart"></i>
                            </a>
                            <form action="/removerProdutoCarrinho.do" method="POST">
                                <input type="hidden" value="${produto.produto_id}" name="produto">
                                <button type="submit"
                                        class="btn btn-outline-danger d-xs-none d-sm-none d-md-inline d-lg-inline d-xl-inline">
                                    Excluir
                                </button>
                            </form>    
                            <a href="" class="btn btn-outline-danger d-xs-inline d-sm-inline d-md-none d-lg-none d-xl-none">
                                Ã—
                            </a>

                        </div>

                    </div>

                </c:forEach>

            </c:otherwise>
        </c:choose>

        <!--Valor total-->
        <div class="row pt-2 pb-0 px-md-5 px-sm-2 justify-content-center">
            <div class="bg-primary col-9 py-2 border-right">
                <p class="text-light text-right">Subtotal (<fmt:formatNumber value = "${carrinhoCompras.totalItems}" type = "currency"/>)</p>
                <a href="#">
                    <p class="text-light text-right">Comprar mais produtos</p>
                </a>
            </div>
            <div class="bg-primary col-3 py-2 px-2">
                <h5 class="text-light"><fmt:formatNumber value = "${carrinhoCompras.total}" type = "currency"/></h5>
                <button type="button" class="btn btn-warning btn-sm">Concluir compra</button>
            </div>
        </div>


    </div>

    <%@include file="componentes/rodape.jsp" %>
</body>

</html>
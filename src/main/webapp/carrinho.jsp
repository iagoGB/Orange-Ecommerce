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
            <div class="row justify-content-center">
                <div class="col-10">
                    <!-- Tabela de carrinho -->
                    <div class="card card-cascade narrower p-2" id="collapse-carrinho">
                        <div class="card-header bg-dark narrower py-3 mx-0 d-flex justify-content-start align-items-center">
                            <a href="" class="white-text mx-3">Carrinho de compras</a>
                        </div>
                        <div class="table-responsive p-3">
                        <table class="table table-hover table-bordered" id="dtcarrinho">
                            <thead class="thead-light">
                                <tr>

                                    <th scope="col">Foto</th>
                                    <th scope="col">Descrição</th>
                                    <th scope="col">Quantidade</th>
                                    <th scope="col">Preço unitário</th>
                                    <th scope="col">Preço total</th>
                                    <th scope="col">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${carrinhoCompras.itemCarrinhoList.size() < 1}">
                                    <div class="text-center align-middle">
                                        <p class="mt-2 mb-2 pt-2">Você não possui produtos no carrinho</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="produto" items="${carrinhoCompras.itemCarrinhoList}">
                                        <tr>
                                        <form action="/adicionarProdutoCarrinho.do" method="POST">
                                            <th class="align-middle text-center"><img src="exibirFotoProduto.do?foto=${produto.foto}" width="100" height="100" class="img-fluid my-3" alt="Responsive image"></th>

                                            <th class="align-middle text-center">
                                                <a href="produto.jsp">
                                                    <p class="text-dark">${produto.descricao}</p>
                                                </a>
                                                <input type="hidden" name="p" value="${produto.produto_id}">
                                            </th>
                                            <th class="align-middle text-center">
                                                <form class="form">
                                                    <input type="number" class="text-center form-control bg-light" value="${produto.quantidade}" name="qnt" onchange="this.form.submit()">
                                                </form>
                                            </th>
                                            <th class="align-middle text-center"><p class="text-dark"><fmt:formatNumber value = "${produto.precoUnitario}" type = "currency"/></p></th>
                                            <th class="align-middle text-center"><p class="text-dark"><fmt:formatNumber value = "${produto.precoTotal}" type = "currency"/></p></th>
                                        </form> 
                                        <th class="align-middle text-center">
                                            <button type="submit" class="btn btn-outline-success d-xs-none d-sm-none d-md-inline d-lg-inline d-xl-inline" data-toggle="tooltip"
                                                    data-original-title="Save to Wishlist"> <i class="fa fa-heart"></i>
                                            </button>
                                            <form action="/removerProdutoCarrinho.do" method="POST">
                                                <input type="hidden" value="${produto.produto_id}" name="produto">
                                                <button type="submit"
                                                        class="btn btn-outline-danger d-xs-none d-sm-none d-md-inline d-lg-inline d-xl-inline">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </th>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                        </div>
                    </div>

                </div>
            </div>
            <br>
            <div class="row justify-content-center">
                <div class="col-10">
                    <div class="row justify-content-end p-3 bg-dark">
                        <div class="col-5">
                            <h5 class="text-light text-right">Valor total do(s) ${carrinhoCompras.totalItems} item(ns): <fmt:formatNumber value = "${carrinhoCompras.total}" type = "currency"/></h5>
                        </div>
                    </div>
                    <div class="row justify-content-between p-3 bg-light">
                        <div class="col-8">
                            <button type="button" class="btn btn-dark btn-sm text-light">Continuar comprando</button>
                            
                        </div>
                        <div class="col-2"> 
                            <button type="button" class="btn btn-orange btn-sm text-light ml-auto">Concluir compra</button>  
                        </div>
                    </div>
                </div>
            </div>
        </div><br>

        <%@include file="componentes/rodape.jsp" %>
    </body>

</html>
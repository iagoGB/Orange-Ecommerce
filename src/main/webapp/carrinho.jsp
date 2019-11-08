<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
            <section>
                <div class="container-fluid py-4">
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
                            <p class="text-light my-auto py-3">Preço</p>
                        </div>
                        <div class="bg-primary col-3">
                            <p class="text-light my-auto py-3">Ação</p>
                        </div>
                    </div>
                    <!--produtos-->
                    <c:forEach var="produto" items="${produtoCompraLista}">
                        
                        <div class="row pt-3 pb-0 px-md-5 px-sm-2 border-bottom justify-content-center">

                            <div class="col-2">
                                <img src="exibirFotoProduto.do?foto=${produto.foto}" width="150" height="150" class="img-fluid my-3" alt="Responsive image">
                            </div>
                            <div class="col-3">
                                <a href="produto.jsp">
                                    <h5 class="text-dark">${produto.descricao}</h5>
                                </a>
                                <p class="text-dark">Descrição</p>
                            </div>
                            <div class="col-2">
                                <form class="form">
                                    <input type="text" readonly class="form-control bg-light">
                                </form>
                            </div>
                            <div class="col-2">
                                <p class="text-dark">${produto.preco}</p>
                            </div>
                            
                            <div class="col-3">
                                
                                <a title="" href="" class="btn btn-outline-success" data-toggle="tooltip"
                                   data-original-title="Save to Wishlist"> <i class="fa fa-heart"></i></a>
                                <a href="addCoockie${produto.produto_id}"
                                   class="btn btn-outline-danger d-xs-none d-sm-none d-md-inline d-lg-inline d-xl-inline"> Ã—
                                    Excluir</a>
                                <a href="" class="btn btn-outline-danger d-xs-inline d-sm-inline d-md-none d-lg-none d-xl-none">
                                    Ã—
                                </a>
                                
                            </div>
                            
                        </div>
                        
                    </c:forEach>

                    <!--Valor total-->
                    <div class="row pt-2 pb-0 px-md-5 px-sm-2 justify-content-center">
                        <div class="bg-primary col-9 py-2 border-right">
                            <p class="text-light text-right">Subtotal (1 item)</p>
                            <a href="#">
                                <p class="text-light text-right">Comprar mais produtos</p>
                            </a>
                        </div>
                        <div class="bg-primary col-3 py-2 px-2">
                            <h5 class="text-light">R$ 100</h5>
                            <button type="button" class="btn btn-warning btn-sm">Concluir compra</button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- RODAPÉ-->
        <%@include file="componentes/rodape.jsp" %>
    </body>

</html>
<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
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
                <!--Titulo-->
                <div class="row pt-5 pb-0 px-3">
                    <div class="col">
                        <span class="h4">Meus Favoritos</span>
                        <hr class="bg-dark">
                    </div>
                </div>
                <div class="row pt-3 pb-3 px-3">
                    <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                        <c:forEach var="p" items="${listaProduto}">
                            <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                                <div class="card border-dark h-100">
                                    <div class="p-2">
                                        <img class="card-img-top img-responsive" src="exibirFotoProduto.do?foto=${p.foto}" alt="Imagem de capa do card">
                                    </div>
                                    <div class="card-body">
                                        <a href="produto.jsp">
                                            <h5 class="card-title">${p.descricao}</h5>
                                            <p class="card-text"><fmt:formatNumber value = "${p.preco}" type = "currency"/></p>
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <a href="#" class="btn btn-outline-danger"><i class="fas fa-heart"></i></a>
                                        <a href="adicionarProdutoCarrinho.do?p=${p.produto_id}" class="btn btn-outline-success"><i class="fas fa-cart-plus"></i></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                </div>
            </div>
        </section>
    </div>
    
     <!-- RODAPÉ -->
    <%@include file="componentes/rodape.jsp" %>
</body>

</html>
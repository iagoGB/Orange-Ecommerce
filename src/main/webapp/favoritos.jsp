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
                        <div class="card border-warning">
                            <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                            <div class="card-body">
                                <a href="produto.html">
                                    <h5 class="card-title">Produto</h5>
                                </a>
                                <p class="card-text">Descrição</p>
                                <!-- <fmt:formatNumber value = "${p.preco}" type = "currency"/> -->
                                <p class="card-text">Preço</p>
                                <a href="#" class="btn btn-danger"><i class="fas fa-window-close"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                            </div>
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
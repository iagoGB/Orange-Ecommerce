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
                <div class="row pt-2 pb-0 px-md-5 px-sm-2 justify-content-center">
                    <div class="col-4 border-right">
                        <img class="card-img-top img-responsive" src="exibirFotoProduto.do?foto=${produto.foto}" alt="Imagem de capa do card">
                    </div>
                    <div class="col-8">
                        <article>
                            <h3 class="title mb-3">${produto.descricao}</h3>
                            <div class="mb-3">
                                <var class="price h3 text-warning">
                                    <p class="card-text"><fmt:formatNumber value = "${produto.preco}" type = "currency"/></p>
                                </var>
                            </div>
                            <hr>
                            <a href="#" class="btn btn-outline-danger"><i class="fas fa-heart"></i></a>
                            <a href="/adicionarProdutoCarrinho.do?p=${produto.produto_id}" class="btn btn-outline-success"><i class="fas fa-cart-plus"></i></a>
                        </article>
                    </div>



                </div>
            </div>
        </section>
    </div>
    <!-- RODAPÉ -->
    <%@include file="componentes/rodape.jsp" %>
        
    

</body>

</html>
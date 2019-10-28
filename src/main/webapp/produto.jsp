<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
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
                <div class="row pt-2 pb-0 px-md-5 px-sm-2 justify-content-center">
                    <div class="col-4 border-right">
                        <img src="img/img.jpg" class="img-fluid ml-auto" alt="Responsive image">
                    </div>
                    <div class="col-8">
                        <article>
                            <h3 class="title mb-3">Produto</h3>

                            <div class="mb-3">
                                <var class="price h3 text-warning">
                                    <span class="currency">R$</span><span class="num">1299</span>
                                </var>
                            </div>
                            <dl>
                                <dt>Descrição</dt>
                                <dd>
                                    <p>Here goes description consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                                        veniam,
                                        quis nostrud exercitation ullamco </p>
                                </dd>
                            </dl>
                            <div class="row">
                                <div class="col-sm-3">
                                    <dl class="dlist-inline">
                                        <dt>Quantidade</dt>
                                        <dd>
                                            <form class="form">
                                                <input type="text" readonly class="form-control bg-light">
                                            </form>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                            <hr>
                            <a href="#" class="btn  btn-warning text-light"> Comprar</a>
                            <a href="#" class="btn  btn-outline-primary"> <i class="fas fa-shopping-cart"></i>
                                Adicionar ao carrinho </a>
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
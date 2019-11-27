<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <%@include file="../componentes/head.jsp" %>
</head>

<body>
    <!-- CABEÇALHO -->
    <header>
        <%@include file="../componentes/cabecalho.jsp" %>
    </header>

    <div class="content">
        <section>
            <div class="container-fluid">
                <div class="row py-3 px-3">
                    <%@include file="../componentes/navMenu.jsp" %>
                    <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
                        <%@include file="../componentes/clientedados.jsp" %>
                        <%@include file="../componentes/clientehistorico.jsp" %>
                        <!-- Botão para acionar modal -->
                        <button hidden="true" id="hidden-button" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalExemplo">
                            Abrir modal de demonstração
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Parabéns!</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p class="text-sucess text-center align-middle">Sua compra foi efetivada com sucesso!
                                            Seu pedido chegará entre os dias 07 de Dezembro e 12 de Dezembro</p>
                                        <p class="text-sucess text-center align-middle">Veja no menu "gerenciar minhas compras" para mais detalhes!</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
       
                                    </div>
                                </div>
                            </div>
                        </div>
<!--                        <div class="alert alert-success" role="alert">
                            <h4 class="alert-heading">Muito bem! Sua compra foi efetivada.</h4>
                            
                        </div>
                        <div class="alert alert-danger" role="alert">
                            <h4 class="alert-heading">Que pena! Sua compra não foi efetivada.</h4>
                            
                            <hr>
                            <p class="mb-0">Produto(s) em falta no estoque.</p>
                        </div>-->
                    </div>

                </div>
            </div>
        </section>
    </div>

    <!-- RODAPÉ -->
    <%@include file="componentes/rodape.jsp" %>
    <c:choose>
        <c:when test="${not empty congratulations}">
            <script>
                
                setTimeout(
                    function() {
                        document.getElementById("hidden-button").click();
                    }, 100
                );

            </script>
        </c:when>
    </c:choose>

</body>

</html>

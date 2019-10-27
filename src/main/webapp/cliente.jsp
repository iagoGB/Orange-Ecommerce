<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

    <%@include file="componentes/head.jsp" %>

    <body>
        <!------------------------------------- CABE«ALHO ----------------------------------------------------->
        <%@include file="componentes/cabecalho.jsp" %>
        <div class="content">
            <section>
                <div class="container-fluid">
                    <div class="row py-3 px-3">
                        <div class="col-lg-3 col-md-4 col-sm-3 col-12 p-3 mx-auto order-2 order-sm-1">
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-dadoscliente">Meus
                                dados</button>

                            <button type="button" class="btn btn-outline-dark btn-block mx-0"
                                    id="btn-minhascompras">Gerenciar minhas
                                compras</button>
                        </div>
                        <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
                            <!-- SÛ exibe  a mensagem se os dados forem atualizados -->
                            <c:if test="${not empty feedbackAtualizacao}" >
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <p class="alert-sucess">${feedbackAtualizacao}</p>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                             <!-- SÛ exibe  a mensagem se houver erro ao atualizar os dados -->
                            <c:if test="${ not empty feedbackAtualizacaoNegativa }" >
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <p class="alert-danger">${ feedbackAtualizacaoNegativa }</p>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            <!-- SÛ exibe  a mensagem se os dados forem excluidos e ocorrer erro -->
                            <c:if test="${not empty feedbackExclusao}" >
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <p class="text-danger">${feedbackExclusao}</p>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </c:if>
                            <!-- Meus Dados  -->
                            <div class="card card-cascade narrower d-none" id="collapse-dadoscliente">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Meus dados</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#alterarminhaconta">
                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluirminhaconta">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>
                                
                                <form class="py-3 mx-4">
                                    <div class="form-group">
                                        <label for="exampleInputNome1">Nome Completo</label>
                                        <input type="nome" class="form-control" id="exampleInputNome1"
                                               placeholder="Nome do cliente" value="${usuario.nome}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEndereco1">EndereÁo</label>
                                        <input type="endereco" class="form-control" id="exampleInputEndereco1"
                                               placeholder="EndereÁo do cliente" value="${usuario.endereco}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">EndereÁo de email</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1"
                                               aria-describedby="emailHelp" placeholder="Email do cliente" value="${usuario.email} " disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputLogin1">Login</label>
                                        <input type="login" class="form-control" id="exampleInputLogin1"
                                               placeholder="Login do cliente" value="${usuario.login}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Senha</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1"
                                               placeholder="Senha do cliente" value="${usuario.senha}" disabled>
                                    </div>

                                </form>

                            </div>
                            <!-- Alterar conta -->
                            <div class="modal fade" id="alterarminhaconta" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Alterar meus dados</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="/atualizarUsuario.do" method="POST">
                                            <div class="modal-body">                               
                                                <input type="hidden" name="usuario_id" value="${usuario.usuario_id}"/>
                                                <label for="textInput">Informe um novo nome completo</label>
                                                <input type="text" id="textInput" class="form-control mb-4" name="attNome" value="${usuario.nome}">
                                                <label for="textInput">Informe um novo endere√ßo</label>
                                                <input type="text" id="textInput" class="form-control mb-4" name="attEndereco" value="${usuario.endereco}">
                                                <label for="textInput">Informe um novo email</label>
                                                <input type="text" id="textInput" class="form-control mb-4" name="attEmail" value="${usuario.email}">
                                                <label for="textInput">Informe um novo login</label>
                                                <input type="text" id="textInput" class="form-control mb-4" name="attLogin" value="${usuario.login}">
                                                <label for="textInput">Informe uma nova senha</label>
                                                <input type="text" id="textInput" class="form-control mb-4" name="attSenha" value="${usuario.senha}">
                                                <label for="textInput">Repita a nova senha</label>
                                                <input type="text" id="textInput" class="form-control mb-4" name="attSenhaConfirm" value="${usuario.senha}">

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                                <button type="submit" class="btn btn-dark">Salvar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Remover conta -->
                            <div class="modal fade" id="excluirminhaconta" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Excluir conta</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="/deletarUsuario.do" method="POST">
                                            <input type="hidden" value="${usuario.usuario_id}" name="usuario_id"/>
                                            <div class="modal-body">
                                                <p>Deseja excluir sua conta?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">N„o</button>
                                                <input type="submit" class="btn btn-dark" value="Sim">
                                            </div>
                                            
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Meu Hist√≥rico de compras -->
                            <div class="card card-cascade narrower d-none" id="collapse-meuhistorico">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Meu hist√≥rico de compras</a>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtmeuhistorico">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Data</th>
                                                <th scope="col">Pre√ßo</th>
                                                <th scope="col">Produto(s)</th>
                                                <th scope="col">Quantidade(s)</th>
                                                <th scope="col">Valor da compra</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>


                            </div>


                        </div>
                    </div>

                </div>
        </div>
    </section>
</div>
<!------------------------------------- RODAP… ----------------------------------------------------->

<%@include file="componentes/rodape.jsp" %>

</body>

</html>
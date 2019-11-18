<%-- 
    Document   : clientedados
    Created on : 18/11/2019, 15:33:14
    Author     : Caique
--%>
<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Só exibe  a mensagem se os dados forem atualizados -->
<c:if test="${not empty feedbackAtualizacao}" >
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <p class="alert-sucess">${feedbackAtualizacao}</p>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<!-- Só exibe  a mensagem se houver erro ao atualizar os dados -->
<c:if test="${ not empty feedbackAtualizacaoNegativa }" >
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <p class="alert-danger">${ feedbackAtualizacaoNegativa }</p>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<!-- Só exibe  a mensagem se os dados forem excluidos e ocorrer erro -->
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
            <label for="exampleInputNome1"><b>Nome Completo: </b>${usuario.nome}</label>

        </div>
        <div class="form-group">
            <label for="exampleInputEndereco1"><b>Endereço: </b>${usuario.endereco}</label>

        </div>
        <div class="form-group">
            <label for="exampleInputEmail1"><b>Email: </b>${usuario.email}</label>

        </div>
        <div class="form-group">
            <label for="exampleInputLogin1"><b>Login: </b>${usuario.login}</label>

        </div>
        <div class="form-group">
            <label for="exampleInputPassword1"><b>Senha: </b>${usuario.senha}</label>

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
                    <label for="textInput">Informe um novo endereço</label>
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
                    <p>Deseja realmente <strong style="color:red">EXCLUIR<strong> sua conta?</p>
                                <p>1 - Seus dados serão excluidos da aplicação</p>
                                <p>2 - Você será  <strong style="color:red">deslogado</strong> automaticamente </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                    <input type="submit" class="btn btn-dark" value="Sim">
                                </div>

                                </form>
                                </div>
                                </div>
                                </div>
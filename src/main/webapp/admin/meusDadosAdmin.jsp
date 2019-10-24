<%-- 
    Document   : meusDadosAdmin
    Created on : 22/10/2019, 15:38:30
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
    <!-- Meus Dados  -->
    <div class="card card-cascade narrower d-none" id="collapse-dadosadmin">
        <div
            class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
            <a href="" class="white-text mx-3">Meus dados</a>
            <div class="ml-auto mr-2">
                <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                        data-toggle="modal" data-target="#alterarconta">
                    <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                </button>
                <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                        data-toggle="modal" data-target="#excluirconta">
                    <i class="fas fa-trash-alt fa-2x mt-0"></i>
                </button>
            </div>
        </div>
        <form class="py-3 mx-4">
            <div class="form-group">
                <label for="exampleInputNome1">Nome Completo</label>
                <input type="nome" class="form-control" id="exampleInputNome1"
                       placeholder="Nome do cliente">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Endereço de email</label>
                <input type="email" class="form-control" id="exampleInputEmail1"
                       aria-describedby="emailHelp" placeholder="Email do cliente">
            </div>
            <div class="form-group">
                <label for="exampleInputLogin1">Login</label>
                <input type="login" class="form-control" id="exampleInputLogin1"
                       placeholder="Login do cliente">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Senha</label>
                <input type="password" class="form-control" id="exampleInputPassword1"
                       placeholder="Senha do cliente">
            </div>

        </form>

    </div>
    <!-- Alterar conta -->
    <div class="modal fade" id="alterarconta" tabindex="-1" role="dialog"
         aria-labelledby="TituloModalCentralizado" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="TituloModalCentralizado">Alterar meus dados</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label for="textInput">Informe um novo nome completo</label>
                    <input type="text" id="textInput" class="form-control mb-4">
                    <label for="textInput">Informe um novo email</label>
                    <input type="text" id="textInput" class="form-control mb-4">
                    <label for="textInput">Informe um novo login</label>
                    <input type="text" id="textInput" class="form-control mb-4">
                    <label for="textInput">Informe uma nova senha</label>
                    <input type="text" id="textInput" class="form-control mb-4">
                    <label for="textInput">Repita a nova senha</label>
                    <input type="text" id="textInput" class="form-control mb-4">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-dark">Salvar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Remover conta -->
    <div class="modal fade" id="excluirconta" tabindex="-1" role="dialog"
         aria-labelledby="TituloModalCentralizado" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="TituloModalCentralizado">Excluir conta</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Deseja excluir sua conta?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                    <button type="button" class="btn btn-dark">Sim</button>
                </div>
            </div>
        </div>

    </div>
</div>

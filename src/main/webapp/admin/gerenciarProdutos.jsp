<%-- 
    Document   : GerenciarProdutos
    Created on : 28/10/2019, 12:06:01
    Author     : iago.barreto
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <jsp:include page="../componentes/head.jsp" />
    </head>

    <body>
        <header>
            <jsp:include page="../componentes/cabecalhoAdmin.jsp" />
        </header>

        <div class="content">

            <section>

                <div class="container-fluid">

                    <div class="row py-3 px-3">
                        <jsp:include page="../componentes/navMenuAdmin.jsp" />
                        <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
                            <!-- Listar produtos -->
                            <div class="card card-cascade narrower d-none" id="collapse-produtos">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Produtos no estoque</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#inserirprod">
                                            <i class="fas fa-plus-circle fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#alterarprod">
                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluirprod">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtprodutos">
                                        <thead class="thead-light">
                                            <tr>
                                                <th></th>
                                                <th scope="col">Foto</th>
                                                <th scope="col">Descrição</th>
                                                <th scope="col">Preço</th>
                                                <th scope="col">Quantidade</th>
                                                <th scope="col">Categoria(s)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>                                           
                                        </tbody>
                                    </table>
                                </div>
                                <!-- Alterar produto -->
                                <div class="modal fade" id="alterarprod" tabindex="-1" role="dialog"
                                     aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="TituloModalCentralizado">Alterar produto</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <label for="textInput">Informe uma nova descrição</label>
                                                <input type="text" id="textInput" class="form-control mb-4">

                                                <label for="textInput">Atualize a imagem do
                                                    produto</label>
                                                <div class="input-group mb-3">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                        <label class="custom-file-label" for="inputGroupFile02"
                                                               aria-describedby="inputGroupFileAddon02"></label>
                                                    </div>
                                                    <div class="input-group-append">
                                                        <span class="input-group-text"
                                                              id="inputGroupFileAddon02">Carregar</span>
                                                    </div>
                                                </div>

                                                <label for="textInput">Informe um novo preço</label>
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">R$</span>
                                                    </div>
                                                    <input type="text" class="form-control" aria-label="Quantia">
                                                </div>

                                                <label for="customRange3">Informe a nova quantidade no estoque: </label>
                                                <input type="text" class="form-control" aria-label="Quantidade">
                                                <input type="range" class="custom-range" min="0" max="100" step="1"
                                                       id="customRange3">

                                                <label for="select">Escolha a(s) nova(s) categoria(s)</label>
                                                <div class="input-group">
                                                    <select class="custom-select" id="inputGroupSelect01" multiple size="3">
                                                        <option value="1">Um</option>
                                                        <option value="2">Dois</option>
                                                        <option value="3">Três</option>
                                                        <option value="4">Quatro</option>
                                                        <option value="5">Cinco</option>
                                                        <option value="6">Seis</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                                <button type="button" class="btn btn-dark">Salvar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Remover produto -->
                                <div class="modal fade" id="excluirprod" tabindex="-1" role="dialog"
                                     aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="TituloModalCentralizado">Remover produto</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Deseja remover esse(s) produto(s) do estoque?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                                <button type="button" class="btn btn-dark">Sim</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Inserir novo produto -->
                            <div class="modal fade" id="inserirprod" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Inserir produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="textInput">Informe uma descrição</label>
                                            <input type="text" id="textInput" class="form-control mb-4">

                                            <label for="textInput">Adicione uma imagem ao
                                                produto</label>
                                            <div class="input-group mb-3">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                    <label class="custom-file-label" for="inputGroupFile02"
                                                           aria-describedby="inputGroupFileAddon02"></label>
                                                </div>
                                                <div class="input-group-append">
                                                    <span class="input-group-text"
                                                          id="inputGroupFileAddon02">Carregar</span>
                                                </div>
                                            </div>

                                            <label for="textInput">Informe um preço</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">R$</span>
                                                </div>
                                                <input type="text" class="form-control" aria-label="Quantia">
                                            </div>

                                            <label for="customRange3">Quantidade no estoque: </label>
                                            <input type="text" class="form-control" aria-label="Quantidade">
                                            <input type="range" class="custom-range" min="0" max="100" step="1"
                                                   id="customRange3">

                                            <label for="select">Escolha a(s) categoria(s)</label>
                                            <div class="input-group">
                                                <select class="custom-select" id="inputGroupSelect01" multiple size="3">
                                                    <option value="1">Um</option>
                                                    <option value="2">Dois</option>
                                                    <option value="3">Três</option>
                                                    <option value="4">Quatro</option>
                                                    <option value="5">Cinco</option>
                                                    <option value="6">Seis</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                        </section>

                    </div>
                    <jsp:include page="../componentes/rodape.jsp" />

                    </body>

                    </html>

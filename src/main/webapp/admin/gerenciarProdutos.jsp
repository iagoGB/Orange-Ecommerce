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
                                                <th scope="col">Ações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="produto" items="${listaProdutos}">
                                                <tr>
                                                    <td></td>
                                                    <td><img src="exibirFotoProduto.do?foto=${produto.foto}" width="100px"></td>
                                                    <td>${produto.descricao}</td>
                                                    <td>R$ ${produto.preco}</td>
                                                    <td>${produto.quantidade}</td>
                                                    <!-- Bugando? -->
                                                    <td>${produto.listaCategorias[0].categoria.descricao}</td>

                                                    <td>
                                                        <!--Para cada produto crie um botão editar -->
                                                        <button type="button" class="btn btn-danger btn-rounded btn-sm px-2"
                                                                data-toggle="modal" data-target="#alterarprod-${produto.produto_id}">
                                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                                        </button>
                                                        <!--Para cada produto crie um botão excluir -->
                                                        <button type="button" class="btn btn-danger btn-rounded btn-sm px-2"
                                                                data-toggle="modal" data-target="#excluirprod-${produto.produto_id}">
                                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                                        </button>  
                                                        <!--Para cada produto um formulário para editar -->
                                                        <!-- Alterar produto -->
                                                        <form action="/atualizarProduto.do" method="POST">
                                                            <div class="modal fade" id="alterarprod-${produto.produto_id}" tabindex="-1" role="dialog"
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
                                                                            <input type="hidden" name="produto_id" value="${produto.produto_id }"/>
                                                                            <input type="text" id="textInput" class="form-control mb-4" name="novaDescricao" value="${produto.descricao}">

                                                                            <label for="textInput">Atualize a imagem do
                                                                                produto</label>
                                                                            <div class="input-group mb-3">
                                                                                <div class="custom-file">
                                                                                    <input type="file" class="custom-file-input" id="inputGroupFile02" name="imagem" value="${produto.foto}">
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
                                                                                <input type="text" class="form-control" aria-label="Quantia" name="preco" value="${produto.preco}">
                                                                            </div>

                                                                            <label for="customRange3">Informe a nova quantidade no estoque: </label>
                                                                            <input type="text" class="form-control" aria-label="Quantidade" name="quantidade" value="${produto.quantidade}">
                                                                            <input type="range" class="custom-range" min="0" max="100" step="1"
                                                                                   id="customRange3">

                                                                            <label for="select">Escolha a nova categoria</label>
                                                                            <div class="input-group">
                                                                                <select class="custom-select" id="inputGroupSelect01" multiple size="3">
                                                                                    <c:forEach var="categoria" items="${listaCategorias}">
                                                                                        <option value="${categoria.categoria_id}">${categoria.descricao}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                                                            <button type="submit" class="btn btn-dark">Salvar</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <!--Para cada produto um formulário para excluir -->
                                                        <!-- Remover produto -->
                                                        <form action="/excluirProduto.do" method="POST">                                   
                                                            <div class="modal fade" id="excluirprod-${produto.produto_id}" tabindex="-1" role="dialog"
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
                                                                            <input type="hidden" name="produto_id" value="${produto.produto_id }"/>
                                                                            <input type="hidden" name="imagem" value="${produto.foto }"/>
                                                                            <input type="hidden" name="descricao" value="${produto.descricao }"/>
                                                                            <input type="hidden" name="preco" value="${produto.preco }"/>
                                                                            <input type="hidden" name="quantidade" value="${produto.quantidade }"/>
                                                                            <p>Deseja remover esse produto do estoque ${produto.descricao}?</p>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                                                            <button type="submit" class="btn btn-dark">Sim</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </td>
                                                </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- Inserir novo produto -->
                            <div class="modal fade" id="inserirprod" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">


                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="TituloModalCentralizado">Inserir produto</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    
                                    
                                    <form action="adicionarProduto.do" method="POST" enctype="multipart/form-data">

                                        <div class="modal-body">
                                            <label for="textInput">Informe uma descrição</label>
                                            <input type="text" id="textInput" class="form-control mb-4" name="novoProduto">
                                            <!-- Implementar sistema de upload -->
                                            <label for="textInput">Adicione uma imagem ao
                                                produto</label>
                                            <div class="input-group mb-3">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="inputGroupFile02" name="imagem" value="img/img.jpg">
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
                                                <input type="text" class="form-control" aria-label="Quantia" name="preco">
                                            </div>

                                            <label for="customRange3">Quantidade no estoque: </label>
                                            <input type="text" class="form-control" aria-label="Quantidade" name="quantidade">
                                            <input type="range" class="custom-range" min="0" max="100" step="1"
                                                   id="customRange3">

                                            <label for="select">Escolha a(s) categoria(s)</label>
                                            <div class="input-group">
                                                <select class="browser-default custom-select dropdown-primary" id="inputGroupSelect01" name="categoria" multiple size="3">
                                                    <c:forEach var="categoria" items="${listaCategorias}">
                                                        <option value="${categoria.categoria_id}">${categoria.descricao}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="submit" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </form>
                                </div>

                            </div>

                </div>

            </section>

        </div>

        <jsp:include page="../componentes/rodape.jsp" />

    </body>

</html>

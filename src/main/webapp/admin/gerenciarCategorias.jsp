<%-- 
    Document   : gerenciarCategorias
    Created on : 24/10/2019, 15:52:35
    Author     : aluno
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

                            <!-- Listar categorias -->
                            <div class="card card-cascade narrower d-none" id="collapse-categorias">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Categorias</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#inserircat">
                                            <i class="fas fa-plus-circle fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtcategorias">
                                        <thead class="thead-light">
                                            <tr>

                                                <th class="align-middle text-center">Id</th>
                                                <th class="align-middle text-center" scope="col">Descrição</th>
                                                <th class="align-middle text-center" scope="col">Ações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="categoria" items="${listaCategorias}">
                                                <tr>

                                                    <td class="align-middle text-center">${categoria.categoria_id}</td>
                                                    <td class="align-middle text-center">${categoria.descricao}</td>

                                                    <td class="align-middle text-center">
                                                        <!--Para cada categoria crie um botão editar -->
                                                        <button type="button" class="btn  btn-danger btn-rounded btn-sm px-2"
                                                                data-toggle="modal" data-target="#alterarcat-${categoria.categoria_id}">
                                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                                        </button>
                                                        <!--Para cada categoria crie um botão excluir -->
                                                        <button type="button" class="btn  btn-danger btn-rounded btn-sm px-2"
                                                                data-toggle="modal" data-target="#excluircat-${categoria.categoria_id}">
                                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                                        </button>
                                                        <!--Para cada categoria um formulário para editar -->
                                                        <form action="/atualizarCategoria.do" method="POST" class="needs-validation" novalidate>

                                                            <!-- Alterar categoria -->
                                                            <div class="modal fade" id="alterarcat-${categoria.categoria_id}" tabindex="-1" role="dialog"
                                                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="TituloModalCentralizado">Alterar categoria</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <label for="textInput">Informe uma nova descrição</label>
                                                                            <input type="hidden" name="categoria_id" value="${categoria.categoria_id }"/>
                                                                            <input type="text" id="validationCustom01" required class="form-control mb-4" name="novaDescricao" value="${categoria.descricao}">
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                                                            <button type="submit" class="btn btn-dark">Salvar</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </form>    
                                                        <!--Para cada categoria crie um formulário para excluir -->
                                                        <form action="/excluirCategoria.do" method="POST">


                                                            <!-- Excluir categoria -->
                                                            <div class="modal fade" id="excluircat-${categoria.categoria_id}" tabindex="-1" role="dialog"
                                                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">

                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="TituloModalCentralizado">Excluir Categoria</h5>   
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">   
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <input type="hidden" name="categoria_id" value="${categoria.categoria_id }"/>
                                                                            <label for="textInput">Tem certeza que deseja excluir a categoria ${categoria.descricao}?</label>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                                                            <input type="submit" class="btn btn-dark" value="Excluir">
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>


                                                        </form>                                     
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <!-- Inserir nova categoria -->
                            <form action="/inserirCategoria.do" method="POST" class="needs-validation" novalidate>
                                <div class="modal fade" id="inserircat" tabindex="-1" role="dialog"
                                     aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <h5 class="modal-title" id="TituloModalCentralizado">Inserir categoria</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <label for="textInput">Informe uma descrição</label>
                                                <input type="text" id="validationCustom01" required class="form-control mb-4" name="novaCategoria">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                                <button type="submit" class="btn btn-dark">Salvar</button>
                                            </div>

                                        </div>
                                    </div>
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




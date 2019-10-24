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

                        <!-- Inserir nova categoria -->
                      <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
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
                                        <input type="text" id="textInput" class="form-control mb-4">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                        <button type="button" class="btn btn-dark">Salvar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Alterar categoria -->
                        <div class="modal fade" id="alterarcat" tabindex="-1" role="dialog"
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
                                        <input type="text" id="textInput" class="form-control mb-4">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                        <button type="button" class="btn btn-dark">Salvar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Remover categoria -->
                        <div class="modal fade" id="excluircat" tabindex="-1" role="dialog"
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
                                        <p>Deseja remover essa(s) categoria(s)?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                        <button type="button" class="btn btn-dark">Sim</button>
                                    </div>
                                </div>
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




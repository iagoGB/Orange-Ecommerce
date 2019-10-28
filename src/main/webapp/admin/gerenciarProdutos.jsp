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

            </section>

        </div>
        <jsp:include page="../componentes/rodape.jsp" />

    </body>

</html>

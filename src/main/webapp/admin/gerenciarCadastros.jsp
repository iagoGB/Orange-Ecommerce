<%-- 
    Document   : homeAdmin
    Created on : 22/10/2019, 15:49:18
    Author     : Iago Gomes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include file="../componentes/head.jsp" %>
    </head>

    <body>
        <header>
            <%@include file="../componentes/cabecalhoAdmin.jsp" %>
        </header>

        <div class="content">

            <section>

                <div class="container-fluid">

                    <div class="row py-3 px-3">
                        <%@include file="../componentes/navMenuAdmin.jsp" %>
                        <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
                            <!-- Gerenciar clientes -->
                            <div class="card card-cascade narrower" id="collapse-cadastros">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Clientes</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluircadastros">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtcadastros">
                                        <thead class="thead-light">
                                            <tr>
                                                
                                                <th scope="col">Nome</th>
                                                <th scope="col">Endereço</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Login</th>
                                                <th scope="col">Senha</th>

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
                            <!-- Remover clientes -->
                            <div class="modal fade" id="excluircadastros" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Remover cliente(s)</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja remover esse(s) clientes(s)?</p>
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
        <%@include file="../componentes/rodape.jsp" %>

    </body>

</html>

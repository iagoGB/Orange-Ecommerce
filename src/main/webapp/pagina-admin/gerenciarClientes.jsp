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
        <jsp:include page="head.jsp" />
    </head>

    <body>
        <header>
            <jsp:include page="cabecalhoAdmin.jsp" />
        </header>

        <div class="content">

            <section>

                <div class="container-fluid">

                    <div class="row py-3 px-3">
                        <jsp:include page="navMenuAdmin.jsp" />
                        <!-- Gerenciar clientes -->
                        <div class="card card-cascade narrower d-none" id="collapse-cadastros">
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
                                            <th></th>
                                            <th scope="col">Nome</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Login</th>
                                            <th scope="col">Senha</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                            <td>#</td>
                                        </tr>
                                        <tr>
                                            <td></td>
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

            </section>

        </div>
        <jsp:include page="rodapeAdmin.jsp" />

    </body>

</html>




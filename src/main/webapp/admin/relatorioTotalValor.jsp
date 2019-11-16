<%-- 
    Document   : totalValor
    Created on : 28/10/2019, 16:23:33
    Author     : Caique Sampaio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                            <!-- Relatório: Total de valor recebido por dia -->
                            <div class="card card-cascade narrower d-none" id="collapse-relatorio3">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Total de valor recebido por dia</a>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtrelatorio3">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Data</th>
                                                <th scope="col">Valor total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>#</td>
                                                <!-- <fmt:formatNumber value = "${produto.preco}" type = "currency"/> -->
                                                <td>#</td>
                                            </tr>
                                            <tr>
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
            </section>

        </div>
        <%@include file="../componentes/rodape.jsp" %>

    </body>

</html>

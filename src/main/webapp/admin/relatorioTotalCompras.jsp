<%-- 
    Document   : homeAdmin
    Created on : 22/10/2019, 15:49:18
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
                            <!-- Relatório: Total de compras por cliente e por período -->
                            <div class="card card-cascade narrower d-none" id="collapse-relatorio1">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Total de compras por cliente e por período</a>
                                </div>
                                <div class="row justify-content-center">
                                <form action="/listarTotalCompras.do" method="POST">
                                    <div class="form-row align-items-center">
                                        <div class="col-sm-3 my-1">
                                            
                                            <input type="date" class="form-control" id="inlineFormInputName" placeholder="data inicial" name="inicio">
                                        </div>
                                        <div class="col-sm-3 my-1">
                                            <input type="date" class="form-control" id="inlineFormInputName" placeholder="data final" name="fim">
                                        </div>
                                        
                                        <div class="col-auto my-1">
                                            <button type="submit" class="btn btn-orange">Filtrar</button>
                                        </div>
                                    </div>
                                </form>
                                </div>
                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtrelatorio1">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Id</th>
                                                <th scope="col">Cliente</th>
                                                <th scope="col">Compras</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="tcc" items="${totalComprasClientesList}">
                                                <tr>
                                                    <td>${tcc.getUsuario_id()}</td>
                                                    <td>${tcc.getUsuario_nome()}</td>
                                                    <td>${tcc.getQuantidadeCompras()}</td>
                                                </tr>
                                            </c:forEach>

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

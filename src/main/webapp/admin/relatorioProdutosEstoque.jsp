<%-- 
    Document   : produtosEstoque
    Created on : 28/10/2019, 16:21:46
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
                            <!-- Relatório: Produtos faltando em estoque -->
                            <div class="card card-cascade narrower d-none" id="collapse-relatorio2">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Produtos faltando em estoque</a>
                                    <form action="/XLSDownload.do">
                                        <button type="submit" class="btn btn-outline-white btn-rounded btn-sm px-2 waves-effect waves-light btn-sm px-2">
                                                                
                                                <i class="fas fa-download fa-2x mt-0"></i>
                                        </button>
                                    </form>
                                    
                         
                                    i
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtrelatorio2">
                                        <thead class="thead-light">
                                            <tr>
                                                <th scope="col">Id</th>
                                                <th scope="col">Descrição</th>
                                                <th scope="col">Preço</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="produto" items="${listaProdutosEstoque}">
                                                <tr>
                                                    <td class="text-center align-middle">${produto.produto_id}</td>
                                                    <td class="text-center align-middle">${produto.descricao}</td>
                                                    <td class="text-center align-middle"><fmt:formatNumber value = "${produto.preco}" type = "currency"/></td>
                                                    
                                                        

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

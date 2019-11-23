<%-- 
    Document   : clientehistorico
    Created on : 18/11/2019, 15:34:33
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Meu Histórico de compras -->
<div class="card card-cascade narrower d-none" id="collapse-meuhistorico">
    <div
        class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
        <a href="" class="white-text mx-3">Meu histórico de compras</a>
    </div>

    <div class="table-responsive p-3">
        <table class="table table-hover table-bordered" id="dtmeuhistorico">
            <thead class="thead-light">
                <tr>
                    <th class="align-middle text-center" scope="col">Data</th>
                    <th class="align-middle text-center" scope="col">Preço</th>
                    <th class="align-middle text-center"scope="col">Produto(s)</th>
                    <th class="align-middle text-center" scope="col">Quantidade(s)</th>
                    <th class="align-middle text-center" scope="col">Valor da compra</th>

                </tr>
            </thead>
            <tbody>

                <c:forEach var="compra" items="${ usuario.compras }">
                    <tr>
                        <td class="align-middle text-center">${compra.compra_id}</td>
                        <td class="align-middle text-center">${compra.data_compra}</td>

                        <td class="align-middle text-center">

                            <c:forEach var="produtoCompra" items="${compra.produtos}">
                                ${ produtoCompra.produto.descricao } <br/>
                            </c:forEach>

                        </td>

                        <td class="align-middle text-center">
                            <c:forEach var="produtoCompra" items="${compra.produtos}">
                                ${ produtoCompra.quantidade } <br/>
                            </c:forEach>
                        </td>

                        <td class="align-middle text-center">

                            <c:forEach var="produtoCompra" items="${compra.produtos}">

                                ${produtoCompra.produto.preco * produtoCompra.quantidade } <br/>

                            </c:forEach>  

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>


</div>
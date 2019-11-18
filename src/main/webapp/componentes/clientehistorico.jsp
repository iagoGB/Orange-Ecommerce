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
                    <th scope="col">Data</th>
                    <th scope="col">Preço</th>
                    <th scope="col">Produto(s)</th>
                    <th scope="col">Quantidade(s)</th>
                    <th scope="col">Valor da compra</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#</td>
                    <td>#</td>
                    <!--<td><fmt:formatNumber value = "${p.preco}" type = "currency"/></td>-->
                    <td>#</td>
                    <td>#</td>
                    <td>#</td>
                </tr>

            </tbody>
        </table>
    </div>


</div>




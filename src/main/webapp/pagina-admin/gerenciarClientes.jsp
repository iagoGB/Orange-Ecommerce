<%-- 
    Document   : gerenciarClientes
    Created on : 22/10/2019, 15:43:35
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
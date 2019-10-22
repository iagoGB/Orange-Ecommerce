<%-- 
    Document   : meusDadosAdmin
    Created on : 22/10/2019, 15:38:30
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
    <!-- Meus Dados  -->
    <div class="card card-cascade narrower d-none" id="collapse-dadosadmin">
        <div
            class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
            <a href="" class="white-text mx-3">Meus dados</a>
            <div class="ml-auto mr-2">
                <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                        data-toggle="modal" data-target="#alterarconta">
                    <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                </button>
                <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                        data-toggle="modal" data-target="#excluirconta">
                    <i class="fas fa-trash-alt fa-2x mt-0"></i>
                </button>
            </div>
        </div>

        <!--  FORMULARIO PARA ALTERAR DADOS  -->
        <c:import url="formMeusDadosAdmin.jsp" />

    </div>

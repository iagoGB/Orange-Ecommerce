<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/w/bs4/jq-3.3.1/jszip-2.5.0/dt-1.10.18/af-2.3.3/b-1.5.6/b-colvis-1.5.6/b-flash-1.5.6/b-html5-1.5.6/b-print-1.5.6/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-2.0.0/sl-1.3.0/datatables.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" type="text/css" href="css/mdb.min.css">
    <!--CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Cliente</title>
</head>

<body>
    <!------------------------------------- CABE�ALHO ----------------------------------------------------->
   	<c:import url="cabecalho.jsp" />
    <div class="content">
        <section>
            <div class="container-fluid">
                <div class="row py-3 px-3">
                    <div class="col-lg-3 col-md-4 col-sm-3 col-12 p-3 mx-auto order-2 order-sm-1">
                        <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-dadoscliente">Meus
                            dados</button>

                        <button type="button" class="btn btn-outline-dark btn-block mx-0"
                            id="btn-minhascompras">Gerenciar minhas
                            compras</button>
                    </div>
                    <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
                        <!-- Meus Dados  -->
                        <div class="card card-cascade narrower d-none" id="collapse-dadoscliente">
                            <div
                                class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                <a href="" class="white-text mx-3">Meus dados</a>
                                <div class="ml-auto mr-2">
                                    <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                        data-toggle="modal" data-target="#alterarminhaconta">
                                        <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                        data-toggle="modal" data-target="#excluirminhaconta">
                                        <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                    </button>
                                </div>
                            </div>
                            <form class="py-3 mx-4">
                                <div class="form-group">
                                    <label for="exampleInputNome1">Nome Completo</label>
                                    <input type="nome" class="form-control" id="exampleInputNome1"
                                        placeholder="Nome do cliente">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEndereco1">Endereço</label>
                                    <input type="endereco" class="form-control" id="exampleInputEndereco1"
                                        placeholder="Endereço do cliente">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Endereço de email</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1"
                                        aria-describedby="emailHelp" placeholder="Email do cliente">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputLogin1">Login</label>
                                    <input type="login" class="form-control" id="exampleInputLogin1"
                                        placeholder="Login do cliente">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Senha</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1"
                                        placeholder="Senha do cliente">
                                </div>

                            </form>

                        </div>
                        <!-- Alterar conta -->
                        <div class="modal fade" id="alterarminhaconta" tabindex="-1" role="dialog"
                            aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="TituloModalCentralizado">Alterar meus dados</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <label for="textInput">Informe um novo nome completo</label>
                                        <input type="text" id="textInput" class="form-control mb-4">
                                        <label for="textInput">Informe um novo endereço</label>
                                        <input type="text" id="textInput" class="form-control mb-4">
                                        <label for="textInput">Informe um novo email</label>
                                        <input type="text" id="textInput" class="form-control mb-4">
                                        <label for="textInput">Informe um novo login</label>
                                        <input type="text" id="textInput" class="form-control mb-4">
                                        <label for="textInput">Informe uma nova senha</label>
                                        <input type="text" id="textInput" class="form-control mb-4">
                                        <label for="textInput">Repita a nova senha</label>
                                        <input type="text" id="textInput" class="form-control mb-4">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                        <button type="button" class="btn btn-dark">Salvar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Remover conta -->
                        <div class="modal fade" id="excluirminhaconta" tabindex="-1" role="dialog"
                            aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="TituloModalCentralizado">Excluir conta</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Deseja excluir sua conta?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                        <button type="button" class="btn btn-dark">Sim</button>
                                    </div>
                                </div>
                            </div>
                        </div>
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

            </div>
    </div>
    </section>
    </div>
    <!------------------------------------- RODAP� ----------------------------------------------------->
   	<c:import url="rodape.jsp" />

    <!-- jQuery primeiro, depois Popper.js -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- Bootstrap JS  -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script type="text/javascript"
        src="https://cdn.datatables.net/w/bs4/jq-3.3.1/jszip-2.5.0/dt-1.10.18/af-2.3.3/b-1.5.6/b-colvis-1.5.6/b-flash-1.5.6/b-html5-1.5.6/b-print-1.5.6/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-2.0.0/sl-1.3.0/datatables.min.js"></script>
    <!-- MDBootstrap -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Javascript-->
    <script type="text/javascript" src="js/script.js"></script>

</body>

</html>
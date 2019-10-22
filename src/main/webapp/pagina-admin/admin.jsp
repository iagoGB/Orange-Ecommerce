<%@page import="br.com.smd.ecommerce.modelo.Administrador"%>
<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@page import="br.com.smd.ecommerce.modelo.Categoria"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>Admin</title>
    </head>

    <body>
        <!------------------------------------- CABE�ALHO ----------------------------------------------------->
   	<c:import url="cabecalhoAdmin.jsp" />
        
        <div class="content">
            <section>
                <div class="container-fluid">
                    <div class="row py-3 px-3">
                        
                        <div class="col-lg-3 col-md-4 col-sm-3 col-12 p-3 mx-auto order-2 order-sm-1">
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-dadosadmin">Meus
                                dados</button>
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-cadastros">Gerenciar
                                cadastros</button>
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-compras">Gerenciar
                                compras</button>
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-produtos">Gerenciar
                                produtos</button>
                            <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-categorias">Gerenciar
                                categorias</button>
                            <div class="dropdown">
                                <button type="button" class="btn btn-outline-dark btn-block mx-0 dropdown-toggle"
                                        role="button" data-display="static" id="dropdownMenuLink" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                    Gerar
                                    relatório
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                                            id="btn-relatorio1">Total de compras por cliente</button>
                                    <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                                            id="btn-relatorio2">Produtos em falta no estoque</button>
                                    <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                                            id="btn-relatorio3">Total de valor recebido</button>
                                    <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                                            id="btn-relatorio4">Exportar relatório</button>
                                </div>
                            </div>
                        </div>
                       
                            <!-- Alterar conta -->
                            <div class="modal fade" id="alterarconta" tabindex="-1" role="dialog"
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
                            <div class="modal fade" id="excluirconta" tabindex="-1" role="dialog"
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
                           
                            
                            <!-- Remover compras -->
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
                            <!-- Histórico de compras -->
                            <div class="card card-cascade narrower d-none" id="collapse-historico">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Histórico de compras</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluircompras">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dthistorico">
                                        <thead class="thead-light">
                                            <tr>
                                                <th></th>
                                                <th scope="col">Data</th>
                                                <th scope="col">Cliente</th>
                                                <th scope="col">Preço</th>
                                                <th scope="col">Produto(s)</th>
                                                <th scope="col">Quantidade(s)</th>
                                                <th scope="col">Valor da compra</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td>#</td>
                                                <td>#</td>
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
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>


                            </div>
                            <!-- Remover compras -->
                            <div class="modal fade" id="excluircompras" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Remover compra</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja remover essa(s) compra(s) do cliente?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                            <button type="button" class="btn btn-dark">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Listar produtos -->
                            <div class="card card-cascade narrower d-none" id="collapse-produtos">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Produtos no estoque</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#inserirprod">
                                            <i class="fas fa-plus-circle fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#alterarprod">
                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluirprod">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtprodutos">
                                        <thead class="thead-light">
                                            <tr>
                                                <th></th>
                                                <th scope="col">Foto</th>
                                                <th scope="col">Descrição</th>
                                                <th scope="col">Preço</th>
                                                <th scope="col">Quantidade</th>
                                                <th scope="col">Categoria(s)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG3</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celulare</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><img src="img/img.jpg" width="100px"></td>
                                                <td>MotoG4</td>
                                                <td>R$ 767,90</td>
                                                <td>180</td>
                                                <td>Celular</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <!-- Inserir novo produto -->
                            <div class="modal fade" id="inserirprod" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Inserir produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="textInput">Informe uma descrição</label>
                                            <input type="text" id="textInput" class="form-control mb-4">

                                            <label for="textInput">Adicione uma imagem ao
                                                produto</label>
                                            <div class="input-group mb-3">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                    <label class="custom-file-label" for="inputGroupFile02"
                                                           aria-describedby="inputGroupFileAddon02"></label>
                                                </div>
                                                <div class="input-group-append">
                                                    <span class="input-group-text"
                                                          id="inputGroupFileAddon02">Carregar</span>
                                                </div>
                                            </div>

                                            <label for="textInput">Informe um preço</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">R$</span>
                                                </div>
                                                <input type="text" class="form-control" aria-label="Quantia">
                                            </div>

                                            <label for="customRange3">Quantidade no estoque: </label>
                                            <input type="text" class="form-control" aria-label="Quantidade">
                                            <input type="range" class="custom-range" min="0" max="100" step="1"
                                                   id="customRange3">

                                            <label for="select">Escolha a(s) categoria(s)</label>
                                            <div class="input-group">
                                                <select class="custom-select" id="inputGroupSelect01" multiple size="3">
                                                    <option value="1">Um</option>
                                                    <option value="2">Dois</option>
                                                    <option value="3">Três</option>
                                                    <option value="4">Quatro</option>
                                                    <option value="5">Cinco</option>
                                                    <option value="6">Seis</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Alterar produto -->
                            <div class="modal fade" id="alterarprod" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Alterar produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="textInput">Informe uma nova descrição</label>
                                            <input type="text" id="textInput" class="form-control mb-4">

                                            <label for="textInput">Atualize a imagem do
                                                produto</label>
                                            <div class="input-group mb-3">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="inputGroupFile02">
                                                    <label class="custom-file-label" for="inputGroupFile02"
                                                           aria-describedby="inputGroupFileAddon02"></label>
                                                </div>
                                                <div class="input-group-append">
                                                    <span class="input-group-text"
                                                          id="inputGroupFileAddon02">Carregar</span>
                                                </div>
                                            </div>

                                            <label for="textInput">Informe um novo preço</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">R$</span>
                                                </div>
                                                <input type="text" class="form-control" aria-label="Quantia">
                                            </div>

                                            <label for="customRange3">Informe a nova quantidade no estoque: </label>
                                            <input type="text" class="form-control" aria-label="Quantidade">
                                            <input type="range" class="custom-range" min="0" max="100" step="1"
                                                   id="customRange3">

                                            <label for="select">Escolha a(s) nova(s) categoria(s)</label>
                                            <div class="input-group">
                                                <select class="custom-select" id="inputGroupSelect01" multiple size="3">
                                                    <option value="1">Um</option>
                                                    <option value="2">Dois</option>
                                                    <option value="3">Três</option>
                                                    <option value="4">Quatro</option>
                                                    <option value="5">Cinco</option>
                                                    <option value="6">Seis</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Remover produto -->
                            <div class="modal fade" id="excluirprod" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Remover produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja remover esse(s) produto(s) do estoque?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                            <button type="button" class="btn btn-dark">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Listar categorias -->
                            <div class="card card-cascade narrower d-none" id="collapse-categorias">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Categorias</a>
                                    <div class="ml-auto mr-2">
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#inserircat">
                                            <i class="fas fa-plus-circle fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#alterarcat">
                                            <i class="fas fa-pencil-alt fa-2x mt-0"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2"
                                                data-toggle="modal" data-target="#excluircat">
                                            <i class="fas fa-trash-alt fa-2x mt-0"></i>
                                        </button>

                                    </div>
                                </div>

                                <div class="table-responsive p-3">
                                    <table class="table table-hover table-bordered" id="dtcategorias">
                                        <thead class="thead-light">
                                            <tr>
                                                <th></th>
                                                <th scope="col">Descri��o</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="categoria" items="${listaCategorias}">
                                                <tr>
                                                    <td></td>
                                                    <td> <c:out value="${categoria.descricao}" /> </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <!-- Inserir nova categoria -->
                            <form action="inserircategoria" method="post">
                                <div class="modal fade" id="inserircat" tabindex="-1" role="dialog"
                                     aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="TituloModalCentralizado">Inserir categoria</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                                <label for="textInput">Informe uma descrição</label>
                                                <input name="descricao" type="text" id="textInput" class="form-control mb-4">

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                                <button type="submit" class="btn btn-dark">Salvar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- Alterar categoria -->
                            <div class="modal fade" id="alterarcat" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Alterar categoria</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="textInput">Informe uma nova descrição</label>
                                            <input type="text" id="textInput" class="form-control mb-4">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Fechar</button>
                                            <button type="button" class="btn btn-dark">Salvar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Remover categoria -->
                            <div class="modal fade" id="excluircat" tabindex="-1" role="dialog"
                                 aria-labelledby="TituloModalCentralizado" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="TituloModalCentralizado">Remover produto</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Deseja remover essa(s) categoria(s)?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dark" data-dismiss="modal">Não</button>
                                            <button type="button" class="btn btn-dark">Sim</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Gerar relatório 1 -->
                            <div class="card card-cascade narrower d-none" id="collapse-relatorio1">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Total de compras por cliente e por período</a>
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
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

                                        </tbody>

                                    </table>
                                </div>


                            </div>
                            <!-- Gerar relatório 2 -->
                            <div class="card card-cascade narrower d-none" id="collapse-relatorio2">
                                <div
                                    class="card-header bg-dark narrower py-2 mx-0 d-flex justify-content-start align-items-center">
                                    <a href="" class="white-text mx-3">Produtos faltando em estoque</a>
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
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>
                                            <tr>
                                                <td>#</td>
                                                <td>#</td>
                                                <td>#</td>
                                            </tr>

                                        </tbody>

                                    </table>
                                </div>


                            </div>
                            <!-- Gerar relatório 3 -->
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
        <!------------------------------------- RODAP� ----------------------------------------------------->
   	<c:import url="rodapeAdmin.jsp" />


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
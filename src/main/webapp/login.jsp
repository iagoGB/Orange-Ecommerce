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
        <title>Login</title>
    </head>

    <body>

        <header>
            <div class="container-fluid mb-3">
            <!-- Navbar principal -->
            <div class="row shadow justify-content-start">
                <div class="col-12">
                    <!--Navbar -->
                    <nav class="mb-1 navbar navbar-light shadow-none">
                        <!-- Menu -->
                        <button class="navbar-toggler order-sm-1 order-md-1 d-lg-none" id="menuresponsivo" type="button"
                            data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <!-- Logo -->
                        <a class="navbar-brand mr-auto mr-md-0 order-sm-2 order-md-2 order-lg-1" href="index.jsp">
                            <img src="img/logocor.png" alt="Transparent MDB Logo" id="animated-img1">
                        </a>
                        <!-- ConteÃºdo do menu -->
                        <div class="collapse navbar-collapse order-sm-4 order-md-5 py-3" id="navbarSupportedContent">
                            
                                <!-- Itens que somem no tamanho sm-->
                                <li class="nav-item d-sm-none">
                                    <h5>Conta</h5>
                                </li>
                                <li class="nav-item d-sm-none">
                                    <a class="nav-link" href="favoritos.jsp">Meus favoritos</a>
                                </li>
                                <li class="nav-item d-sm-none">
                                    <a class="nav-link" href="carrinho.jsp">Meu carrinho</a>
                                </li>
                                
                            </ul>
                            <form class="d-md-none form-row">
                                <div class="input-group md-form my-0">
                                    <input type="search" class="form-control" placeholder="Pesquisar"
                                        aria-label="Pesquisar" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn-sm btn-dark" type="button" id="inputGroupFileAddon">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Conta -->
                        <ul class="navbar-nav nav-flex-icons d-none d-sm-inline-flex order-sm-3 order-md-4 order-lg-4">
                            <li class="nav-item dropdown mx-1 mx-lg-2">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-user fa-2x"></i>

                                </a>  
                            <li class="nav-item mx-1 mx-lg-2">
                                <a class="nav-link waves-effect waves-light" href="favoritos.jsp">
                                    <i class="fas fa-heart fa-2x"></i>
                                    <span class="small badge badge-dark">0</span>
                                </a>
                            </li>
                            <li class="nav-item mx-1 mx-lg-2">
                                <a class="nav-link waves-effect waves-light" href="carrinho.jsp">
                                    <i class="fas fa-shopping-basket fa-2x"></i>
                                    <span class="small badge badge-dark">0</span>
                                </a>
                            </li>
                        </ul>
                       
                       
                    </nav>
                </div>
            </div>
        </div>
        </header>
        <div class="content">
            <section>
                <div class="container-fluid py-4">
                    <!--Ãrea de login e cadastro-->
                    <div class="row justify-content-center">
                        
                        <!------------------------------------------------------ LOGIN ---------------------------------------------------------------->
                        
                        <div class="col-sm-12 col-md-5 col-lg-4 col-xl-4 mx-1 my-1">

                            
                            <%
                                String mensagem = (String) request.getAttribute("msg");
                                if (mensagem != null) {
                            %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <p class="text-danger"><%=mensagem %></p>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <%
                                }
                            %>
                            <div class="card">
                                <article class="card-body">
                                    <h4 class="card-title text-center mb-4 mt-1">Login</h4>
                                    <hr>
                                    <p class="text-dark text-center">Entre na sua conta</p>
                                    <form action="login" method="post" class="needs-validation" novalidate>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                                </div>

                                                <input name="emailLogin" class="form-control"
                                                       placeholder="Digite seu login" type="text" id="validationCustom01" required>
                                                <!-- Colocar os if e else e colocar a mensagem de erro específica dentro do "valid-feedback" -->


                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                                </div>

                                                <input name="senhaLogin" class="form-control" placeholder="Digite sua senha"
                                                       type="password" id="validationCustom02" required>
                                                <!-- Colocar os if e else e colocar a mensagem de erro específica dentro do "valid-feedback" -->

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block mx-0"> Entrar </button>
                                        </div>
                                        <p class="text-center"><a href="#" class="btn">Esqueceu a senha?</a></p>
                                    </form>
                                </article>
                            </div>
                        </div>
                        <!--DivisÃ³ria-->
                        <div class="col-sm-12 col-md-1 col-lg-2 col-xl-2 mx-1 my-1">
                            <h3 class="text-dark text-center">ou</h3>
                        </div>
                        <!-----------------------------------------------------   CADASTRO  ------------------------------------------------------------->

                        <div class="col-sm-12 col-md-5 col-lg-4 col-xl-4 mx-1 my-1">


                            
                            <%
                                String novoUsMsg = (String) request.getAttribute("novoUsMsg");
                                String erroView = (String) request.getAttribute("erroView");
                                if (novoUsMsg != null && novoUsMsg.equals("Cadastro realizado com sucesso!")) {
                            %>

                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <p class="text-success">Cadastro realizado com sucesso</p>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <%
                            } else {
                                if (erroView != null) {
                            %>

                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <p class="text-danger"><%=erroView %></p>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <%
                                }
                            }
                            %>



                            <div class="card">
                                <article class="card-body">
                                    <h4 class="card-title mt-3 text-center">Cadastro</h4>
                                    <hr>
                                    <p class="text-center">Crie sua conta</p>
                                    <form action="novoUsuario" method="post" class="needs-validation" novalidate>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                            </div>

                                            <input name="nome" class="form-control" placeholder="Digite seu nome completo"
                                                   type="text" id="validationCustom03" required>
                                            
                                            <div class="invalid-feedback">
                                                Nome não pode ser vazio
                                            </div>
                                        </div>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                            </div>

                                            <input name="login" class="form-control" placeholder="Digite um login"
                                                   type="login" id="validationCustom04" required>
                                            
                                            <div class="invalid-feedback">
                                                Login deve ser único e não pode ser vazio
                                            </div>
                                        </div>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                            </div>

                                            <input name="email" class="form-control" placeholder="Digite um email"
                                                   type="email" id="validationCustom05" required>
                                            
                                            <div class="invalid-feedback">
                                                Email não pode ser vazio
                                            </div>
                                        </div>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-home"></i> </span>
                                            </div>

                                            <input name="endereco" class="form-control" placeholder="Digite seu endereço" type="text" id="validationCustom06" required>
                                            
                                            <div class="invalid-feedback">
                                                Endereço não pode ser vazio
                                            </div>
                                        </div>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                            </div>

                                            <input name="senha" class="form-control" placeholder="Digite uma senha"
                                                   type="password" id="validationCustom07" required>
                                            

                                            <div class="invalid-feedback">
                                                Não pode ser vazia.
                                            </div>

                                        </div>
                                        <div class="form-group input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                            </div>

                                            <input name="confirmaSenha" class="form-control" placeholder="Repita a senha"
                                                   type="password" id="validationCustom08" required>
                                            
                                            <div class="invalid-feedback">
                                                Senhas devem ser idênticas
                                            </div>
                                            <div class="invalid-feedback">
                                                Não pode ser vazia.
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block mx-0"> Criar conta
                                            </button>
                                        </div>
                                    </form>
                                </article>
                            </div>
                        </div>

                    </div>
                </div>
        </div>
    </section>
</div>
<!------------------------------------- RODAPÉ ----------------------------------------------------->
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
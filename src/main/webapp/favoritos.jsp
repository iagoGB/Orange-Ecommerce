<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
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
    <title>Favoritos</title>
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
                        <!-- Conteúdo do menu -->
                        <div class="collapse navbar-collapse order-sm-4 order-md-5 py-3" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <h5>Nossos produtos</h5>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="categoria.jsp">Smartphones
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="categoria.jsp">Notebooks</a>
                                </li>
                                <li class="nav-item border-bottom border-lg-0 mb-3">
                                    <a class="nav-link" href="categoria.jsp">PCs</a>
                                </li>
                                <!-- Itens que somem no tamanho sm-->
                                <li class="nav-item d-sm-none">
                                    <h5>Conta</h5>
                                </li>
                                <li class="nav-item d-sm-none">
                                    <a class="nav-link" href="login.jsp">Entrar ou cadastrar</a>
                                </li>
                                <%-- S� mostra sair se o usu�rio estiver logado --%>

                                <li class="nav-item d-sm-none">
                                    <a class="nav-link" href="favoritos.jsp">Meus favoritos</a>
                                </li>
                                <li class="nav-item d-sm-none">
                                    <a class="nav-link" href="carrinho.jsp">Meu carrinho</a>
                                </li>
                                <li class="nav-item border-bottom border-lg-0 mb-3 d-sm-none">
                                    <a class="nav-link" href="/logout">Sair</a>
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
                                <div class="dropdown-menu dropdown-menu-left dropdown-default"
                                    aria-labelledby="navbarDropdownMenuLink-333">
                                     <%
                                        if (session.getAttribute("usuario") == null) {
                                    %>
                                        <a class="dropdown-item" href="login.jsp">Entrar ou Cadastrar</a>
                                    <%
                                        }
                                    %>
                                    

                                    <%-- S� mostra sair se o usu�rio estiver logado --%>

                                        <%
                                            if (session.getAttribute("usuario") != null) {
                                        %> 
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="cliente.jsp">Minha conta</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="logout">Sair</a>
                                    </div>
                                    <%
                                        };
                                    %>
                                <li>
                                    <div>
                                        <%
                                            String msg = (String) request.getAttribute("msg");
                                            Usuario u = (Usuario) session.getAttribute("usuario");
                                            if (u != null) {
                                        %>
                                                <small>   Bem vindo <br> </small> 
                                                <small>   <%=  u.getLogin()%> </small> 
                                        <%  
                                            }
                                        %>
                                    </div>
                                </li>
                            </li>
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
                        <!-- Busca -->
                        <div class="col-md-4 d-none d-md-inline-block order-md-3 order-lg-2 mx-md-0 mx-lg-0">
                            <form class="form-row">
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
                        <!-- Menu rápido de categorias -->
                        <div class="dropdown d-none d-lg-block order-lg-3">
                            <button class="btn-md btn-outline-dark shadow-none dropdown-toggle p-1" type="button"
                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                Nossos produtos
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="categoria.jsp">Smartphones</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="categoria.jsp">Notebooks</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="categoria.jsp">PCs</a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <div class="content">
        <section>
            <div class="container-fluid py-4">
                <!--Titulo-->
                <div class="row pt-5 pb-0 px-3">
                    <div class="col">
                        <span class="h4">Meus Favoritos</span>
                        <hr class="bg-dark">
                    </div>
                </div>
                <div class="row pt-3 pb-3 px-3">
                    <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                        <div class="card border-warning">
                            <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                            <div class="card-body">
                                <a href="produto.html">
                                    <h5 class="card-title">Produto</h5>
                                </a>
                                <p class="card-text">Descrição</p>
                                <p class="card-text">Preço</p>
                                <a href="#" class="btn btn-danger"><i class="fas fa-window-close"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                        <div class="card border-warning">
                            <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                            <div class="card-body">
                                <a href="produto.html">
                                    <h5 class="card-title">Produto</h5>
                                </a>
                                <p class="card-text">Descrição</p>
                                <p class="card-text">Preço</p>
                                <a href="#" class="btn btn-danger"><i class="fas fa-window-close"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                        <div class="card border-warning">
                            <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                            <div class="card-body">
                                <a href="produto.html">
                                    <h5 class="card-title">Produto</h5>
                                </a>
                                <p class="card-text">Descrição</p>
                                <p class="card-text">Preço</p>
                                <a href="#" class="btn btn-danger"><i class="fas fa-window-close"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                        <div class="card border-warning">
                            <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                            <div class="card-body">
                                <a href="produto.html">
                                    <h5 class="card-title">Produto</h5>
                                </a>
                                <p class="card-text">Descrição</p>
                                <p class="card-text">Preço</p>
                                <a href="#" class="btn btn-danger"><i class="fas fa-window-close"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                        <div class="card border-warning">
                            <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                            <div class="card-body">
                                <a href="produto.html">
                                    <h5 class="card-title">Produto</h5>
                                </a>
                                <p class="card-text">Descrição</p>
                                <p class="card-text">Preço</p>
                                <a href="#" class="btn btn-danger"><i class="fas fa-window-close"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                        <div class="card border-warning">
                            <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                            <div class="card-body">
                                <a href="produto.html">
                                    <h5 class="card-title">Produto</h5>
                                </a>
                                <p class="card-text">Descrição</p>
                                <p class="card-text">Preço</p>
                                <a href="#" class="btn btn-danger"><i class="fas fa-window-close"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-4 pb-3">
                        <div class="card border-warning">
                            <img class="card-img-top" src="img/img.jpg" alt="Imagem de capa do card">
                            <div class="card-body">
                                <a href="produto.html">
                                    <h5 class="card-title">Produto</h5>
                                </a>
                                <p class="card-text">Descrição</p>
                                <p class="card-text">Preço</p>
                                <a href="#" class="btn btn-danger"><i class="fas fa-window-close"></i></a>
                                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer>
        <div class="container-fluid">
            <div class="row align-items-center justify-content-center">
                <div class="col bg-primary">
                    <p class="text-center text-light my-1">2019 © Todos os direitos reservados.</p>
                </div>
            </div>
        </div>
    </footer>

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
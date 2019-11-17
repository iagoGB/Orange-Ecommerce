<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

    <%@include file="componentes/head.jsp" %>

    <body>

        <!-- CABEÇALHO -->
        <%@include file="componentes/cabecalho.jsp" %> 
        <div class="content">
            <section>
                <div class="container-fluid py-4">
                    <!--Área de login e cadastro-->
                    <div class="row justify-content-center">

                        <!-- LOGIN -->
                        <div class="col-sm-12 col-md-5 col-lg-4 col-xl-4 mx-1 my-1">


                            <%
                                String mensagem = (String) request.getAttribute("msg");
                                if (mensagem != null) {
                            %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <p class="text-danger text-center"><%=mensagem%></p>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <%
                                }
                            %>

                            <c:if test="${not empty mensagemFazerLogin}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <p class="text-danger text-center">${mensagemFazerLogin}</p>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div> 
                            </c:if>
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
                                                 <!--Variavel que guarda a página anterior antes do login-->
                                                <input type="hidden" name="paginaAnterior" value="${paginaAnterior}">
                                                <input name="emailLogin" class="form-control"
                                                       placeholder="Digite seu login" type="text" id="validationCustom01" required>



                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                                </div>

                                                <input name="senhaLogin" class="form-control" placeholder="Digite sua senha"
                                                       type="password" id="validationCustom02" required>


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
                        <!--Divisória-->
                        <div class="col-sm-12 col-md-1 col-lg-2 col-xl-2 mx-1 my-1">
                            <h3 class="text-dark text-center">ou</h3>
                        </div>
                        <!-- CADASTRO -->

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
                                <p class="text-danger"><%=erroView%></p>
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
<!-- RODAPÉ -->

<%@include file="componentes/rodape.jsp" %>

</body>

</html>
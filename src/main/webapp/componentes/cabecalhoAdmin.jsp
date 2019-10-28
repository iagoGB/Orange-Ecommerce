<%-- 
    Document   : cabecalhoadmin
    Created on : 22/10/2019, 14:55:39
    Author     : Iago Gomess
--%>

<%@page import="br.com.smd.ecommerce.modelo.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="container-fluid mb-3">
    <!-- Navbar principal -->
    <div class="row shadow justify-content-start">
        <div class="col-12">
            <!--Navbar -->
            <nav class="mb-1 navbar navbar-light shadow-none">
                
                <!-- Logo -->
                <a class="navbar-brand mr-auto mr-md-0 order-sm-2 order-md-2 order-lg-1" href="#">
                    <img src="${pageContext.request.contextPath}/img/logocor.png" alt="Transparent MDB Logo" id="animated-img1">
                </a>
                
                <!-- Conta -->
                <ul class="navbar-nav nav-flex-icons d-sm-inline-flex order-sm-3 order-md-4 order-lg-4">
                    <li class="nav-item dropdown mx-1 mx-lg-2">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user fa-2x"></i>

                        </a>
                        <div class="dropdown-menu dropdown-menu-left dropdown-default"
                             aria-labelledby="navbarDropdownMenuLink-333">

                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/logout.do">Sair</a>
                        </div>

                    <li>
                        <div>
                            <%
                                // String msg = (String) request.getAttribute("msg");
                                Administrador adm = (Administrador) session.getAttribute("usuario");
                                if (adm != null) {
                            %>
                            <small>   Bem vindo <br> </small> 
                            <small>   <%=  adm.getLogin()%> </small> 
                            <%  }%>
                        </div>
                    </li>
                    </li>
                </ul>


            </nav>
        </div>
    </div>
</div>

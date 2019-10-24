<%-- 
    Document   : homeAdmin
    Created on : 22/10/2019, 15:49:18
    Author     : Iago Gomes
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include file="../componentes/head.jsp" %>
    </head>

    <body>
        <header>
            <%@include file="../componentes/cabecalhoAdmin.jsp" %>
        </header>

        <div class="content">

            <section>

                <div class="container-fluid">

                    <div class="row py-3 px-3">

                        <%@include file="../componentes/navMenuAdmin.jsp" %>
                        <%@include file="meusDadosAdmin.jsp" %>


                    </div>

                </div>

            </section>

        </div>

        <%@include file="../componentes/rodape.jsp" %>
       

    </body>

</html>

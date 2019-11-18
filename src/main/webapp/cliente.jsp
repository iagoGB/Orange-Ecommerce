<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <%@include file="../componentes/head.jsp" %>
    </head>

    <body>
        <!-- CABEÇALHO -->
        <header>
            <%@include file="../componentes/cabecalho.jsp" %>
        </header>
        <div class="content">
            <section>
                <div class="container-fluid">
                    <div class="row py-3 px-3">
                        <%@include file="../componentes/navMenu.jsp" %>
                        <div class="col-lg-9 col-md-8 col-sm-9 col-12 p-3 order-1 order-sm-2">
                            <%@include file="../componentes/clientedados.jsp" %>
                            <%@include file="../componentes/clientehistorico.jsp" %>                          
                        </div>

                    </div>
                </div>
            </section>
        </div>
        <!-- RODAPÉ -->
        <%@include file="componentes/rodape.jsp" %>

   </body>

</html>
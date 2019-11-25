
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="br.com.smd.ecommerce.modelo.Usuario"%>
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
   <c:choose>
        <c:when test="${not empty congratulations}" >
            <script>
                //alert("Hellow world");
                setTimeout( 
                   function(){ document.getElementById("btn-minhascompras").click();},100
                );
        
            </script>
        </c:when>
    </c:choose>
        
   </body>

</html>


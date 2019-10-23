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
        <jsp:include page="head.jsp" />
    </head>

    <body>
        <header>
            <jsp:include page="cabecalhoAdmin.jsp" />
        </header>
        
        <div class="content">

            <section>
                
                <div class="container-fluid">
                    
                    <div class="row py-3 px-3">
                        
                        <jsp:include page="navMenuAdmin.jsp" />
                        <jsp:include page="meusDadosAdmin.jsp" />
                        
                    </div>
                        
                </div>
                        
            </section>

        </div>
                        
        <jsp:include page="rodapeAdmin.jsp" />

    </body>

</html>

<%-- 
    Document   : homeAdmin
    Created on : 22/10/2019, 15:49:18
    Author     : aluno
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <c:import url="head.jsp" />
    </head>

    <body>
        <header>
            <c:import url="cabecalhoAdmin.jsp" />
        </header>
        
        <div class="content">

            <section>
                
                <div class="container-fluid">
                    
                    <div class="row py-3 px-3">
                        
                        <c:import url="navMenuAdmin.jsp" />
                        <c:import url="meusDadosAdmin.jsp" />   
                        
                    </div>
                        
                </div>
                        
            </section>

        </div>

        <c:import url="rodapeAdmin.jsp" /> 

    </body>

</html>

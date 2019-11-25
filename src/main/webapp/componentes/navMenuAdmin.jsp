<%-- 
    Document   : navMenu
    Created on : 23/10/2019, 12:07:32
    Author     : iago.barreto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-lg-3 col-md-4 col-sm-3 col-12 p-3 mx-auto order-2 order-sm-1">
    <a href="/admin/homeAdmin.jsp"> 
        <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-dadosadmin">Meus
        dados</button>
    </a>
    
   
    
    <a href="/gerenciarCompras.do">
        <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-compras">Gerenciar
            compras</button>
    </a>
    <a href="/listarProduto.do">
        <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-produtos">Gerenciar
            produtos</button>
    </a>
    <a href="/listarCategoria.do">
        <button type="button" class="btn btn-outline-dark btn-block mx-0" id="btn-categorias">Gerenciar
            categorias</button>
    </a>
    <div class="dropdown">
        <button type="button" class="btn btn-outline-dark btn-block mx-0 dropdown-toggle"
                role="button" data-display="static" id="dropdownMenuLink" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
            Gerar
            relatório
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <a href="/listarTotalCompras.do">
            <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                    id="btn-relatorio1">Total de compras por cliente</button>
            </a>
            <a href="/listarProdutoEstoque.do">
            <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                    id="btn-relatorio2">Produtos em falta no estoque</button>
            </a>
            <a href="/listarValorTotalCompras.do">
            <button type="button" class="dropdown-item btn btn-outline-dark btn-block mx-0"
                    id="btn-relatorio3">Total de valor recebido</button>
            </a>
        </div>
    </div>
</div>
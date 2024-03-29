$(document).ready(function () {
    $("#collapse-dadosadmin").removeClass("d-none");
    $("#collapse-dadoscliente").removeClass("d-none");
 
    $("#collapse-historico").removeClass("d-none");
    $("#collapse-produtos").removeClass("d-none");
    $("#collapse-categorias").removeClass("d-none");
    $("#collapse-relatorio1").removeClass("d-none");
    $("#collapse-relatorio2").removeClass("d-none");
    $("#collapse-relatorio3").removeClass("d-none");
    
    $('#dtcarrinho').DataTable({
        "searching": true,
        columnDefs: [{
                orderable: true,
                className: 'select-checkbox',
                targets: 0
            }],
        select: {
            style: 'os',
            selector: 'td:first-child'}
    });
    
    $('#dthistorico').DataTable({
        "searching": true,
        columnDefs: [{
                orderable: true,
                className: 'select-checkbox',
                targets: 0
            }],
        select: {
            style: 'os',
            selector: 'td:first-child'}
    });
    $('#dtmeuhistorico').DataTable({

    });
    $('#dtprodutos').DataTable({
        "searching": true,
        columnDefs: [{
                orderable: true,
                className: 'select-checkbox',
                targets: 0
            }],
        select: {
            style: 'os',
            selector: 'td:first-child'}
    });
    $('#dtcategorias').DataTable({
        "searching": true,
        columnDefs: [{
                orderable: true,
                className: 'select-checkbox',
                targets: 0
            }],
        select: {
            style: 'os',
            selector: 'td:first-child'}
    });
    $('#dtdadosadmin').DataTable({

    });
    $('#dtdadoscliente').DataTable({

    });
    $('#dtrelatorio1').DataTable({
        "searching": true,
    });
    $('#dtrelatorio2').DataTable({
        "searching": true,
    });
    $('#dtrelatorio3').DataTable({
        "searching": true,
    });

    $('.dataTables_length').addClass('bs-select');

    $("#btn-dadosadmin").click(function () {
        $("#collapse-dadosadmin").removeClass("d-none");
        $("#collapse-historico").addClass("d-none");
        $("#collapse-produtos").addClass("d-none");
        $("#collapse-categorias").addClass("d-none");
        $("#collapse-relatorio1").addClass("d-none");
        $("#collapse-relatorio2").addClass("d-none");
        $("#collapse-relatorio3").addClass("d-none");
    });
    $("#btn-dadoscliente").click(function () {
        $("#collapse-dadoscliente").removeClass("d-none");
        $("#collapse-meuhistorico").addClass("d-none");
    });
    $("#btn-minhascompras").click(function () {
        $("#collapse-dadoscliente").addClass("d-none");
        $("#collapse-meuhistorico").removeClass("d-none");
    });
    
    
    $("#btn-compras").click(function () {
        $("#collapse-dadosadmin").addClass("d-none");
        $("#collapse-historico").removeClass("d-none");
        $("#collapse-produtos").addClass("d-none");
        $("#collapse-categorias").addClass("d-none");
        $("#collapse-relatorio1").addClass("d-none");
        $("#collapse-relatorio2").addClass("d-none");
        $("#collapse-relatorio3").addClass("d-none");
    });
    $("#btn-produtos").click(function () {
        $("#collapse-dadosadmin").addClass("d-none");
        $("#collapse-historico").addClass("d-none");
        $("#collapse-produtos").removeClass("d-none");
        $("#collapse-categorias").addClass("d-none");
        $("#collapse-relatorio1").addClass("d-none");
        $("#collapse-relatorio2").addClass("d-none");
        $("#collapse-relatorio3").addClass("d-none");
    });
    $("#btn-categorias").click(function () {
        $("#collapse-dadosadmin").addClass("d-none");
        $("#collapse-historico").addClass("d-none");
        $("#collapse-produtos").addClass("d-none");
        $("#collapse-categorias").removeClass("d-none");
        $("#collapse-relatorio1").addClass("d-none");
        $("#collapse-relatorio2").addClass("d-none");
        $("#collapse-relatorio3").addClass("d-none");
    });
    $("#btn-relatorio1").click(function () {
        $("#collapse-dadosadmin").addClass("d-none");
        $("#collapse-historico").addClass("d-none");
        $("#collapse-produtos").addClass("d-none");
        $("#collapse-categorias").addClass("d-none");
        $("#collapse-relatorio1").removeClass("d-none");
        $("#collapse-relatorio2").addClass("d-none");
        $("#collapse-relatorio3").addClass("d-none");
    });
    $("#btn-relatorio2").click(function () {
        $("#collapse-dadosadmin").addClass("d-none");
        $("#collapse-historico").addClass("d-none");
        $("#collapse-produtos").addClass("d-none");
        $("#collapse-categorias").addClass("d-none");
        $("#collapse-relatorio1").addClass("d-none");
        $("#collapse-relatorio2").removeClass("d-none");
        $("#collapse-relatorio3").addClass("d-none");
    });
    $("#btn-relatorio3").click(function () {
        $("#collapse-dadosadmin").addClass("d-none");
        $("#collapse-historico").addClass("d-none");
        $("#collapse-produtos").addClass("d-none");
        $("#collapse-categorias").addClass("d-none");
        $("#collapse-relatorio1").addClass("d-none");
        $("#collapse-relatorio2").addClass("d-none");
        $("#collapse-relatorio3").removeClass("d-none");
    });


    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
    
    //Preview da imagem antes do upload
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#change-create-preview').attr('src', e.target.result).attr('width',200).attr('height',200);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $(".create-preview").change(function () {
        readURL(this);
    });
    
    
    //Reseta imagem ao fechar form
    function defaultImg(){
        //Remove a vizualização da imagem
        $('#change-create-preview').attr('src'," ").attr('width',0).attr('height',0);
        //Remove o arquivo do input
        $('.create-preview').val("");
        
    }
    
    $(".close-preview").click( function(){
        defaultImg();
    });
    

});



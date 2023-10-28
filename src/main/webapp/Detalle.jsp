<%-- 
    Document   : Detalle
    Created on : 14 oct 2023, 03:13:04
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="Modelo.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE,edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    </head>
    <body>
        <!--HEADER-->
        <header>
            <%@include file="header_footer/Header.jsp" %>
            <!--TAMBIEN PRODUCTOS-->
            <div class="header-content container">
                <div class="swiper mySwiper-1">
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </header>

        <%
            Bebidas ar = (Bebidas) request.getAttribute("dato");
        %>
    <center>
        <h2 class="textoxd">Detalle del Articulo</h2>
        <a href="#" onclick="history.back()" class="textoxd">Retornar</a><br><br>

        <form action="control" name="fr">  
            <table border="1" cellspacing="15" cellpadding="15">
                <input type="hidden" name="opc" value="3">
                <input type="hidden" name="cod" value="<%=ar.getCod()%>">

                <tr><td rowspan="5"><img src="imagenes/Bebidas/<%=ar.getFoto()%>" width="200" height="200">
                    <td class="textoxd">Descripcion<td class="textoxd"><%=ar.getNom()%>
                <tr><td class="textoxd">Precio Unitario<td class="textoxd"><%=ar.getPrecio()%>
                <tr><td class="textoxd">Stock<td class="textoxd"><%=ar.getStock()%>        
                <tr><td class="textoxd">Cantidad<td class="textoxd"><input name="cantidad">
                <tr><td><center><a href="#" onclick="valida()"><<img src="imagenes/cesta.gif"></a></center> 
            </table>
        </form> 

    </center>

    <section>
        <footer class="footer container">
            <%@include file="header_footer/Footer.jsp" %>
        </footer>
    </section>
    <script>
        function valida() {
            sk = <%=ar.getStock()%>;
            can = Number(fr.cantidad.value);
            if (can === 0) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Ingrese una cantidad mayor a 0!',
                })
                return
            }
            if (sk < can) {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'La cantidad ingresada es mayor al stock!',
                })
                return;
            }
            fr.submit();
        }
    </script>
</body>
</html>

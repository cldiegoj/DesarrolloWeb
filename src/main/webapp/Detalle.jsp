<%-- 
    Document   : Detalle
    Created on : 14 oct 2023, 03:13:04
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="Modelo.Articulo" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE,edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
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

        <center>
            <table border="1" cellspacing="20" cellpadding="20">
               
            </table>
        </center>
    </body>
</html>

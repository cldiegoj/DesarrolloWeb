<%@ page import="java.util.List" %>
<%@ page import="Modelo.Categoria" %>
<%@ page import="DAO.Negocio" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CATEGORIA</title>
</head>
<body>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
                <tr>
                    <td onmouseover="bgColor = 'red'" onmouseout="bgColor = 'black'">
                        <a href="pagArticulo.jsp?cod=" style="text-decoration: none; color: white;">
                            <img src="imagenes/slider1.jpg" height="90" width="90">
                            <br>
                            <span>Vino</span> <!-- Estilos de fondo negro y letra blanca -->
                        </a>
                    </td>
                </tr>
            </ta    ble>
        </center>
        
        <center>
            <table border="1" cellspacing="20" cellpadding="20">
                <tr>
                    <td onmouseover="bgColor = 'red'" onmouseout="bgColor = 'black'">
                        <a href="pagArticulo.jsp?cod=" style="text-decoration: none; color: white;">
                            <img src="imagenes/slider2.jpg" height="90" width="90">
                            <br>
                            <span>RON</span> <!-- Estilos de fondo negro y letra blanca -->
                        </a>
                    </td>
                </tr>
            </table>
        </center>
        
        <center>
            <table border="1" cellspacing="20" cellpadding="20">
                <tr>
                    <td onmouseover="bgColor = 'red'" onmouseout="bgColor = 'black'">
                        <a href="pagArticulo.jsp?cod=" style="text-decoration: none; color: white;">
                            <img src="imagenes/slider3.png" height="90" width="90">
                            <br>
                            <span>CERVESA</span> <!-- Estilos de fondo negro y letra blanca -->
                        </a>
                    </td>
                </tr>
            </table>
        </center>
   
    <%
        Negocio negocio = new Negocio();
        List<Categoria> categorias = negocio.listCat();
    %>
    <center>
        <h2>Lista de Categorias</h2>
        <table border="1" cellspacing="15" cellpadding="15">
            <tr>
            <%
                int cuenta = 0;
                for (Categoria categoria : categorias) {
            %>
                <td onmouseover="bgColor='red'" onmouseout="bgColor='white'">
                    <a href="control?opc=1&cod=<%= categoria.getCodc() %>">
                        <img src="images/<%= categoria.getImagen() %>" width="150" height="150"><br><%= categoria.getNomc() %>
                    </a>
                </td>
            <%
                cuenta++;
                if (cuenta % 3 == 0) {
            %>
            </tr>
            <%
                }
            }
            %>
        </table>
    </center>
</body>
</html>

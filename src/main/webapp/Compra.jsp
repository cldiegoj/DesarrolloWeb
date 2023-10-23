<%@ page import="java.util.*" %>
<%@ page import="Modelo.Compra" %> <!-- Asegúrate de que la ubicación sea correcta -->
<%@ page import="ModeloDAO.Negocio" %> <!-- Asegúrate de que la ubicación sea correcta -->

<!DOCTYPE html>
<html>
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
        <%
            HttpSession ses = request.getSession();
            List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
        %>
    <center>
        <h2 class="textoxd">Lista de Compras</h2><br>
        <a href="Categoria.jsp">Seguir Comprando</a>&nbsp;&nbsp;&nbsp;
        <a href="pagLogin.jsp">Hacer efectiva la Compra</a>&nbsp;&nbsp;&nbsp;<br><br>
        <table class="table table-hover" border="1" cellspacing="15" cellpadding="15">
            <thead>
                <tr class="textoxd">
                    <td>Codigo<td>Descripcion<td>Precio<td>Cantidad<td>Total<td>Foto<td>Eliminar
            </thead>
            <%
                double acu = 0;
                int contador = 0;
                for (Compra x : lista) {
                    acu = acu + x.total();
                    out.print("<tr class='textoxd'><td>" + x.getCod() + "<td>" + x.getNom() + "<td>" + x.getPrecio() + "<td>" + x.getCantidad() + "<td>" + x.total());
            %>
            <td><img src="imagenes/Bebidas/<%=x.getFoto()%>" width="80" height="70">
                <%
                    out.print("<td> <a href =control?opc=4&cod=" + x.getCod() + "&indice=" + contador + ">Eliminar");
                        contador++;
                    }
                %>   
            <tr class="textoxd"><td><b>Total de Compra:</b><td><td><td><td><%=acu%>
        </table>
    </center>

    <section>
        <footer class="footer container">
            <%@include file="header_footer/Footer.jsp" %>
        </footer>
    </section>
</body>
</html>

<%@ page import="java.util.*" %>
<%@ page import="Modelo.Compra" %> <!-- Asegúrate de que la ubicación sea correcta -->
<%@ page import="DAO.Negocio" %> <!-- Asegúrate de que la ubicación sea correcta -->

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalle de Compra</title>
    <link href="css/adminlte.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
    HttpSession ses = request.getSession();
    List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
    double totalCompra = 0;
%>
<center>
    <h2>Detalle de Compra</h2><br>
    <a href="pagCategoria.jsp">Seguir Comprando</a>&nbsp;&nbsp;&nbsp;
    <a href="pagLogin.jsp">Hacer efectiva la Compra</a>&nbsp;&nbsp;&nbsp;<br><br>
    <table class="table table-hover">
        <thead>
            <tr class="text-white bg-dark">
                <td>Codigo</td>
                <td>Descripción</td>
                <td>Precio</td>
                <td>Cantidad</td>
                <td>Total</td>
                <td>Foto
            </tr>
        </thead>
        <c:forEach var="compra" items="${lista}">
            <tr>
                <td><c:out value="${compra.getCod()}" /></td>
                <td><c:out value="${compra.getNomart()}" /></td>
                <td><c:out value="${compra.getPrecio()}" /></td>
                <td><c:out value="${compra.getCantidad()}" /></td>
                <td><c:out value="${compra.total()}" /></td>
                <td><img src="images/<c:out value=${compra.getImagen()} width="80" height="70" /></td>
            </tr>
        </c:forEach>
        <tr>
            <td><b>Total de Compra:</b></td>
            <td></td>
            <td></td>
            <td></td>
            <td><c:out value="${totalCompra}" /></td>
        </tr>
    </table>
</center>
</body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Grafico de ventas</h1>
        <form action="Grafico2.jsp" target="zona">
            Ingrese año:<input name="tan" required>
            <input type="submit">
      
            <input type="radio" name="opc" value="bar" onclick="submit()">Barras
            <input type="radio" name="opc" value="pie" onclick="submit()">Circulo
            <input type="radio" name="opc" value="line" onclick="submit()" >Lineal
            <br>
        </form>
        <iframe name="zona" width="100%" height="500"></iframe>    
        
    </body>
</html>

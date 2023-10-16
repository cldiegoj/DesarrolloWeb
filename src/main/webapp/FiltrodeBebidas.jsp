<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filtro de Bebidas</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="js/filtrar.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>Filtrar Bebidas</h1>
        <a href="Principal.jsp">Regresar</a><br>
        <label>Ingrese nombre de la bebida:</label>
        <input id="txtnom">
        <br>
        <div id="tablares"></div>
        <script>
            function pasaSeleccion(cod, nom) {
                nombre = nom;
                window.location = "ctrlBebida?opc=1&cod=" + cod + "&nom=" + nombre;
            }
        </script>
    </body>
</html>
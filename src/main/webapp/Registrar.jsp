<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header>
            <%@include file="header_footer/Header.jsp" %>
        </header>



        <main class="carrito">
            <div class="header-content container">

                <div class="row justify-content-md-center align-items-center">
                    <!--Esto es lo que se repetir� para cada producto-->
                    <div class="col-5">
                        <div class="card">
                            <div>
                                <form method="post" action="ctrlUsuario">
                                    <input type="hidden" name="opc" value="1">
                                    <div class="mb-3">
                                        <label class="form-label">Nombres</label>
                                        <input type="text" class="form-control" name="nombres">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Apellidos</label>
                                        <input type="text" class="form-control" name="apellidos">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Nombre de Usuario</label>
                                        <input type="text" class="form-control" name="usrname">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Contrase�a</label>
                                        <input type="password" class="form-control" name="pass">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Documento de Identidad</label>
                                        <input type="text" class="form-control" name="dni">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Direcci�n de Correo Elect�nico</label>
                                        <input type="email" class="form-control" name="correo">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">N�mero de Tel�foro</label>
                                        <input type="text" class="form-control" name="telef">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Domicilio</label>
                                        <input type="text" class="form-control" name="dir">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Foto de perfil</label>
                                        <input type="file" class="form-control" name="img">
                                    </div>
                                    <input type="submit" class="btn btn-primary">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <section>
            <footer class="footer container">
                <%@include file="header_footer/Footer.jsp" %>
            </footer>
        </section>



        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

        <script src="js/script.js"></script>
    </body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<header>
		
		<?php
			include 'header/header.php';         
        ?>
	</header>



<main class="carrito">
	<div class="header-content container">

			<div class="row justify-content-md-center align-items-center">
				<!--Esto es lo que se repetirá para cada producto-->
				<div class="col-5">
					<div class="card">
						<div>
							<form method="post" action="../PHP/llamadas/proceso_usuario.php" enctype="multipart/form-data">
								<div class="mb-3">
							    <label class="form-label">Nombre y Apellidos</label>
							    <input type="text" class="form-control" name="apelnom">
							  </div>
							  <div class="mb-3">
							    <label class="form-label">Nombre de Usuario</label>
							    <input type="text" class="form-control" name="usrname">
							  </div>
							  <div class="mb-3">
							    <label class="form-label">Contraseña</label>
							    <input type="password" class="form-control" name="pass">
							  </div>
							  <div class="mb-3">
							    <label class="form-label">Documento de Identidad</label>
							    <input type="text" class="form-control" name="dni">
							  </div>
							  <div class="mb-3">
							    <label class="form-label">Dirección de Correo Electónico</label>
							    <input type="email" class="form-control" name="correo">
							  </div>
							  <div class="mb-3">
							    <label class="form-label">Número de Teléforo</label>
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
							  <button type="submit" class="btn btn-primary" name="action" value="Agregar">Crear</button>
							</form>
						</div>
					</div>
				</div>
			</div>
	</div>
</main>

	<section>
        <footer class="footer container">
            <?php
                include 'footer/footer.php';
            ?>
        </footer>
    </section>



    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <script src="../js/script.js"></script>
</body>
</html>
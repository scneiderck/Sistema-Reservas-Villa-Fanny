<?php include_once 'views/template/header-principal.php' ?>


<div class="page-title-area">
	<div class="container">
		<div class="page-title-content">
			<h2>reservas</h2>
		</div>
	</div>
</div>

<section class="news-area ptb-100">
	<div class="container">
		<div class="section-title">
			<span>verificar</span>
			<h2>verificar disponibilidad</h2>
		</div>
		<div class="col-lg-11">
			<div class="alert alert-<?php echo $data['tipo']; ?> alert-dismissible fade show" role="alert">
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

				<strong>respuesta!</strong> <?php echo $data['mensaje']; ?>
			</div>

			<input type="hidden" id="f_llegada" value="<?php echo $data['disponible']['f_llegada']; ?>">
			<input type="hidden" id="f_salida" value="<?php echo $data['disponible']['f_salida']; ?>">
			<input type="hidden" id="habitacion" value="<?php echo $data['disponible']['habitacion']; ?>">
			<div id='calendar'></div>-
		</div>
	</div>
	</div>
	</div>
</section>

<?php include_once 'views/template/footer-principal.php'; ?>

<script src="<?php echo RUTA_PRIN . 'assets/principal/js/pages/reservas.js'; ?>"></script>

</body>

</html>
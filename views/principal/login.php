<?php include_once 'views/template/header-principal.php' ?>
<div class="page-title-area">
    <div class="container">
        <div class="page-title-content">
            <h2>login</h2>
        </div>
    </div>
</div>

<section class="user-area-all-style log-in-area ptb-100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="contact-form-action">
                    <div class="form-heading text-center">
                        <h3 class="form-title">Login!</h3>
                    </div>
                    <form id="formulario" autocomplete="off">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <input class="form-control" type="text" name="nombre" placeholder="usuario o correo">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <input class="form-control" type="password" name="clave" placeholder="Password">
                                </div>
                            </div>
                            <div class="col-lg-12 col-sm-12">
                                <a class="forget" href="3">Olvidaste tu contraseña?</a>
                            </div>
                            <div class="col-12">
                                <button class="default-btn btn-two" type="submit">
                                    Login
                                    <i class="flaticon-right"></i>
                                </button>
                            </div>
                            <div class="col-12">
                                <p class="account-desc">
                                    No tienes una cuenta?
                                    <a href="<?php echo RUTA_PRIN . 'registro'; ?>">Registrarse</a>
                                </p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include_once 'views/template/footer-principal.php'; ?>

<script src="<?php echo RUTA_PRIN . 'assets/principal/js/pages/login.js'; ?>"></script>

</body>

</html>
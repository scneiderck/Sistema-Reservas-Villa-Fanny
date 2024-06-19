<?php include_once 'views/template/header-cliente.php'; ?>



<div class="card">
    <div class="card-body">
        <h4 class="card-title">Tus reservas</h4>
        <hr>
        <?php if (!empty($_SESSION['reserva'])) { ?>
<div
    class="alert alert-warning"
    role="alert"
>
    <strong>Reserva Pendiente</strong> <a href="<?php echo RUTA_PRINCIPAL . 'reserva/pendiente'; ?>">CLICK AQUI</a>
</div>

            <?php } ?>
        <div
            class="alert alert-info alert-dismissible fade show"
            role="alert"
        >
            <button
                type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="Close"
            ></button>
        
            <strong>Información</strong> Si deseas dejar una calificación doble click en la habitación
        </div>
        
        <div class="table-responsive">
            <table class="table table-primary nowrap" id="tblReservas" style="width: 100%;">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Fecha Llegada</th>
                        <th scope="col">Fecha Salida</th>
                        <th scope="col">Monto</th>
                        <th scope="col">Habitación</th>
                        <th scope="col">Método</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

    </div>
</div>

<div class="modal fade" id="modalTicket" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitleId">
                    Ticket
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <iframe frameborder="0" id="content-ticket" style="width: 100%;" height="400px"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                    Close
                </button>
            </div>
        </div>
    </div>
</div>

<?php include_once 'views/template/footer-cliente.php'; ?>

<script src="https://cdn.datatables.net/select/1.3.4/js/dataTables.select.min.js"></script>
<script src="<?php echo RUTA_PRINCIPAL . 'assets/admin/js/pages/clientes/reservas.js'; ?>"></script>

</body>

</html>
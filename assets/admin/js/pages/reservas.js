let tblReservas;
const myModal = new bootstrap.Modal(document.getElementById("modalTicket"));
const contentTicket = document.querySelector("#content-ticket");

document.addEventListener("DOMContentLoaded", function () {
  //cargar datos con el plugin datatables
  tblReservas = $("#tblReservas").DataTable({
    ajax: {
      url: base_url + "reservas/listar",
      dataSrc: "",
    },
    columns: [
      { data: "id" },
      { data: "estilo" },
      { data: "numero" },
      { data: "fecha_reserva" },
      { data: "monto" },
      { data: "cod_reserva" },
      { data: "fecha_ingreso" },
      { data: "fecha_salida" },
      { data: "cliente" },
      { data: "metodo" },
      {
        data: null,
        render: function (data, type, row) {
          return (
            '<button class="btn btn-danger btn-generar-ticket btn-sm" data-id="' +
            row.id +
            '">Ticket</button>'
          );
        },
      },
      {
        data: null,
        render: function (data, type, row) {
          return (
            '<button class="btn btn-danger btn-sm" onclick="eliminarReserva(' +
            row.id +
            ')"><i class="fas fa-trash"></i></button>'
          );
        },
      },
    ],
    language: {
      url: "//cdn.datatables.net/plug-ins/2.0.2/i18n/es-ES.json",
    },
    responsive: true,
    order: [[0, "desc"]],
    dom: "Pfrtip", // Agregar los botones de SearchPanes
    searchPanes: {
      cascadePanes: true,
      viewTotal: true,
      columns: [1, 9]
    },
    initComplete: function () {
      var counts = {};

      // Count the number of entries for each office
      tblReservas
        .column(1, { search: "applied" })
        .data()
        .each(function (val) {
          if (counts[val]) {
            counts[val] += 1;
          } else {
            counts[val] = 1;
          }
        });

      // And map it to the format highcharts uses
      var countMap = $.map(counts, function (val, key) {
        return {
          name: key,
          y: val,
        };
      });

      // Crear el gráfico de Highcharts
      Highcharts.chart("highcharts-container", {
        // Configura tus datos aquí
        chart: {
          type: "pie",
        },
        title: {
          text: "Título del Gráfico",
        },
        series: [
          {
            data: countMap,
          },
        ],
      });
    },
  });

  // Agregar evento al botón para generar reporte por fila
  document
    .getElementById("tblReservas")
    .addEventListener("click", function (event) {
      var target = event.target;
      if (target.classList.contains("btn-generar-ticket")) {
        var id = target.getAttribute("data-id");
        generarReporte(id);
      }
    });
});

function generarReporte(id) {
  contentTicket.src = ruta_principal + "dashboard/ticket/" + id;
  myModal.show();
}
function eliminarReserva(idReserva) {
  Swal.fire({
      title: '¿Estás seguro?',
      text: "¿Quieres eliminar esta reserva?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar'
  }).then((result) => {
      if (result.isConfirmed) {
          $.ajax({
              type: "POST",
              url: base_url + "Reservas/eliminarReserva/" + idReserva,
              success: function(response) {
                  response = JSON.parse(response);
                  alertaSW(response.msg, response.type);
                  if (response.type === 'success') {
                      $('#tblReservas').DataTable().ajax.reload();
                  }
              },
              error: function() {
                  alertaSW("Error al eliminar la reserva.", "error");
              }
          });
      }
    });
}
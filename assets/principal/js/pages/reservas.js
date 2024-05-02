document.addEventListener('DOMContentLoaded', function () {
  const f_llegada = document.querySelector('#f_llegada');
  const f_salida = document.querySelector('#f_salida');
  const habitacion = document.querySelector('#habitacion');

  // Verificar si los elementos existen antes de acceder a sus propiedades
  if (f_llegada && f_salida && habitacion) {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      locale: 'es',
      navLinks: true,
      businessHours: true,
      editable: true,
      selectable: true,
      events: base_url + 'reserva/listar/' + f_llegada.value + '/' + f_salida.value + '/' + habitacion.value
    });

    calendar.render(); 
  }
});

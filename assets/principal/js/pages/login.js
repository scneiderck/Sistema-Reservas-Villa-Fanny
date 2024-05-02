document.addEventListener('DOMContentLoaded', function () {
    const frm = document.querySelector('#formulario');

    frm.addEventListener('submit', function (e) {
        e.preventDefault();


        // Verifica si hay campos vacíos
        if (frm.nombre.value == '' || frm.clave.value == '') {
            alert('Todos los campos son requeridos');
            return;
        }

        // Si todo está bien, envía el formulario mediante AJAX
        const http = new XMLHttpRequest();
        const url = base_url + 'login/verify';
        http.open('POST', url, true);
        http.onreadystatechange = function () {
        };
    });
});

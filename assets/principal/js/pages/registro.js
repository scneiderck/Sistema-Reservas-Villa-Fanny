document.addEventListener('DOMContentLoaded', function () {
    const frm = document.querySelector('#formulario');

    frm.addEventListener('submit', function (e) {
        e.preventDefault();

        // Verifica si se han aceptado los términos y condiciones
        if (!frm.chb2.checked) {
            alert('Debes aceptar los términos y condiciones para registrarte');
            return;
        }

        // Verifica si las contraseñas coinciden
        if (frm.clave.value !== frm.confirmar.value) {
            alert('Las contraseñas no coinciden');
            return;
        }

        // Verifica si hay campos vacíos
        if (frm.nombre.value == '' || frm.apellido.value == ''
            || frm.usuario.value == '' || frm.correo.value == ''
            || frm.clave.value == '' || frm.confirmar.value == '') {
            alert('Todos los campos son requeridos');
            return;
        }

        // Si todo está bien, envía el formulario mediante AJAX
        const http = new XMLHttpRequest();
        const url = base_url + 'registro/crear';
        http.open('POST', url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText);
                // Si el registro es exitoso, muestra un mensaje de confirmación
                if (this.responseText.trim() === 'Registro exitoso') {
                    alert('Usuario registrado');
                    // Limpia los campos del formulario
                    frm.reset();
                }
            }
        };
    });
});

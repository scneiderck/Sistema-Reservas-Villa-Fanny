<?php
class Registro extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data['title'] = 'registro';
        $this->views->getView('principal/registro', $data);
    }
    
    public function crear() {
        $campos = ['nombre', 'apellido', 'usuario', 'correo', 'clave', 'confirmar'];
        foreach ($campos as $campo) {
            if (empty($_POST[$campo])) {
                echo 'Todos los campos son requeridos';
                return;
            }
        }
        
        $nombre = strClean($_POST['nombre']);
        $apellido = strClean($_POST['apellido']);
        $usuario = strClean($_POST['usuario']);
        $correo = strClean($_POST['correo']);
        $clave = strClean($_POST['clave']);
        $confirmar = strClean($_POST['confirmar']);  
        
        if ($clave !== $confirmar) {
            echo 'Las contraseñas no coinciden';
            return;
        }

        $hash = password_hash($clave, PASSWORD_DEFAULT);
        $rol = 2;
        
        $this->model->registrarse($nombre, $apellido, $usuario, $correo, $hash, $rol);
        
        echo 'Registro exitoso';
    }
}
?>

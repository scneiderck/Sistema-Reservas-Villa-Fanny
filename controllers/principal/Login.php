<?php
class Login extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data['title'] = 'Inicio de sesión';
        $this->views->getView('principal/login', $data);
    }

    public function verificar()
    {
        $usuario = strClean($_POST['usuario']);
        $clave = strClean($_POST['clave']);
    
        // Verifica si los campos están vacíos
        if (empty($usuario) || empty($clave)) {
            echo 'Todos los campos son requeridos';
            return;
        }
    
        // Verifica las credenciales en la base de datos
        if ($this->model->verificarCredenciales($usuario, $clave)) {
            echo 'Inicio de sesión exitoso'; // Mensaje de inicio de sesión exitoso
        } else {
            echo 'Error en los datos de inicio de sesión'; // Mensaje de error en los datos
        }
    }
    
}
?>

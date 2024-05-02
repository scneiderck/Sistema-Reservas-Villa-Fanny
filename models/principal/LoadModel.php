<?php
class LoadModel extends Query
{
    public function __construct()
    {
        parent::__construct();
    }

    public function verificarCredenciales($usuario, $clave)
    {
        // Realiza la consulta para verificar las credenciales
        $sql = "SELECT * FROM usuarios WHERE usuario = ?";
        $result = $this->select($sql, [$usuario]);

        if ($result) {
            // Si se encontró un usuario con el nombre proporcionado, verifica la contraseña
            $usuarioRegistrado = $result[0];
            if (password_verify($clave, $usuarioRegistrado['clave'])) {
                // La contraseña es correcta
                return true;
            }
        }

        // Las credenciales son incorrectas
        return false;
    }
}
?>

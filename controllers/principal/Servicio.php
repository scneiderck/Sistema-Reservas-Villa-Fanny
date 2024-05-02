<?php
class servicio extends Controller{
    public function __construct() {
        parent::__construct();
    }
    public function index() {
        $data['title'] = 'servicios';
        $this->views->getView('principal/servicios/index', $data);
    }
}
?>
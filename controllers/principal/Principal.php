<?php
class Principal extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }
    public function index()
    {
        $data['title'] = 'pagina principal';
        //TRAER SLIDERS
        $data['slider'] = $this->model->getSlider();
        $this->views->getView('index', $data);
        //TRAER HABITACIONES
        $data['habitaciones'] = $this->model->getHabitaciones();
        $this->views->getView('index', $data);
    }

}
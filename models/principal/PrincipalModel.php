<?php
class PrincipalModel extends Query{
    
    public function __construct() {
        parent::__construct();
    }
    //RECUPERAR LOS SLIDERS
    public function getSlider() {
        return $this->selectAll("SELECT * FROM slider");
    }
    //RECUPERAR LOS HABITACIONES
    public function getHabitaciones() {
        return $this->selectAll("SELECT * FROM habitaciones");
    }

}
?>
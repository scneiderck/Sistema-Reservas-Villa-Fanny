<?php
class Blog extends Controller{
    public function __construct() {
        parent::__construct();
    }
    public function index() {
        $data['title'] = 'Blog';
        $this->views->getView('principal/Blog/index', $data);
    }
}
?>
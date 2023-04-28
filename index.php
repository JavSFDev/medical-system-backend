<?php
/* Mostrar errores */
    ini_set('display_errors',1);
    ini_set("log_errors",1);
    ini_set("error_log","C:/xampp/htdocs/clinic2/php_error_log");
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: *");
    header("Access-Control-Allow-Methods: *");
    /* Requerimientos */
require_once "models/MySQLConnect.php";

//Agregar todos los modelos
require_once "models/RolModel.php";
require_once "models/UserModel.php";
require_once "models/EspecialidadModel.php";
require_once "models/ConsultaModel.php";
require_once "models/CitaModel.php";


//Agregar todos los controladores
require_once "controllers/UserController.php";
require_once "controllers/UsuarioController.php";
require_once "controllers/EspecialidadController.php";
require_once "controllers/ConsultaController.php";


//require_once "controllers/CatAlergiaController.php";
//require_once "controllers/AlergiaController.php";
//require_once "controllers/EnfermedadController.php";
//require_once "controllers/MedicamentoController.php";
require_once "controllers/CitaController.php";

    
    require_once "controllers/RoutesController.php";
    $index=new RoutesController();
    $index->index();


<?php 
class cita{
    public function get($id){
        //Obtener elemento
        $cita=new CitaModel();
        //Obtener una pelicula
        $response=$cita->get($id);
        //Si hay respuesta
        if(isset($response) && !empty($response)){
            //Armar el json
            $json=array(
                'status'=>200,
                'results'=>$response
            );
        }else{
            $json=array(
                'status'=>400,
                'results'=>"No existe el recurso solicitado"
            );
        }
        echo json_encode($json,
                http_response_code($json["status"])
            );
    }

        //POST
    public function create( ){
        $inputJSON=file_get_contents('php://input');
        $object = json_decode($inputJSON); 
        $cita=new CitaModel();
        $response=$cita->create($object);
        if(isset($response) && !empty($response)){
            $json=array(
                'status'=>200,
                'results'=>$response
            );
        }else{
            $json=array(
                'status'=>400,
                'results'=>"No se creo el recurso"
            );
        }
        echo json_encode($json,
        http_response_code($json["status"]));   
    }
}
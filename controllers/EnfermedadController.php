<?php 
class enfermedad{
    //Listar en el API
    public function index(){
        //Obtener el listado del Modelo
        $enfermedad=new EnfermedadModel();
        $response=$enfermedad->all();
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
                'results'=>"No hay registros"
            );
        }
        echo json_encode($json,
                http_response_code($json["status"])
            );
    }
    //Obtener en el API
    public function get($id){
        //Obtener elemento
        $enfermedad=new EnfermedadModel();
        //Obtener una pelicula
        $response=$enfermedad->get($id);
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
            $enfermedad=new EnfermedadModel();
            $response=$enfermedad->create($object);
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
        //PUT
        public function update(){
            $inputJSON=file_get_contents('php://input');
            $object = json_decode($inputJSON); 
            $enfermedad=new EnfermedadModel();
            $response=$enfermedad->update($object);
            if(isset($response) && !empty($response)){
                $json=array(
                    'status'=>200,
                    'results'=>$response
                );
            }else{
                $json=array(
                    'status'=>400,
                    'total'=>0,
                    'results'=>"No se actualizo el recurso"
                );
            }
            echo json_encode($json,
            http_response_code($json["status"]));
            
        }
}
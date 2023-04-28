<?php 
class alergia{
    //Listar en el API
    public function index(){
        //Obtener el listado del Modelo
        $alergia=new AlergiaModel();
        $response=$alergia->all();
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
        $alergia=new AlergiaModel();
         //Obtener una pelicula
        $response=$alergia->get($id);
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

    public function getForm($id){
        //Obtener elemento
        $alergia=new AlergiaModel();
        //Obtener una alergia
        $response=$alergia->getForm($id);
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
        $alergia=new AlergiaModel();
        $response=$alergia->create($object);
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
        $alergia=new AlergiaModel();
        $response=$alergia->update($object);
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
<?php 
class consulta{
    //Listar en el API
    public function index(){
        //Obtener el listado del Modelo
        $ConsultaModel=new ConsultaModel();
        $response=$ConsultaModel->all();
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

    public function get($param){
        
        $consulta=new ConsultaModel();
        $response=$consulta->get($param);
        $json=array(
            'status'=>200,
            'results'=>$response
        );
       echo json_encode($json,
        http_response_code($json["status"]));
        
    }

    //Obtener en el API
    public function getMed($id){
        //Obtener elemento
        $consulta=new ConsultaModel();
        $json=array(
            'status'=>400,
            'results'=>"Solicitud sin identificador"
        );
        if(isset($id) && !empty($id) && $id!=='undefined' && $id!=='null'){
         //Obtener una consulta
            $response=$consulta->getMed($id);
            //Si hay respuesta
            if(isset($response) && !empty($response) && $response!==null ){
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
    }

    /*public function getForm($id){
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
    }*/

    //POST
    public function create( ){
        $inputJSON=file_get_contents('php://input');
        $object = json_decode($inputJSON); 
        $consulta=new ConsultaModel();
        $response=$consulta->create($object);
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
        $consulta=new ConsultaModel();
        $response=$consulta->update($object);
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
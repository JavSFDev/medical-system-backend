<?php
//class User
class usuario{
    //Listar en el API
    public function index(){
        //Obtener el listado del Modelo
        $usuario=new UserModel();
        $response=$usuario->all();
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
    public function getForm($param){
        
        $usuario=new UserModel();
        $response=$usuario->getFormU($param);
        $json=array(
            'status'=>200,
            'results'=>$response
        );
       echo json_encode($json,
        http_response_code($json["status"]));
        
    }

    public function update($param){
        $usuario=new UserModel();
        $response=$usuario->get($param);
        $json=array(
            'status'=>200,
            'results'=>$response
        );
       echo json_encode($json,
        http_response_code($json["status"]));
        
    }
}
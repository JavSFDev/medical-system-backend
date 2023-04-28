<?php 
class categoria{
    //Listar en el API
    public function index(){
        //Obtener el listado del Modelo
        $categoria=new CatAlergiaModel();
        $response=$categoria->all();
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
        $categoria=new CatAlergiaModel();
        //Obtener una pelicula
        $response=$categoria->get($id);
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

    public function getCategoriaAlergia($id){
        $categoria=new CatAlergiaModel();
        $response=$categoria->getCategoriaAlergia($id);
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
        http_response_code($json["status"]);
        echo json_encode($json);
    }
}
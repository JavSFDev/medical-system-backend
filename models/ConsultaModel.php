<?php
class ConsultaModel
{
    public $enlace;
    public function __construct()
    {
        $this->enlace = new MySqlConnect();
    }
    /*Listar */
   /* public function all(){
        try {
            //Consulta sql
			$vSql = "SELECT a.idAlergia, a.nombre AS nombreA, c.nombre AS nombreC
            FROM alergia a
            JOIN categoriaalergia c ON a.idCategoria = c.idCategoria order by a.nombre desc;";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ($vSql);
				
			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }*/

    public function get($id){
        try {
			$especialidadM=new EspecialidadModel();
			$this->enlace->connect();
            //Consulta sql
			$vSql = "SELECT * FROM consulta where idConsulta=$id";
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
			if($vResultado){
				$vResultado=$vResultado[0];
				$esp=$especialidadM->getEspecialidadConsulta($id);
				$vResultado->especialidad=$esp;
				// Retornar el objeto
				return $vResultado;
			}else{
				return null;
			}
			
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }


   /* public function getForm($id)
    {
        try {

            //Consulta sql
			$vSql = "SELECT * FROM consulta where idMedico=$id";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
            $vResultado = $vResultado[0];
            
			if((isset($vResultado)) && !empty($vResultado) && is_object($vResultado[0]) && $vResultado!==null){
				{
					$vResultado = $vResultado[0];
					// Retornar el objeto
					return $vResultado;
				}
			} 
		}catch ( Exception $e ) {
			return (false);
			//die ( $e->getMessage () );
		}
    }
    */

    public function getMed($id)
    {
        try {
            //Consulta sql
			$vSql = "SELECT * FROM consulta where idMedico=$id";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
            $vResultado = $vResultado[0];
			// Retornar el objeto
			return $vResultado;
        }
        catch ( Exception $e ) {
                return (false);
                //die ( $e->getMessage () );
            }
    }

    /*public function getForm($id)
    {
        try {
            $categoriaM=new CatAlergiaModel();
            //$actorM=new ActorModel();
            //Consulta sql
			$vSql = "SELECT * FROM alergia where idAlergia=$id order by nombre desc";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
            $vResultado = $vResultado[0];
            //Lista de categoria de la alergia
            $categorias=$categoriaM->getCategoriaAlergia($id);
            //Array con el id de los generos
            if(!empty($categoriaalergias)){
                $categorias = array_column($categorias, 'id');
            }else{
               $categorias=[]; 
            }
            //Propiedad que se va a agregar al objeto
            $vResultado->categorias=$categorias;

			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }*/

    public function create($objeto) {
        try {
            //Consulta sql
            //Identificador autoincrementable
			$vSql = "Insert into consulta (idMedico,idEspecialidad,precio,ubicacion) 
            Values ('$objeto->idMedico','$objeto->idEspecialidad','$objeto->precio','$objeto->ubicacion')";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->executeSQL_DML_last( $vSql);
			// Retornar el objeto creado
            return $this->get($vResultado);
		} catch ( Exception $e ) {
			//die ( $e->getMessage () );
            return(null);
		}
    }
    public function update($objeto) {
        try {
            //Consulta sql
            $this->enlace->connect();
			$vSql = "Update consulta SET 
            idEspecialidad ='$objeto->idEspecialidad', 
            precio ='$objeto->precio',
            ubicacion ='$objeto->ubicacion'
            Where idConsulta=$objeto->idConsulta";
			
            //Ejecutar la consulta
			$vResultado = $this->enlace->executeSQL_DML( $vSql);
			// Retornar el objeto actualizado
            return $this->getConsulta($objeto->idConsulta);
		} catch ( Exception $e ) {
            return(null);
			//die ( $e->getMessage () );
		}
    }
}
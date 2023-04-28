<?php
class AlergiaModel
{
    public $enlace;
    public function __construct()
    {
        $this->enlace = new MySqlConnect();
    }
    /*Listar */
    public function all(){
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
    }

    public function get($id)
    {
        try {
            $cateM=new CatAlergiaModel();
            //Consulta sql
			$vSql = "SELECT * FROM alergia where idAlergia=$id order by nombre desc";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
            $vResultado = $vResultado[0];

            //categoria
            $cate=$cateM->get($vResultado->idCategoria);
            //Propiedad que se va a agregar al objeto
            $vResultado->categoria= $cate;
			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }

    public function getForm($id)
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
    }
    public function getbyCategoriaAlergia($id)
    {
       try {
            //Consulta sql
			$vSql = "SELECT ca.nombre FROM categoriaalergia ca
            JOIN alergia ON ca.idCategoria = alergia.idCategoria
            WHERE alergia.idAlergia = $id";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
            
			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }

    public function create($objeto) {
        try {
            //Consulta sql
            //Identificador autoincrementable
			$vSql = "Insert into alergia (nombre,idCategoria)".
                    "Values ('$objeto->nombre','$objeto->idCategoria')";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->executeSQL_DML_last( $vSql);
			// Retornar el objeto creado
            return $this->get($vResultado);
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }
    public function update($objeto) {
        try {
            //Consulta sql
			$vSql = "Update alergia SET nombre ='$objeto->nombre', idCategoria ='$objeto->idCategoria'".
              "Where idAlergia=$objeto->idAlergia";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->executeSQL_DML( $vSql);
			// Retornar el objeto actualizado
            return $this->get($objeto->idAlergia);
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }
}
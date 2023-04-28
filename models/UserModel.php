<?php
class UserModel{
    public $enlace;
    public function __construct() {
        
        $this->enlace=new MySqlConnect();
       
    }
    /*public function all(){
        try {
            //Consulta sql
			$vSql = "SELECT * FROM user;";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
				
			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }
	*/
	public function all(){
        try {
            //Consulta sql			
			$vSql = "SELECT u.id, u.name, u.apellido1, u.email, r.name AS nombreR FROM user u
            JOIN rol r ON r.id = u.id order by u.name desc;";
			
			//$vSql = "SELECT * FROM user;";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
				
			// Retornar el objeto
			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }

    public function get($id){
        try {
			$rolM=new RolModel();
			$this->enlace->connect();
            //Consulta sql
			$vSql = "SELECT * FROM user where id=$id";
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
			if($vResultado){
				$vResultado=$vResultado[0];
				$rol=$rolM->getRolUser($id);
				$vResultado->rol=$rol;
				// Retornar el objeto
				return $vResultado;
			}else{
				return null;
			}
			
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }

	public function getForm($id)
    {
        try {

            //Consulta sql
			$vSql = "SELECT * FROM user where id=$id";
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

	public function getFormU($id)
    {
        try {
			$rolM=new RolModel();
            //Consulta sql
			$vSql = "SELECT cedula, name, apellido1, apellido2, email, sexo, rol_id FROM user where id=$id";
            //Ejecutar la consulta
			$this->enlace->connect();
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
			if($vResultado){
				$vResultado=$vResultado[0];
				$rol=$rolM->getRolUser($id);
				$vResultado->rol=$rol;
				// Retornar el objeto
				return $vResultado;
			}else{
				return null;
			}
			
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }


    public function login($objeto) {
        try {
            
			$vSql = "SELECT * from user where email='$objeto->email'";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
			if((isset($vResultado)) && !empty($vResultado) && is_object($vResultado[0])){
				$user=$vResultado[0];
				if(password_verify($objeto->password, $user->password))  
                    {
						return $this->get($user->id);
					}

			}else{
				return false;
			}
           
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }
    public function create($objeto) {
        try {
			if(isset($objeto->password)&& $objeto->password!=null){
				$crypt=password_hash($objeto->password, PASSWORD_BCRYPT);
				$objeto->password=$crypt;
			}
            //Consulta sql            
			$vSql = "Insert into user (cedula,name,apellido1,apellido2,email,password,sexo,rol_id)
			Values ('$objeto->cedula','$objeto->name','$objeto->apellido1','$objeto->apellido2','$objeto->email','$objeto->password','$objeto->sexo','$objeto->rol_id')";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->executeSQL_DML_last( $vSql);
			// Retornar el objeto creado
            return $this->get($vResultado);
		} catch ( Exception $e ) {
			return (null);
			//die ( $e->getMessage () );
		}
    }

	public function update($objeto) {
        try {
            //Consulta sql
            $this->enlace->connect();
			$sql = "Update user SET 
			cedula ='$objeto->cedula',
			name ='$objeto->name',
			apellido1 ='$objeto->apellido1',
			apellido2 ='$objeto->apellido2',
			email ='$objeto->email',
			password ='$objeto->password',
			sexo ='$objeto->sexo',
			rol_id ='$objeto->rol_id'
            Where id=$objeto->id";
			
            //Ejecutar la consulta
			$cResults = $this->enlace->executeSQL_DML( $sql);
            //--- Tallas ---
            //Borrar Tallas existentes asignadas
           //$this->enlace->connect();
			//$sql = "Delete from bicicleta_talla Where idBicicleta=$objeto->idBicicleta";
			//$cResults = $this->enlace->executeSQL_DML( $sql);

             //Crear elementos a insertar en tallas
            /* foreach( $objeto->tallas as $talla){
                $dataTallas[]=array($objeto->idBicicleta,$talla);
            }
            foreach($dataTallas as $row){
                $this->enlace->connect();
                $valores=implode(',', $row);
                $sql = "INSERT INTO bicicleta_talla(idBicicleta,idTalla) VALUES(".$valores.");";
                $vResultado = $this->enlace->executeSQL_DML($sql);
            }
			*/
            //Retornar usuario
            return $this->get($objeto->id);
		} catch ( Exception $e ) {
			return (null);
			//die ( $e->getMessage () );
		}
    }
}
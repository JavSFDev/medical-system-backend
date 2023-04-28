<?php
class CitaModel
{
    public $enlace;
    public function __construct()
    {
        $this->enlace = new MySqlConnect();
    }	

    /*Obtener */
    public function get($id)
    {
        try {
            //Consulta sql
            $vSql = "SELECT * FROM cita where idCita=$id";
            $this->enlace->connect();
            //Ejecutar la consulta
            $vResultado = $this->enlace->ExecuteSQL ( $vSql);
            $vResultado = $vResultado[0];
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
			$vSql = "Insert into cita (idMedico,fecha,hora,estado)".
                    "Values ('$objeto->idMedico','$objeto->fecha',".
                    "'$objeto->hora','$objeto->estado')";
			$this->enlace->connect();
            //Ejecutar la consulta
			$vResultado = $this->enlace->executeSQL_DML_last( $vSql);
			// Retornar el objeto creado
            return $this->get($vResultado);
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }

    

}
<?php
namespace Models;
class Conexion{
    private string $host = "localhost";
    private string $port = "3307";
    private string $db = "melamiservice";
    private string $user = "root";
    private string $password = "123456";

    public function conectar()
    {
        try {
            $cn = new \mysqli($this->host, $this->user, $this->password, $this->db, $this->port);
            return $cn;
        } catch (\Throwable $th) {
            return ['error' => $th->getMessage()];
        }
    }

}
?>
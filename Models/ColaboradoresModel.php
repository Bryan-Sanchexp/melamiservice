<?php

namespace Models;

require_once "Conexion.php";

use Models\Conexion;


class Colaboradores extends Conexion
{
    private int $id;
    private int $id_acceso;
    private string $nombre;
    private string $apellidos;
    private string $direccion;
    private string $telefono;
    private string $celular;
    private string $localizacion;
    private string $dni_propietario;
    private string $rol;
    private int $estado;


    public function mostrar()
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_R_T_COLABORADORES()");
        $stmt->execute();
        $rs = $stmt->get_result();
        $result = [];
        while ($result[] = $rs->fetch_assoc());
        array_pop($result);
        $stmt->close();
        return $result;
    }
    public function agregar(string $correo,string $contrasena)
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_C_T_COLABORADORES(?,?,?,?,?,?,?,?,?,?)");
        $stmt->bind_param("ssssssssss", $this->nombre, $this->apellidos,$this->direccion,$this->telefono,$this->celular,$this->localizacion,$this->dni_propietario,$this->rol,$contrasena,$correo);
        $stmt->execute();
        $response = $stmt->error == '' ? true : false;
        $stmt->close();
        return $response;
    }

    public function eliminar()
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_D_T_COLABORADOR(?)");
        $stmt->bind_param("i", $this->id);
        $stmt->execute();
        $response = $stmt->error == '' ? ['success' => 'Colaborador eliminado correctamente'] : ['error' => 'El colaborador no se eliminó'];
        $stmt->close();
        return $response;
    }

    public function rankingDashboard(string $fechaInicio, string $fechaFin){
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_DASHBOARD_RANKIN_BODEGAS(?,?)");
        $stmt->bind_param("ss", $fechaInicio, $fechaFin);
        $stmt->execute();
        $rs = $stmt->get_result();
        $result = [];
        while ($result[] = $rs->fetch_assoc());
        array_pop($result);
        $stmt->close();
        return $result;
    }


    /**
     * Get the value of id
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * Set the value of id
     */
    public function setId(int $id): self
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of id_acceso
     */
    public function getIdAcceso(): int
    {
        return $this->id_acceso;
    }

    /**
     * Set the value of id_acceso
     */
    public function setIdAcceso(int $id_acceso): self
    {
        $this->id_acceso = $id_acceso;

        return $this;
    }

    /**
     * Get the value of ruc
     */
    public function getNombre(): string
    {
        return $this->nombre;
    }

    /**
     * Set the value of ruc
     */
    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get the value of nombre
     */
    public function getApellidos(): string
    {
        return $this->apellidos;
    }

    /**
     * Set the value of nombre
     */
    public function setApellidos(string $apellidos): self
    {
        $this->apellidos = $apellidos;

        return $this;
    }

    /**
     * Get the value of direccion
     */
    public function getDireccion(): string
    {
        return $this->direccion;
    }

    /**
     * Set the value of direccion
     */
    public function setDireccion(string $direccion): self
    {
        $this->direccion = $direccion;

        return $this;
    }

    /**
     * Get the value of telefono
     */
    public function getTelefono(): string
    {
        return $this->telefono;
    }

    /**
     * Set the value of telefono
     */
    public function setTelefono(string $telefono): self
    {
        $this->telefono = $telefono;

        return $this;
    }

    /**
     * Get the value of celular
     */
    public function getCelular(): string
    {
        return $this->celular;
    }

    /**
     * Set the value of celular
     */
    public function setCelular(string $celular): self
    {
        $this->celular = $celular;

        return $this;
    }

    /**
     * Get the value of localizacion
     */
    public function getLocalizacion(): string
    {
        return $this->localizacion;
    }

    /**
     * Set the value of localizacion
     */
    public function setLocalizacion(string $localizacion): self
    {
        $this->localizacion = $localizacion;

        return $this;
    }

    /**
     * Get the value of dni_propietario
     */
    public function getDniPropietario(): string
    {
        return $this->dni_propietario;
    }

    /**
     * Set the value of dni_propietario
     */
    public function setDniPropietario(string $dni_propietario): self
    {
        $this->dni_propietario = $dni_propietario;

        return $this;
    }

    /**
     * Get the value of nombre_propietario
     */
    public function getRol(): string
    {
        return $this->rol;
    }

    /**
     * Set the value of nombre_propietario
     */
    public function setRol(string $rol): self
    {
        $this->rol = $rol;

        return $this;
    }

    /**
     * Get the value of estado
     */
    public function getEstado(): int
    {
        return $this->estado;
    }

    /**
     * Set the value of estado
     */
    public function setEstado(int $estado): self
    {
        $this->estado = $estado;

        return $this;
    }
}

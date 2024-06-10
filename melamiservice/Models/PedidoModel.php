<?php

namespace Models;

require_once "Conexion.php";

use Models\Conexion;


class Pedido extends Conexion
{
    private int $id;
    private string $cliente;
    private string $ciudad;
    private string $direccion;
    private string $telefono;
    private string $correo;
    private string $fecha;

    public function mostrar()
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_R_T_PEDIDOS()");
        $stmt->execute();
        $rs = $stmt->get_result();
        $result = [];
        while ($result[] = $rs->fetch_assoc());
        array_pop($result);
        $stmt->close();
        
        return $result;
    }
    
    public function agregar()
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_C_T_PEDIDOS(?,?,?,?,?,?)");
        $stmt->bind_param("ssssss", $this->cliente,$this->ciudad,$this->direccion,$this->telefono,$this->correo,$this->fecha);
        $stmt->execute();
        $response = $stmt->error == '' ? ['success' => 'Pedido agregado correctamente'] : ['error' => 'El pedido no se agregó'];
        $stmt->close();
        return $response;
    }

    public function eliminar()
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_D_T_PEDIDO(?)");
        $stmt->bind_param("i", $this->id);
        $stmt->execute();
        $response = $stmt->error == '' ? ['success' => 'Pedido eliminado correctamente'] : ['error' => 'El pedido no se eliminó'];
        $stmt->close();
        return $response;
    }

    public function setId(int $id): self
    {
        $this->id = $id;

        return $this;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function setCliente(string $cliente): self
    {
        $this->cliente = $cliente;

        return $this;
    }
    public function getCliente(): string
    {
        return $this->cliente;
    }
    public function setCiudad(string $ciudad): self
    {
        $this->ciudad = $ciudad;

        return $this;
    }
    public function getCiudad(): string
    {
        return $this->ciudad;
    }
    public function setDireccion(string $direccion): self
    {
        $this->direccion = $direccion;

        return $this;
    }
    public function getDireccion(): string
    {
        return $this->direccion;
    }
    public function setTelefono(string $telefono): self
    {
        $this->telefono = $telefono;

        return $this;
    }
    public function getTelefono(): string
    {
        return $this->telefono;
    }

    public function setCorreo(string $correo): self
    {
        $this->correo = $correo;

        return $this;
    }
    public function getCorreo(): string
    {
        return $this->correo;
    }

    public function setFecha(string $fecha): self
    {
        $this->fecha = $fecha;

        return $this;
    }
    public function getFecha(): string
    {
        return $this->fecha;
    }

    
}
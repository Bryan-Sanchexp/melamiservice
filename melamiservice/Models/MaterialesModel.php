<?php

namespace Models;

require_once "Conexion.php";

use Models\Conexion;

class Materiales extends Conexion
{
    private int $id;
    private string $nombre;
    private string $marca;
    private int $precio;
    private int $stock;

    public function mostrar()
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_R_T_MATERIALES()");
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
        $stmt = $cn->prepare("CALL SP_C_T_MATERIALES(?,?,?,?)");
        $stmt->bind_param("sss", $this->nombre,$this->marca, $this->precio, $this->stock);
        $stmt->execute();
        $response = $stmt->error == '' ? ['success' => 'Material agregado correctamente'] : ['error' => 'El material no se agregó'];
        $stmt->close();
        return $response;
    }

    public function eliminar()
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_D_T_MATERIALES(?)");
        $stmt->bind_param("i", $this->id);
        $stmt->execute();
        $response = $stmt->error == '' ? ['success' => 'Categoría eliminada correctamente'] : ['error' => 'La categoría no se eliminó'];
        $stmt->close();
        return $response;
    }

    public function actualizar()
    {
        $cn = $this->conectar();
        $stmt = $cn->prepare("CALL SP_U_T_MATERIALES(?,?,?,?,?)");
        $stmt->bind_param("isss", $this->id, $this->nombre,$this->marca, $this->precio, $this->stock);
        $stmt->execute();
        $response = $stmt->error == '' ? ['success' => 'Material actualizado correctamente'] : ['error' => 'El material no se actualizó'];
        $stmt->close();
        return $response;
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
     * Get the value of nombre
     */
    public function getNombre(): string
    {
        return $this->nombre;
    }

    /**
     * Set the value of nombre
     */
    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

     /**
     * Get the value of marca
     */
    public function getMarca(): string
    {
        return $this->marca;
    }

    /**
     * Set the value of marca
     */
    public function setMarca(string $marca): self
    {
        $this->marca = $marca;

        return $this;
    }

    /**
     * Get the value of precio
     */
    public function getPrecio(): int
    {
        return $this->precio;
    }

    /**
     * Set the value of precio
     */
    public function setPrecio(int $precio): self
    {
        $this->precio = $precio;

        return $this;
    }

     /**
     * Get the value of stock
     */
    public function getStock(): int
    {
        return $this->stock;
    }

    /**
     * Set the value of stock
     */
    public function setStock(int $stock): self
    {
        $this->stock = $stock;

        return $this;
    }
}

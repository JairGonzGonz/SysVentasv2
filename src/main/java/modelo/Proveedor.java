package modelo;

import java.sql.Timestamp;

public class Proveedor {

    private String RUCProveedor; // Cambiamos el tipo a String para el RUC
    private String razonSocial;
    private String razonComercial;
    private String correo; // Agregamos el campo correo
    private String telefono;
    private int diasCredito; // Agregamos el campo diasCredito
    private String contacto1; // Agregamos los campos de contacto
    private String telefonoC1;
    private String contacto2;
    private String telefonoC2;
    private java.sql.Timestamp fechaRegistro; // Usamos Timestamp para fecha y hora

    // Constructor
    public Proveedor() {

    }

    public Proveedor(String RUCProveedor, String razonSocial, String razonComercial, String correo, String telefono) {
        this.RUCProveedor = RUCProveedor;
        this.razonSocial = razonSocial;
        this.razonComercial = razonComercial;
        this.correo=correo;
        this.telefono = telefono;
    }

    public String getRUCProveedor() {
        return RUCProveedor;
    }

    public void setRUCProveedor(String RUCProveedor) {
        this.RUCProveedor = RUCProveedor;
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getRazonComercial() {
        return razonComercial;
    }

    public void setRazonComercial(String razonComercial) {
        this.razonComercial = razonComercial;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getDiasCredito() {
        return diasCredito;
    }

    public void setDiasCredito(int diasCredito) {
        this.diasCredito = diasCredito;
    }

    public String getContacto1() {
        return contacto1;
    }

    public void setContacto1(String contacto1) {
        this.contacto1 = contacto1;
    }

    public String getTelefonoC1() {
        return telefonoC1;
    }

    public void setTelefonoC1(String telefonoC1) {
        this.telefonoC1 = telefonoC1;
    }

    public String getContacto2() {
        return contacto2;
    }

    public void setContacto2(String contacto2) {
        this.contacto2 = contacto2;
    }

    public String getTelefonoC2() {
        return telefonoC2;
    }

    public void setTelefonoC2(String telefonoC2) {
        this.telefonoC2 = telefonoC2;
    }

    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Timestamp fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

}

package modelo;

import java.time.LocalDateTime;

public class Proveedor {
    private String RUCProveedor;
    private String razonSocial;
    private String razonComercial;
    private String correo;
    private String telefono;
    private Double diasCredito;
    private String contacto1;
    private String telefonoC1;
    private String contacto2;
    private String telefonoC2;
    private LocalDateTime fechaRegistro;
    private String IDUsuario;
    private String IDUbigeo;

    // Constructor
    public Proveedor() {
    }

    // Getters y setters
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

    public Double getDiasCredito() {
        return diasCredito;
    }

    public void setDiasCredito(Double diasCredito) {
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

    public LocalDateTime getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(LocalDateTime fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getIDUsuario() {
        return IDUsuario;
    }

    public void setIDUsuario(String IDUsuario) {
        this.IDUsuario = IDUsuario;
    }

    public String getIDUbigeo() {
        return IDUbigeo;
    }

    public void setIDUbigeo(String IDUbigeo) {
        this.IDUbigeo = IDUbigeo;
    }
}
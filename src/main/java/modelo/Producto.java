package modelo;

import java.sql.Timestamp;

public class Producto {

    private int idProducto;
    private String descripcion;
    private String resumida;
    private int idUnidadMedida;
    private int idClasificacion;
    private float porcentajeImpuesto1;
    private float porcentajeImpuesto2;
    private float precioCosto;
    private float precioVenta;
    private float stockMinimo;
    private float stock;
    private String observacion;
    private Timestamp fechaRegistro;
    private String idUsuario;
    private boolean activo;
    private String UnidadMedida;
    private String clasificacion;

    // Constructor
    public Producto() {
    }

    public Producto(int idProducto, String descripcion, String resumida, int idUnidadMedida, int idClasificacion,
            float porcentajeImpuesto1, float porcentajeImpuesto2, float precioCosto, float precioVenta, float stockMinimo,
            float stock, String observacion, Timestamp fechaRegistro, String idUsuario, boolean activo, String unidadMedida,
            String clasificacion) {

        this.idProducto = idProducto;
        this.descripcion = descripcion;
        this.resumida = resumida;
        this.idUnidadMedida = idUnidadMedida;
        this.idClasificacion = idClasificacion;
        this.porcentajeImpuesto1 = porcentajeImpuesto1;
        this.porcentajeImpuesto2 = porcentajeImpuesto2;
        this.precioCosto = precioCosto;
        this.precioVenta = precioVenta;
        this.stockMinimo = stockMinimo;
        this.stock = stock;
        this.observacion = observacion;
        this.fechaRegistro = fechaRegistro;
        this.idUsuario = idUsuario;
        this.activo = activo;
        this.UnidadMedida = unidadMedida;
        this.clasificacion = clasificacion;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getResumida() {
        return resumida;
    }

    public void setResumida(String resumida) {
        this.resumida = resumida;
    }

    public int getIdUnidadMedida() {
        return idUnidadMedida;
    }

    public void setIdUnidadMedida(int idUnidadMedida) {
        this.idUnidadMedida = idUnidadMedida;
    }

    public int getIdClasificacion() {
        return idClasificacion;
    }

    public void setIdClasificacion(int idClasificacion) {
        this.idClasificacion = idClasificacion;
    }

    public float getPorcentajeImpuesto1() {
        return porcentajeImpuesto1;
    }

    public void setPorcentajeImpuesto1(float porcentajeImpuesto1) {
        this.porcentajeImpuesto1 = porcentajeImpuesto1;
    }

    public float getPorcentajeImpuesto2() {
        return porcentajeImpuesto2;
    }

    public void setPorcentajeImpuesto2(float porcentajeImpuesto2) {
        this.porcentajeImpuesto2 = porcentajeImpuesto2;
    }

    public float getPrecioCosto() {
        return precioCosto;
    }

    public void setPrecioCosto(float precioCosto) {
        this.precioCosto = precioCosto;
    }

    public float getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(float precioVenta) {
        this.precioVenta = precioVenta;
    }

    public float getStockMinimo() {
        return stockMinimo;
    }

    public void setStockMinimo(float stockMinimo) {
        this.stockMinimo = stockMinimo;
    }

    public float getStock() {
        return stock;
    }

    public void setStock(float stock) {
        this.stock = stock;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Timestamp fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public String getUnidadMedida() {
        return UnidadMedida;
    }

    public void setUnidadMedida(String UnidadMedida) {
        this.UnidadMedida = UnidadMedida;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public void setClasificacion(String clasificacion) {
        this.clasificacion = clasificacion;
    }

}

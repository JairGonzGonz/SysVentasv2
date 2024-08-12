package modelo;

public class Cliente {
    private int IDCliente;
    private String RazonSocial;
    private String RazonComercial;
    private String Nombres;
    private String Apellidos;
    private String IdTributario;
    private String Correo;
    private String IDUsuario;  

    // Constructores
    public Cliente() {
    
    }    
    
    public Cliente(int IDCliente, String RazonSocial, String RazonComercial, String Nombres, String Apellidos, String IdTributario, String Correo, String IDUsuario) {
        this.IDCliente = IDCliente;
        this.RazonSocial = RazonSocial;
        this.RazonComercial = RazonComercial;
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
        this.IdTributario = IdTributario;
        this.Correo = Correo;
        this.IDUsuario = IDUsuario;
    }

    // Getters and setters
    public int getIDCliente() {
        return IDCliente;
    }

    public void setIDCliente(int IDCliente) {
        this.IDCliente = IDCliente;
    }

    public String getRazonSocial() {
        return RazonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        RazonSocial = razonSocial;
    }

    public String getRazonComercial() {
        return RazonComercial;
    }

    public void setRazonComercial(String razonComercial) {
        RazonComercial = razonComercial;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String nombres) {
        Nombres = nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String apellidos) {
        Apellidos = apellidos;
    }

    public String getIdTributario() {
        return IdTributario;
    }

    public void setIdTributario(String idTributario) {
        IdTributario = idTributario;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String correo) {
        Correo = correo;
    }

    public String getIDUsuario() {
        return IDUsuario;
    }

    public void setIDUsuario(String IDUsuario) {
        this.IDUsuario = IDUsuario;
    }
}

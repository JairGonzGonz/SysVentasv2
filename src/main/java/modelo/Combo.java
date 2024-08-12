package modelo;

public class Combo {
    private int Codigo;
    private String Descripcion;
    
    public Combo() {
    }

    public Combo(int Codigo, String Descripcion) {
        this.Codigo = Codigo;
        this.Descripcion = Descripcion;
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
}

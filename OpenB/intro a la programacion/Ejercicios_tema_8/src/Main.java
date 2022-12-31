public class Main {
    public static void main(String[] args) {
        Persona persona = new Persona();

        persona.setEdad(15);
        persona.setNombre("Andre");
        persona.setTelefono("+51936291351");

        System.out.println("Edad de la persona: "+persona.getEdad());
        System.out.println("Nombre de la persona: "+ persona.getNombre());
        System.out.println("Telefonos de la persona: "+persona.getTelefono());

    }

}
class Persona{
    private int edad;
    private String nombre, telefono;
    public void setEdad(int edad){
        this.edad = edad;
    }
    public int getEdad(){
        return this.edad;
    }

    public String getNombre(){
        return this.nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

}
public class Main {
    public static void main(String[] args) {

        Cliente cliente1 = new Cliente();
        cliente1.setCredito(200);
        cliente1.setEdad(25);
        cliente1.setNombre("Juan");
        cliente1.setTelefono("986532147");

        System.out.println("Nombre: "+cliente1.getNombre());
        System.out.println("Edad: "+cliente1.getEdad());
        System.out.println("Telefono: "+cliente1.getTelefono());
        System.out.println("credito: "+cliente1.getCredito()+"\n");

        Trabajador trabajador1 = new Trabajador();
        trabajador1.setSalario(1000);
        trabajador1.setEdad(35);
        trabajador1.setNombre("Pepe");
        trabajador1.setTelefono("986534567");

        System.out.println("Nombre: "+trabajador1.getNombre());
        System.out.println("Edad: "+trabajador1.getEdad());
        System.out.println("Telefono: "+trabajador1.getTelefono());
        System.out.println("Salario: "+trabajador1.getSalario());

    }
}
class Persona{
    protected int edad;
    protected String nombre, telefono;

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}

class Cliente extends Persona{
     protected int credito;

    public int getCredito() {
        return credito;
    }

    public void setCredito(int credito) {
        this.credito = credito;
    }
}
class Trabajador extends Persona{
    int salario;

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }
}
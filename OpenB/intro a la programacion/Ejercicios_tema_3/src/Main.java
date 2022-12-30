
public class Main {

    public static int suma(int a, int b, int c){
        return a+b+c;
    }
    public static void main(String[] args) {
        //Primera parte
        System.out.println("La suma es:" +suma(2,4,6));

        //Segunda Parte
        Coche miCoche = new Coche();
        miCoche.aumentar_puerta();
        System.out.println("El numero de puertas es: "+miCoche.puertas);

    }
}
class Coche {
    public int puertas;

    public void aumentar_puerta() {
        this.puertas++;
    }

}
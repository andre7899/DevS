import com.sun.jdi.event.MonitorContendedEnteredEvent;

import javax.swing.plaf.PanelUI;

public class Main {

    public static void main(String[] args) {
        //======================================= 4. SENTENCIAS DE CONTROL ==============================================
        /*
        //conditionals (if, else, etc)
        System.out.println("---------Practicando condicionale-----------");
        String estacion = "otoño";
        if (estacion== "primavera"){
            System.out.println("Es primavera");
        } else if (estacion == "otoño") {
            System.out.println("Recoger Castañas");
        }
        System.out.println();


        //bucles (while, do while)
        System.out.println("-------------Practicando bucles-------------");
        int contador = 10;

        while(contador > 0){
            System.out.println(contador);
            contador = contador - 2;
        }
        System.out.println();

        contador=10;
        do {
            System.out.println(contador);
            contador--;
        }while (contador>1);
        System.out.println();


        //bucle for
        System.out.println("------------Practicando bucle for----------");
        for (contador = 1; contador<=10;contador++){
            System.out.println(contador);
        }
        System.out.println();

        var temperatura=14;
        //for (;temperatura!=15;){ // no es necesario poner todos los argumentos
       //     System.out.println(temperatura);
        //}
        int valores[] = {10, 20, 30, 40, 50};
        for (int i=0; i< valores.length;i++){
            System.out.println(valores[i]);
        }

        System.out.println();

        // Uso de switch case
        var hoy_es = "SABADO";

        switch (hoy_es){
            case "LUNES":
            case "MARTES":
            case "MIERCOLES":
            case "JUEVES":
            case "VIERNES":
                System.out.println("Hoy es laborable");
                break;
            default:
                System.out.println("hOY NO ES LABORABLE");
        }
        */


        //======================================= 5. ERRORES ==============================================
        /*
        int numeros[] = {10,20,30,40,50};

        //Similar a foreaach de otros lenguajes
        //for (int i = 0; i< numeros.length; i++){
        for (var i:numeros){
            System.out.println(i);
        }
        System.out.println();
        //debug si hay problemas en vez de print

        //Cuidados con poner mucho codigo en una funcion
        //debe hacer lo que diga su nombre

        //-----
        double euros = 15.9000;
        imprimeEuros(euros);
        System.out.println();

        int array[] = new int[5];
        System.out.println(array[4]);//error for one
        System.out.println();

        byte numero = 127;//8 bits de -128 a 127
        System.out.println(numero);

        numero+=5; //Overflow
        System.out.println(numero);

         */


        //======================================= 6. DEPURACION ==============================================
        /*
        int valores[] = new int[5];
        int posicion = 4;

        System.out.println(valores[posicion]);

        funcion1();


         */


        //======================================= 7. INTRO A POO ==============================================
        /*
        Coche coche1 = new Coche(5,50);
        System.out.println(coche1.numeroDePuertas);
        System.out.println(coche1.velocidadActual);
        System.out.println(coche1.velocidadMaxima);
        System.out.println();

        Coche coche2 = new Coche();
        System.out.println(coche1.numeroDePuertas);
        System.out.println(coche1.velocidadActual);
        System.out.println(coche1.velocidadMaxima);
        */


        //========================== 8.PRIVACIDAD, ABSTRACCION Y ENCAPSULAMIENTO  ==================================
        /*
        Vehiculo coche = new Vehiculo();
        coche.setTipo("Coupe");
        coche.setVelocidadMaxima(120);
        coche.setRapido(true);

        Vehiculo moto = new Vehiculo();
        moto.setTipo("Scotter");
        moto.setVelocidadMaxima(50);
        moto.setRapido(false);

        System.out.println(coche.getTipo());
        System.out.println(coche.getVelocidadMaxima());
        System.out.println(moto.getTipo()+ " "+moto.getVelocidadMaxima());

    }

         */


        //============================ 9. HERENCIA, POLIMORFISMO E INTERFACES =================================
        /*
        Coche coche = new Coche();
        coche.diHola();


         */


        //============================ 10. METODOS DE CLASE =================================
        /*
        Coche_2 coche = new Coche_2();
        Moto moto = new Moto();

        EjecutaAcelerar(moto);
        EjecutaAcelerar(coche);
        */
         var valA = 15; //int 32bit = 4 bytes
         var valB=10;

         suma(valA,valB); // los pasos de valores crean copias y por lo tanto duplican el espacio en memoria de la variable que se copia

        System.out.println(valA);
        System.out.println(valB);


    }

        //-------6---------
        /*
    public static void  funcion1(){
        funcion2();
    }
    public static void  funcion2(){
        funcion3();
    }
    public static void  funcion3(){
        System.out.println("Vaya viaje!");
        var i = 15;
        //System.out.println(15/0);
    }
    */

    //---------10 ---------
    /*
    public static void EjecutaAcelerar(Vehiculo_2 vehiculo){ //pueden satisfacer las implemntaciones
        vehiculo.acelerar(15);
    }

     */
    //  10.1
    public static int suma(int a, int b){
        return a+b;
    }
    public static void CocheChanger(Coche_2 coche){
        coche.velocidad +=50;
    }
}
//=========== CLASES ==================
//-------- 7 ----------
/*
class Coche{
    int numeroDePuertas;
    int velocidadMaxima;
    float velocidadActual;

    public Coche(){ //CONSTRUCTOR!!
        numeroDePuertas = 5;
        velocidadMaxima = 120;
        System.out.println("Estoy en el constructor");
    }
    public Coche(int numeroDePuertas, int velocidadMaxima){ //CONSTRUCTOR!!
        this.numeroDePuertas = numeroDePuertas;
        this.velocidadMaxima = velocidadMaxima;
        System.out.println("Estoy en el constructor");
    }
    public void acelerar(){ this.velocidadActual+=15;   }
    public  void desacelerar(){this.velocidadActual-=15;}

}
*/

//--------------- 8 ------------
/*
abstract class Vehiculo{
    private String tipo; //private > Nada > protected > public (encapsulacion).
                        // abstraccion: extraer caracteristicas relevantes para el contexto
    private int velocidadMaxima;
    private boolean rapido;
    String sonido;

    public void setRapido(boolean rapido) {
        this.rapido = rapido;
    }

    String getTipo(){
        return this.tipo;
    }
    void setTipo(String tipo){
            this.tipo = tipo;
    }

    int getVelocidadMaxima(){
        return this.velocidadMaxima;
    }
    void setVelocidadMaxima(int velocidad){
        this.velocidadMaxima = velocidad;
    }
    public void setSonido(String sonido){
    }
    public String getSonido();
}
*/

//---------------9-------------
/*
 abstract class  Vehiculo {
    int velocidadMaxima;
    String matricula;
    String sonido;

    public Vehiculo() {
        System.out.println("Estoy en el constructor");
    }


    public boolean compruebaMatricula (String matricula){
        return this.matricula == matricula;
    }

    public void diHola(){
        System.out.println("Holaa!!");
    }

}

class Motor{
    private String tipoMotor;

    public Motor() {System.out.println("Estoy en el constructor");}
}

class Coche extends Vehiculo {  //final para que sea la ultima subclase, herencia multiple
    public void diHola(){
        System.out.println("Soy un coche"); //polimorfismo
    }
}



class Moto extends Vehiculo{  //entends herencia simple
     public String getSonido(){
         return "Soy un sonidito de moto: "+ this.sonido;
     }
    public void setSonido(String sonido){
        this.sonido = sonido;
    }

}

class Coupe extends Coche{ // Aqui es herencia multinivel (2do nivel)

}


interface Vehiculo_2{
     int variables = 0;
     void acelerar(int velocidad);
     void frenar(int velocidad);
}

class Coche_2 implements Vehiculo_2{ // implementa puede "heredar" de varias superclases a diferencia de "abstract" con extends
    public void acelerar(int velocidad){

    }
    public void frenar(int velocidad){

    }

}
*/

//------------- 10 y 10.1------------


interface Vehiculo_2{
    int velocidad = 0; // En un interface las variables son finals
    void acelerar(int velocidad);
    void frenar(int velocidad);
}

class Coche_2 implements Vehiculo_2{
    int velocidad  = 0;
    public void acelerar(int velocidad){
        System.out.println("coche() -> acelera()");
    }
    public void frenar(int velocidad){
        System.out.println("coche() <- desacelera()");
    }

}
class Moto implements Vehiculo_2{  //entends herencia simple
    public void acelerar(int velocidad){
        System.out.println("moto() -> acelera()");
    }
    public void frenar(int velocidad){
        System.out.println("moto() <- desacelera()");
    }
}


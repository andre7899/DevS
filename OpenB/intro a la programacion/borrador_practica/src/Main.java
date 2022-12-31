
public class Main {

    public static void main(String[] args) {
        //======================================= 4. SENTENCIAS DE CONTROL ==============================================

        //conditionals (if, else, etc)
        /*System.out.println("---------Practicando condicionale-----------");
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
        int valores[] = new int[5];
        int posicion = 4;

        System.out.println(valores[posicion]);

        funcion1();


    }
    public static void imprimeEuros(double valor){
        System.out.println(valor);
    }


    //-------6---------
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

}
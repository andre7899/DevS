public class Main {
    public static void main(String[] args) {
        // Usando If
        int numeroIf = 10;

        if (numeroIf>0) System.out.println("El numero es positivo");
        else if (numeroIf == 0) System.out.println("El numero es 0");
        else System.out.println("El numero es negativo");
        System.out.println();

        //Usando bucle while
        int numeroWhile = 0;
        while (numeroWhile<3){
            System.out.println(numeroWhile);
            numeroWhile++;
        }
        System.out.println();


        numeroWhile = 0;
        //Usando Do while
        do {
            System.out.println(numeroWhile);
            numeroWhile++;
        }while (numeroWhile <1);
        System.out.println();


        //Usando For
        for (int numeroFor = 0;numeroFor <= 3;numeroFor++){
            System.out.println(numeroFor);
        }
        System.out.println();


        //Usando Switch
        var estacion = "primavera";
        switch (estacion){
            case "verano":
            case "invierno":
            case "primavera":
            case "otoño":
                System.out.println("Estas en "+estacion);
                break;
            default:
                System.out.println("Estacion inválida");
        }
    }
}
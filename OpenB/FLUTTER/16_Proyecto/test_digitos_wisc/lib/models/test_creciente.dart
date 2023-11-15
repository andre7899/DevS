class TestCreciente {
  static const numerordenCreciente = [
    [
      [3, 1],
      [8, 6],
    ],
    [
      [5, 2, 4],
      [4, 3, 3],
    ],
    [
      [4, 1],
      [3, 2],
    ],
    [
      [5, 2, 7],
      [1, 8, 6],
    ],
    [
      [7, 5, 8, 1],
      [4, 2, 9, 3],
    ],
    [
      [1, 5, 6, 2, 8],
      [2, 8, 4, 7, 9],
    ],
    [
      [3, 3, 6, 1, 5],
      [4, 9, 4, 6, 9],
    ],
    [
      [8, 5, 2, 5, 3, 7],
      [6, 1, 4, 7, 9, 3],
    ],
    [
      [9, 7, 9, 6, 2, 6, 8],
      [3, 1, 7, 5, 1, 8, 5],
    ],
    [
      [6, 9, 6, 2, 1, 3, 7, 9],
      [1, 4, 8, 5, 4, 8, 7, 4],
    ],
    [
      [2, 5, 7, 7, 4, 8, 7, 5, 2],
      [9, 1, 8, 3, 6, 3, 9, 2, 6],
    ],
  ];
  int aciertos = 0,
      span = 0,
      fallosEnItem = 0,
      contEjemplo = 0,
      posDeGrupo = 0,
      posElemento = 0;

  String correcto() {
    if (contEjemplo < 4) {
      contEjemplo++;
    } else {
      aciertos++;
      span = numerordenCreciente[posDeGrupo][posElemento].length;
    }

    // if (numerordenCreciente[posDeGrupo][posElemento].length > 2) {
    //   span = numerordenCreciente[posDeGrupo][posElemento].length - 1;
    // }

    if (posElemento == 0) {
      posElemento++;
      return numerordenCreciente[posDeGrupo][posElemento].toString();
    } else {
      posElemento = 0;
      posDeGrupo++;
      if (posDeGrupo < numerordenCreciente.length) {
        return numerordenCreciente[posDeGrupo][posElemento].toString();
      } else {
        return 'terminado';
      }
    }
  }

  String incorrecto() {
    if (contEjemplo < 4) {
      contEjemplo++;
    } else {
      fallosEnItem++;
      // span = numerordenCreciente[posDeGrupo][posElemento].length ;
    }
    // if (numerordenCreciente[posDeGrupo][posElemento].length > 2) {
    //   span = numerordenCreciente[posDeGrupo][posElemento].length - 1;
    // }

    if (posElemento == 0) {
      posElemento++;
      return numerordenCreciente[posDeGrupo][posElemento].toString();
    } else {
      if (fallosEnItem == 2) {
        return 'terminado';
      } else {
        fallosEnItem = 0;
        posElemento = 0;
        posDeGrupo++;
        if (posDeGrupo < numerordenCreciente.length) {
          return numerordenCreciente[posDeGrupo][posElemento].toString();
        } else {
          return 'terminado';
        }
      }
    }
  }
}

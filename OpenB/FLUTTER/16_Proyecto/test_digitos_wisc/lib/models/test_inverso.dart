class TestInverso {
  static const numeroOrdenInverso = [
    [
      [9, 5],
      [5, 6],
    ],
    [
      [2, 1],
      [1, 3],
    ],
    [
      [3, 9],
      [8, 5],
    ],
    [
      [2, 3, 6],
      [5, 4, 1],
    ],
    [
      [4, 5, 8],
      [2, 7, 5],
    ],
    [
      [7, 4, 5, 2],
      [9, 3, 8, 6],
    ],
    [
      [1, 6, 4, 7, 5, 8],
      [6, 3, 7, 2, 9, 1],
    ],
    [
      [8, 1, 5, 2, 4, 3, 6],
      [4, 3, 7, 9, 2, 8, 1],
    ],
    [
      [3, 1, 7, 9, 4, 6, 8, 2],
      [9, 8, 1, 6, 3, 2, 4, 7],
    ],
  ];

  int aciertos = 0;
  int span = 0;
  int fallosEnItem = 0;

  int contEjemplo = 0;

  int posDeGrupo = 0;
  int posElemento = 0;

  String correcto() {
    if (contEjemplo < 2) {
      contEjemplo++;
    } else {
      aciertos++;
      span = numeroOrdenInverso[posDeGrupo][posElemento].length;
    }

    // if (numeroOrdenInverso[posDeGrupo][posElemento].length > 2) {
    //   span = numeroOrdenInverso[posDeGrupo][posElemento].length - 1;
    // }

    if (posElemento == 0) {
      posElemento++;
      return numeroOrdenInverso[posDeGrupo][posElemento].toString();
    } else {
      posElemento = 0;
      posDeGrupo++;
      if (posDeGrupo < numeroOrdenInverso.length) {
        return numeroOrdenInverso[posDeGrupo][posElemento].toString();
      } else {
        return 'terminado';
      }
    }
  }

  String incorrecto() {
    if (contEjemplo < 2) {
      contEjemplo++;
    } else {
      fallosEnItem++;
      // span = numeroOrdenInverso[posDeGrupo][posElemento].length ;
    }
    // if (numeroOrdenInverso[posDeGrupo][posElemento].length > 2) {
    //   span = numeroOrdenInverso[posDeGrupo][posElemento].length - 1;
    // }

    if (posElemento == 0) {
      posElemento++;
      return numeroOrdenInverso[posDeGrupo][posElemento].toString();
    } else {
      if (fallosEnItem == 2) {
        return 'terminado';
      } else {
        fallosEnItem = 0;
        posElemento = 0;
        posDeGrupo++;
        if (posDeGrupo < numeroOrdenInverso.length) {
          return numeroOrdenInverso[posDeGrupo][posElemento].toString();
        } else {
          return 'terminado';
        }
      }
    }
  }
}

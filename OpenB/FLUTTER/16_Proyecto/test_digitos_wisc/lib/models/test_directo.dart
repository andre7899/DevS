class TestDirecto {
  static const numeroOrdenDirecto = [
    [
      [2, 9],
      [5, 4],
    ],
    [
      [3, 9, 6],
      [6, 5, 2],
    ],
    [
      [5, 4, 1, 7],
      [9, 1, 6, 8],
    ],
    [
      [8, 2, 1, 9, 6],
      [7, 2, 3, 4, 9],
    ],
    [
      [5, 7, 3, 6, 4, 8],
      [3, 8, 4, 1, 7, 5],
    ],
    [
      [2, 1, 8, 9, 4, 3, 7],
      [7, 8, 5, 2, 1, 6, 3],
    ],
    [
      [1, 8, 4, 3, 7, 5, 3, 6],
      [2, 7, 9, 6, 3, 1, 4, 8],
    ],
    [
      [7, 2, 6, 1, 9, 4, 8, 3, 5],
      [4, 3, 8, 9, 1, 7, 5, 6, 2],
    ],
    [
      [9, 2, 5, 3, 1, 8, 9, 5, 4, 7],
      [9, 4, 3, 8, 7, 5, 2, 9, 6, 1],
    ],
  ];
  int aciertos = 0;
  int span = 0;
  int fallosEnItem = 0;

  int posDeGrupo = 0;
  int posElemento = 0;
  String correcto() {
    aciertos++;
    if (numeroOrdenDirecto[posDeGrupo][posElemento].length > 2) {
      span = numeroOrdenDirecto[posDeGrupo][posElemento].length - 1;
    }

    if (posElemento == 0) {
      posElemento++;
      return numeroOrdenDirecto[posDeGrupo][posElemento].toString();
    } else {
      posElemento = 0;
      posDeGrupo++;
      if (posDeGrupo < numeroOrdenDirecto.length) {
        return numeroOrdenDirecto[posDeGrupo][posElemento].toString();
      } else {
        return 'terminado';
      }
    }
  }

  String incorrecto() {
    fallosEnItem++;
    if (numeroOrdenDirecto[posDeGrupo][posElemento].length > 2) {
      span = numeroOrdenDirecto[posDeGrupo][posElemento].length - 1;
    }

    if (posElemento == 0) {
      posElemento++;
      return numeroOrdenDirecto[posDeGrupo][posElemento].toString();
    } else {
      if (fallosEnItem == 2) {
        return 'terminado';
      } else {
        fallosEnItem = 0;
        posElemento = 0;
        posDeGrupo++;
        if (posDeGrupo < numeroOrdenDirecto.length) {
          return numeroOrdenDirecto[posDeGrupo][posElemento].toString();
        } else {
          return 'terminado';
        }
      }
    }
  }
}

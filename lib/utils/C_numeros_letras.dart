// ignore_for_file: file_names, unused_local_variable

converNumToLetras(double numero, String moneda) {
  String num = numero.toString() + '0';
  String entero = num.substring(0, num.indexOf('.'));
  double n = double.parse(entero);
  String decimal = num.substring(num.indexOf('.') + 1);
  String dec;

  moneda == 'MXN'
      ? dec = ' PESOS ${decimal.substring(0, 2)}/100 M.N.'
      : dec = ' DOLARES ${decimal.substring(0, 2)}/100 $moneda';

  var r = '${numeALetras(n.round())} $dec';
  // var res = numeALetras(3518310) + dec;
  return r;
}

numeALetras(int value) {
  String? n2;

  if (value == 0) {
    n2 = 'CERO';
  } else if (value == 1) {
    n2 = 'UNO';
  } else if (value == 2) {
    n2 = 'DOS';
  } else if (value == 3) {
    n2 = 'TRES';
  } else if (value == 4) {
    n2 = 'CUATRO';
  } else if (value == 5) {
    n2 = 'CINCO';
  } else if (value == 6) {
    n2 = 'SEIS';
  } else if (value == 7) {
    n2 = 'SIETE';
  } else if (value == 8) {
    n2 = 'OCHO';
  } else if (value == 9) {
    n2 = 'NUEVE';
  } else if (value == 10) {
    n2 = 'DIEZ';
  } else if (value == 11) {
    n2 = 'ONCE';
  } else if (value == 12) {
    n2 = 'DOCE';
  } else if (value == 13) {
    n2 = 'TRECE';
  } else if (value == 14) {
    n2 = 'CATORCE';
  } else if (value == 15) {
    n2 = 'QUINCE';
  } else if (value < 20) {
    n2 = 'DIECI${numeALetras(value - 10)}';
  } else if (value == 20) {
    n2 = 'VEITE';
  } else if (value < 30) {
    n2 = 'VEINTI${numeALetras(value - 20)}';
  } else if (value == 30) {
    n2 = 'TREITA';
  } else if (value == 40) {
    n2 = 'CUARENTA';
  } else if (value == 50) {
    n2 = 'CINCUENTA';
  } else if (value == 60) {
    n2 = 'SESENTA';
  } else if (value == 70) {
    n2 = 'SETENTA';
  } else if (value == 80) {
    n2 = 'OCHENTA';
  } else if (value == 90) {
    n2 = 'NOVENTA';
  } else if (value < 100) {
    final d = value / 10;
    final div = double.parse(d.floor().toString() + '0');
    n2 = '${numeALetras(div.floor())} Y ${numeALetras(value % 10)}';
  } else if (value == 100) {
    n2 = 'CIEN';
  } else if (value < 200) {
    n2 = 'CIENTO ${numeALetras(value - 100)}';
  } else if (value == 200 ||
      value == 300 ||
      value == 400 ||
      value == 600 ||
      value == 800) {
    final d = value / 100;
    n2 = '${numeALetras(d.floor())}CIENTOS';
  } else if (value == 500) {
    n2 = 'QUINIENTOS';
  } else if (value == 700) {
    n2 = 'SETECIENTOS';
  } else if (value == 900) {
    n2 = 'NOVECIENTOS';
  } else if (value < 1000) {
    final d = value / 100;
    final div = double.parse(d.floor().toString() + '00');
    n2 = '${numeALetras(div.floor())} ${numeALetras(value % 100)}';
  } else if (value == 1000) {
    n2 = 'MIL';
  } else if (value < 2000) {
    n2 = 'MIL ${numeALetras(value % 1000)}';
  } else if (value < 1000000) {
    final d = value / 1000;
    n2 = '${numeALetras(d.floor())} MIL';
    if (value % 1000 > 0) {
      n2 = '$n2  ${numeALetras(value % 1000)}';
    }
  } else if (value == 1000000) {
    n2 = 'UN MILLON';
  } else if (value < 2000000) {
    final d = value % 1000000;
    n2 = 'UN MILLOM ${numeALetras(d.floor())}';
  } else if (value < 1000000000000) {
    final d = value / 1000000;
    n2 = '${numeALetras(d.floor())} MILLONES';
    final div = value - d.floor() * 1000000;
    if (div > 0) {
      final d = value / 1000000;
      final div = value - d.floor() * 1000000;
      n2 = '$n2 ${numeALetras(div.floor())}';
    }
  }
  return n2;
}

// else if(value == ){
//     n2 = '';
//   }
//https://elcamino.dev/convertir-numeros-a-letras-en-c-sharp/

// ignore_for_file: non_constant_identifier_names

String Ob_D2(String C, String DB, String DC) {
  var inicial = C.indexOf(DB);
  if (inicial == -1) {
    return '';
  }
  var ffinal = C.indexOf(DC, inicial) + DC.length;
  var subcadena = C.substring(inicial, ffinal);
  var sInicial = subcadena.indexOf('>') + 1;
  var sFinal = subcadena.indexOf('<', sInicial);
  subcadena = subcadena.substring(sInicial, sFinal);
  return subcadena;
}

String quitarCertificado(String C, String DB, String DC) {
  var inicial = C.indexOf(DB) + 13;
  var ffinal = C.indexOf(DC, inicial) + DC.length;
  var subcadena = C.substring(inicial, ffinal);
  var sInicial = subcadena.indexOf('Certificado=') + 13;
  var sFinal = subcadena.indexOf('SubTotal=', sInicial) - 2;
  subcadena = subcadena.substring(sInicial, sFinal);
  return subcadena;
}

String concepto(String C, String DB, String DC) {
  var inicial = C.indexOf(DB);
  var ffinal = C.indexOf(DC, inicial) + DC.length;
  var subcadena = C.substring(inicial, ffinal);
  var sInicial = subcadena.indexOf('=') + 2;
  var sFinal = subcadena.indexOf('>', sInicial) - 3;
  subcadena = subcadena.substring(sInicial, sFinal);
  return subcadena;
}

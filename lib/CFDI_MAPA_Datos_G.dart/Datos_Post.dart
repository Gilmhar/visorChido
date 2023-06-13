// ignore_for_file: file_names

import 'dart:convert';

import 'package:visor_xml/Moldes/Preferencias.dart';

eruDatos(String tipoE, String dataE, String tipoR, String dataR, String tipoT,
        String dataT) =>
    datosG(tipoE, json.decode(dataE), tipoR, json.decode(dataR), tipoT,
        json.decode(dataT));

datosG(String tipoE, Map<String, dynamic> parseE, String tipoR,
    Map<String, dynamic> parseR, String tipoT, Map<String, dynamic> parseT) {
  final emisor = parseE[tipoE];
  Pref.rfcE = emisor["Rfc"] ?? '';
  final receptor = parseR[tipoR];
  Pref.rfcR = receptor["Rfc"] ?? '';
  final timbre = parseT[tipoT];
  Pref.uuid = timbre["UUID"] ?? "";
}

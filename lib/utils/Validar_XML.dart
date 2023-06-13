// import 'package:flutter/material.dart';
// ignore_for_file: file_names

import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:xml2json/xml2json.dart';

Future validarxmlres() async {
  final Xml2Json xml = Xml2Json();
  final xmld = Pref.file;
  xml.parse(xmld.toString());
}

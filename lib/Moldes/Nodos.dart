// ignore_for_file: file_names

import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

final Xml2Json xml = Xml2Json();

nodoCjs(String data, String etiqueta) {
  final doc = XmlDocument.parse(data);
  final e = doc.getElement(etiqueta.replaceAll('\$', ':'));
  xml.parse(e.toString());
  return xml.toGData();
}

subNodojs(String data, String nodo, String etiqueta) {
  final doc = XmlDocument.parse(data);
  final e = doc
      .getElement(nodo.replaceAll('\$', ':'))!
      .findAllElements(etiqueta.replaceAll('\$', ':'));
  final E = e.last.toString().replaceAll('(', '').replaceAll(')', '');
  xml.parse(E);
  return xml.toGData();
}

subSubNodojs(String data, String nodo, String etiqueta, String subetiqueta) {
  final document = XmlDocument.parse(data);
  final e = document
      .getElement(nodo.replaceAll('\$', ':'))!
      .findAllElements(etiqueta.replaceAll('\$', ':'))
      .last
      .toString()
      .replaceAll('(', '')
      .replaceAll(')', '');
  final doc = XmlDocument.parse(e);
  final sub = doc
      .getElement(etiqueta.replaceAll('\$', ':'))!
      .findElements(subetiqueta.replaceAll('\$', ':'))
      .last
      .toString()
      .replaceAll('(', '')
      .replaceAll(')', '');
  xml.parse(sub);
  var js = xml.toGData();
  return js;
}

subNodo(String data, String nodo, String etiqueta) {
  final doc = XmlDocument.parse(data);
  return doc
      .getElement(nodo.replaceAll('\$', ':'))!
      .findAllElements(etiqueta.replaceAll('\$', ':'));
  
  
}

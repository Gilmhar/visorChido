// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/CFDI_MAPA_Datos_G.dart/Conceptos_M.dart';
import 'package:visor_xml/CFDI_MAPA_Datos_G.dart/Datos_Generales.dart';
import 'package:visor_xml/CFDI_Mapas/CartaPorte_M.dart';
import 'package:visor_xml/CFDI_Mapas/ImpuestosT_M.dart';
import 'package:visor_xml/CFDI_Mapas/Nomina12_M.dart';
import 'package:visor_xml/CFDI_Mapas/Pagos_40.dart';
import 'package:visor_xml/Moldes/Nodos.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:xml2json/xml2json.dart';
import 'package:xml/xml.dart';

class DatosDe with ChangeNotifier {
  //DATOS GENERALES
  comprobante(String etiqueta, String data, context) {
    final n = nodoCjs(data, etiqueta);
    datosGeneralesFromjson(etiqueta, n, context);
  }

  emisor(String nodo, String etiqueta, String data, context) {
    final n = subNodojs(data, nodo, etiqueta);
    datosGeneralesFromjson(etiqueta, n, context);
  }

  receptor(String nodo, String etiqueta, String data, context) {
    final n = subNodojs(data, nodo, etiqueta);
    datosGeneralesFromjson(etiqueta, n, context);
  }

  timbre(
      String nodo, String etiqueta, String data, String subetiqueta, context) {
    final timbre = subSubNodojs(data, nodo, etiqueta, subetiqueta);
    datosGeneralesFromjson(subetiqueta, timbre, context);
  }

  //DATOS ESPECIFICOS
  impuestos(String nodo, String etiqueta, String data, context) {
    if (data.contains('cfdi:Impuestos')) {
      final n = subNodo(data, nodo, etiqueta);
      final nn = n.last.toString().replaceAll('(', '').replaceAll(')', '');
      totalImpuestosFromJson(etiqueta, nn, context);
    } else {
      var es = Provider.of<DatosCfdi>(context, listen: false);
      es.totalImpuestosTrasladados = '';
      es.totalImpuestosRetenidos = '';
      es.impuestoTraslado = [];
      es.impuestoRetenido = [];
    }
  }

  conceptos(
      String nodo, String etiqueta, String etiqueta2, String data, context) {
    var list = [];
    final es = Provider.of<DatosCfdi>(context, listen: false);
    final n = subNodo(data, nodo, etiqueta);
    final nn = n.toString().replaceAll('(', '').replaceAll(')', '');
    final document = XmlDocument.parse(nn);
    final doc = document
        .getElement(etiqueta.replaceAll('\$', ':'))!
        .findAllElements(etiqueta2.replaceAll('\$', ':'));
    for (var i = 0; i < doc.length; i++) {
      final con =
          doc.elementAt(i).toString().replaceAll('(', '').replaceAll(')', '');
      list.add(conceptosFromJson(etiqueta2, con));
    }
    es.concepto = list;
  }

  //DATOS COMPLEMENTOS
  complementoPagos(String nodo, String etiqueta, String data, context) {
    var listP = [];
    var es = Provider.of<DatosCfdi>(context, listen: false);
    final n = subNodojs(data, nodo, etiqueta);
    pagos2040FromJson(etiqueta, n, context);
    final nn = subNodo(data, nodo, etiqueta);
    final document = XmlDocument.parse(
        nn.toString().replaceAll('(', '').replaceAll(')', ''));
    final doc = document
        .getElement(etiqueta.replaceAll('\$', ':'))!
        .findAllElements('pago${es.PVersionC}:Pagos');
    final row = XmlDocument.parse(
        doc.toString().replaceAll('(', '').replaceAll(')', ''));
    final res = row
        .getElement('pago${es.PVersionC}:Pagos')!
        .findAllElements('pago${es.PVersionC}:Pago');
    for (var i = 0; i < res.length; i++) {
      final pg =
          res.elementAt(i).toString().replaceAll('(', '').replaceAll(')', '');
      listP.add(Pago20Pago.fromJson(pg, context));
    }
    es.complementoPagos = listP;
  }

  complementoNomina(String nodo, String etiqueta, String data, context) {
    final es = Provider.of<DatosCfdi>(context, listen: false);
    final list = [];
    final nn = subNodo(data, nodo, etiqueta);
    final document = XmlDocument.parse(
        nn.toString().replaceAll('(', '').replaceAll(')', ''));
    final doc = document
        .getElement(etiqueta.replaceAll('\$', ':'))!
        .findAllElements('nomina12:Nomina');
    for (var i = 0; i < doc.length; i++) {
      final Xml2Json xml = Xml2Json();
      final con =
          doc.elementAt(i).toString().replaceAll('(', '').replaceAll(')', '');
      xml.parse(con);
      var js = xml.toGData();
      list.add(nomina12cFromJson('nomina12\$Nomina', js, con, context));
    }
    es.complementosNomina = list;
  }

  complementoCartaporte(String nodo, String etiqueta, String data, context) {
    var dato = Provider.of<DatosCfdi>(context, listen: false);
    final v = dato.PVersionC;
    final nn = subNodo(data, nodo, etiqueta);
    final document = XmlDocument.parse(
        nn.toString().replaceAll('(', '').replaceAll(')', ''));
    final doc = document
        .getElement(etiqueta.replaceAll('\$', ':'))!
        .findElements('cartaporte$v:CartaPorte');
    cartaporteAutoFromJson('cartaporte$v\$CartaPorte',
        doc.toString().replaceAll('(', '').replaceAll(')', ''), context);
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  retenciones(String data) {
    // final js = nodosretencion(data, 'retenciones:Retenciones', '');
    // final c = reterncionesFromJson(js);
    // return c.retencionesRetenciones;
  }
  retencionesEmisor(String data) {
    // final js = nodosretencion(data, 'retenciones:Emisor', '');
    // final c = retencionesEmisorFromJson(js);
    // return c.retencionesEmisor;
  }
  retencionesReceptor(String data) {
    // final js = nodosretencion(data, 'retenciones:Receptor', '');
    // final c = retencionesReceptorFromJson(js);
    // return c.retencionesReceptor;
  }
  retencionesPeriodo(String data) {
    // final js = nodosretencion(data, 'retenciones:Periodo', '');
    // final c = retencionesPeriodoFromJson(js);
    // return c.retencionesPeriodo;
  }
  retencionesTotatles(String data) {
    // final js = nodosretencion(data, 'retenciones:Totales', '');
    // final c = retencionesTotalesFromJson(js);
    // return c.retencionesTotales;
  }
  retencionesComplemento(String data) {
    // final js = nodosretencion(data, 'retenciones:Complemento', '');
    // final c = TipoRetencionesFromJson(js, 'intereses:Intereses');
    // return c?.retencionesComplemento?.interesesIntereses;
  }
  retencionesTimbre(String data, context) {
    // final js = nodosretencion(
    //     data, 'retenciones:Complemento', 'tfd:TimbreFiscalDigital');
    // timbreFFromJson('tfd\$TimbreFiscalDigital', js, context);
  }
}

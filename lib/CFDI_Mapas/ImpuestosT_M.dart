// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

import '../CFDI_MAPA_Datos_G.dart/Conceptos_M.dart';

totalImpuestosFromJson(String tipo, String str, context) =>
    totalImpuestos(tipo, str, context);

totalImpuestos(String tipo, String str, context) {
  var es = Provider.of<DatosCfdi>(context, listen: false);
  final Xml2Json xml = Xml2Json();
  xml.parse(str);
  final js = xml.toGData();
  final parse = json.decode(js);
  final jsonr = parse[tipo];
  es.totalImpuestosTrasladados = jsonr['TotalImpuestosTrasladados'] ??
      jsonr['totalImpuestosTrasladados'] ??
      '';
  es.totalImpuestosRetenidos = jsonr['TotalImpuestosRetenidos'] ??
      jsonr['totalImpuestosRetenidos'] ??
      '';

  final doc = XmlDocument.parse(str);
  final traslados = doc
      .getElement(tipo.replaceAll("\$", ":"))!
      .findAllElements('cfdi:Traslados');
  if (traslados.isNotEmpty) {
    List ListT = [];
    final t = XmlDocument.parse(
        traslados.last.toString().replaceAll('(', '').replaceAll(')', ''));
    final traslado =
        t.getElement('cfdi:Traslados')!.findAllElements('cfdi:Traslado');

    for (var i = 0; i < traslado.length; i++) {
      final T = traslado
          .elementAt(i)
          .toString()
          .replaceAll('(', '')
          .replaceAll(')', '');
      xml.parse(T);
      final js = xml.toGData();
      ListT.add(CfdiTrasladosT.fromJson(json.decode(js)));
    }

    es.impuestoTraslado = ListT;
  } else {
    es.impuestoTraslado = [];
  }

  final retenidos = doc
      .getElement(tipo.replaceAll("\$", ":"))!
      .findAllElements('cfdi:Retenciones');

  if (retenidos.isNotEmpty) {
    List ListR = [];
    final r = XmlDocument.parse(
        retenidos.last.toString().replaceAll('(', '').replaceAll(')', ''));
    final retenido =
        r.getElement('cfdi:Retenciones')!.findAllElements('cfdi:Retencion');

    for (var i = 0; i < retenido.length; i++) {
      final R = retenido
          .elementAt(i)
          .toString()
          .replaceAll('(', '')
          .replaceAll(')', '');
      xml.parse(R);
      final js = xml.toGData();
      ListR.add(CfdiRetencionesT.fromJson(json.decode(js)));
    }
    es.impuestoRetenido = ListR;
  } else {
    es.impuestoRetenido = [];
  }
}

//IMPUESTOS RETENCIONES
class CfdiRetencionesT {
  CfdiRetencionesT({
    required this.cfdiRetencion,
  });

  Cfdi cfdiRetencion;

  factory CfdiRetencionesT.fromJson(Map<String, dynamic> json) {
    return CfdiRetencionesT(
      cfdiRetencion: Cfdi.fromJson(json["cfdi\u0024Retencion"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "cfdi\u0024Retencion": cfdiRetencion.toJson(),
      };
}

//IMPUESTOS TRASLADOS
class CfdiTrasladosT {
  CfdiTrasladosT({
    required this.cfdiTraslado,
  });

  CfdiT cfdiTraslado;

  factory CfdiTrasladosT.fromJson(Map<String, dynamic> json) {
    return CfdiTrasladosT(
      cfdiTraslado: CfdiT.fromJson(json["cfdi\$Traslado"]),
    );
  }
}

class CfdiT {
  CfdiT({
    required this.base,
    required this.impuesto,
    required this.tipoFactor,
    required this.tasaOCuota,
    required this.importe,
  });

  String base;
  String impuesto;
  String tipoFactor;
  String tasaOCuota;
  String importe;

  factory CfdiT.fromJson(Map<String, dynamic> json) => CfdiT(
        base: json["Base"] ?? json["base"] ?? '',
        impuesto: json["Impuesto"] ?? json["impuesto"] ?? '',
        tipoFactor: json["TipoFactor"] ?? json["tipoFactor"] ?? '',
        tasaOCuota: json["TasaOCuota"] ?? json["tasaOCuota"] ?? '',
        importe: json["Importe"] ?? json["importe"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Base": base,
        "Impuesto": impuesto,
        "TipoFactor": tipoFactor,
        "TasaOCuota": tasaOCuota,
        "Importe": importe,
      };
}

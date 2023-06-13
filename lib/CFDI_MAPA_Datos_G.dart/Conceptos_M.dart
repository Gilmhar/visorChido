// ignore_for_file: file_names

import 'dart:convert';

import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

conceptosFromJson(String tipo, String str) => conceptos(tipo, str);

conceptos(String tipo, String str) {
  return CfdiConcepto.fromJson(str, tipo);
}

class CfdiConcepto {
  CfdiConcepto({
    required this.claveProdServ,
    required this.claveUnidad,
    required this.unidad,
    required this.cantidad,
    required this.noIdentificacion,
    required this.descripcion,
    required this.valorUnitario,
    required this.descuento,
    required this.importe,
    required this.objetoImp,
    required this.cfdiImpuestos,
  });

  String claveProdServ;
  String claveUnidad;
  String unidad;
  String cantidad;
  String noIdentificacion;
  String descripcion;
  String valorUnitario;
  String descuento;
  String importe;
  String objetoImp;
  CfdiImpuestos cfdiImpuestos;

  factory CfdiConcepto.fromJson(String str, String tipo) {
    final Xml2Json xml = Xml2Json();
    xml.parse(str);
    var js = xml.toGData();
    final j = json.decode(js);
    final jss = j['cfdi\$Concepto'];
    return CfdiConcepto(
      claveProdServ: jss["ClaveProdServ"] ?? jss['claveProdServ'] ?? '',
      claveUnidad: jss["ClaveUnidad"] ?? jss['claveUnidad'] ?? '',
      unidad: jss["Unidad"] ?? jss['unidad'] ?? '',
      cantidad: jss["Cantidad"] ?? jss['cantidad'] ?? '',
      noIdentificacion:
          jss["NoIdentificacion"] ?? jss['noIdentificacion'] ?? '',
      descripcion: jss["Descripcion"] ?? jss['descripcion'],
      valorUnitario: jss["ValorUnitario"] ?? jss['valorUnitario'] ?? '',
      descuento: jss["Descuento"] ?? jss['descuento'] ?? '',
      importe: jss["Importe"] ?? jss['importe'] ?? '',
      objetoImp: jss["ObjetoImp"] ?? jss['objetoImp'] ?? '',
      cfdiImpuestos: CfdiImpuestos.fromJson(str, tipo, 'cfdi\$Impuestos'),
    );
  }
}

class CfdiImpuestos {
  CfdiImpuestos({
    required this.cfdiTraslados,
    required this.cfdiRetenciones,
  });

  List<CfdiTraslados> cfdiTraslados;
  List<CfdiRetenciones> cfdiRetenciones;

  factory CfdiImpuestos.fromJson(String str, String tipo, String subtipo) {
    List<CfdiTraslados> listCT = [];
    List<CfdiRetenciones> listCR = [];

    if (str.contains(subtipo.replaceAll('\$', ':'))) {
      final Xml2Json xml = Xml2Json();
      final impuestos = XmlDocument.parse(str);
      final impuesto = impuestos
          .getElement(tipo.replaceAll('\$', ':'))!
          .findAllElements(subtipo.replaceAll('\$', ':'));

      final imp = XmlDocument.parse(
          impuesto.toString().replaceAll('(', '').replaceAll(')', ''));

      if (impuestos.toString().contains('cfdi:Traslados')) {
        final traslados = imp
            .getElement(subtipo.replaceAll('\$', ':'))!
            .findAllElements('cfdi:Traslados');
        final t = XmlDocument.parse(
            traslados.toString().replaceAll('(', '').replaceAll(')', ''));

        final traslado =
            t.getElement('cfdi:Traslados')!.findAllElements('cfdi:Traslado');

        for (var i = 0; i < traslado.length; i++) {
          final parseub = traslado
              .elementAt(i)
              .toString()
              .replaceAll('(', '')
              .replaceAll(')', '');
          xml.parse(parseub);
          var js = xml.toGData();
          listCT.add(CfdiTraslados.fromJson(json.decode(js)));
        }
      }

      if (impuestos.toString().contains('cfdi:Retenciones')) {
        final retenciones = imp
            .getElement(subtipo.replaceAll('\$', ':'))!
            .findAllElements('cfdi:Retenciones');

        final r = XmlDocument.parse(
            retenciones.toString().replaceAll('(', '').replaceAll(')', ''));

        final retencion =
            r.getElement('cfdi:Retenciones')!.findAllElements('cfdi:Retencion');

        for (var i = 0; i < retencion.length; i++) {
          final parseub = retencion
              .elementAt(i)
              .toString()
              .replaceAll('(', '')
              .replaceAll(')', '');
          xml.parse(parseub);
          var js = xml.toGData();
          listCR.add(CfdiRetenciones.fromJson(json.decode(js)));
        }
      } else {}
    }
    return CfdiImpuestos(cfdiTraslados: listCT, cfdiRetenciones: listCR);
  }
}

//IMPUESTOS RETENCIONES
class CfdiRetenciones {
  CfdiRetenciones({
    required this.cfdiRetencion,
  });

  Cfdi cfdiRetencion;

  factory CfdiRetenciones.fromJson(Map<String, dynamic> json) {
    return CfdiRetenciones(
      cfdiRetencion: Cfdi.fromJson(json["cfdi\u0024Retencion"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "cfdi\u0024Retencion": cfdiRetencion.toJson(),
      };
}

//IMPUESTOS TRASLADOS
class CfdiTraslados {
  CfdiTraslados({
    required this.cfdiTraslado,
  });

  Cfdi cfdiTraslado;

  factory CfdiTraslados.fromJson(Map<String, dynamic> json) {
    return CfdiTraslados(
      cfdiTraslado: Cfdi.fromJson(json["cfdi\$Traslado"]),
    );
  }
}

class Cfdi {
  Cfdi({
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

  factory Cfdi.fromJson(Map<String, dynamic> json) => Cfdi(
        base: json["Base"] ?? '',
        impuesto: json["Impuesto"] ?? '',
        tipoFactor: json["TipoFactor"] ?? '',
        tasaOCuota: json["TasaOCuota"] ?? '',
        importe: json["Importe"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Base": base,
        "Impuesto": impuesto,
        "TipoFactor": tipoFactor,
        "TasaOCuota": tasaOCuota,
        "Importe": importe,
      };
}

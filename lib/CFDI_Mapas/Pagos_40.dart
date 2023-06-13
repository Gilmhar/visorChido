// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

pagos2040FromJson(String tipo, String str, context) =>
    complementopagos(tipo, json.decode(str), context);

complementopagos(String tipo, Map<String, dynamic> parse, context) {
  var es = Provider.of<DatosCfdi>(context, listen: false);
  final json = parse[tipo];
  final pagos = json['pago${es.PVersionC}\$Pagos'] ?? json['pago10\$Pagos'];

  es.pagosVersion = pagos['Version'] ?? pagos['version'] ?? '';
  es.pagoXxmlns =
      pagos['xmlns\$pago${es.PVersionC}'] ?? pagos['xmlns\$pago10'] ?? '';
  

  if (pagos['pago${es.PVersionC}\$Totales'] != null) {
    final totales =
      pagos['pago${es.PVersionC}\$Totales'] ?? pagos['pago10\$Totales'] ?? '';
    es.pagosTotalTrasladosBaseIVA16 = totales['TotalTrasladosBaseIVA16'] ?? '';
    es.pagosTotaltrasladosImpuestoIVA =
        totales['TotalTrasladosImpuestoIVA16'] ?? '';
    es.pagosMontoTotal = totales['MontoTotalPagos'] ?? '';
  } else {
    es.pagosTotalTrasladosBaseIVA16 = '';
    es.pagosTotaltrasladosImpuestoIVA = '';
    es.pagosMontoTotal = '';
  }
}

class CPagos {
  CPagos({
    required this.pago20Pago,
  });

  Pago20Pago pago20Pago;

  factory CPagos.fromJson(Map<String, dynamic> json, context) {
    var es = Provider.of<DatosCfdi>(context, listen: false);
    return CPagos(
      pago20Pago:
          Pago20Pago.fromJson(json["pago${es.PVersionC}\u0024Pago"], context),
    );
  }
}

class Pago20Pago {
  Pago20Pago(
      {required this.fechaPago,
      required this.formaDePagoP,
      required this.monedaP,
      required this.tipoCambioP,
      required this.monto,
      required this.noOperacionP,
      required this.pago20DoctoRelacionado});

  String fechaPago;
  String formaDePagoP;
  String monedaP;
  String tipoCambioP;
  String monto;
  String noOperacionP;
  List<Pago20DoctoRelacionado> pago20DoctoRelacionado;
  factory Pago20Pago.fromJson(String d, context) {
    final es = Provider.of<DatosCfdi>(context, listen: false);
    List DocR = [];
    final Xml2Json xml = Xml2Json();
    xml.parse(d);
    var jss = xml.toGData();
    final parse = json.decode(jss);
    final js = parse['pago${es.PVersionC}\$Pago'];

    final resp =
        XmlDocument.parse(d.toString().replaceAll('(', '').replaceAll(')', ''));
    final r = resp
        .getElement('pago${es.PVersionC}:Pago')!
        .findAllElements('pago${es.PVersionC}:DoctoRelacionado');

    for (var i = 0; i < r.length; i++) {
      final Xml2Json xml = Xml2Json();
      final con =
          r.elementAt(i).toString().replaceAll('(', '').replaceAll(')', '');
      xml.parse(con);
      var js = xml.toGData();
      DocR.add(js);
    }

    return Pago20Pago(
        fechaPago: js["FechaPago"] ?? '',
        formaDePagoP: js["FormaDePagoP"] ?? '',
        monedaP: js["MonedaP"] ?? '',
        tipoCambioP: js["TipoCambioP"] ?? '',
        monto: js["Monto"] ?? '',
        noOperacionP: js['NumOperacion'] ?? '',
        pago20DoctoRelacionado: List.from(DocR.map(
            (x) => Pago20DoctoRelacionado.fromJson(json.decode(x), context))));
  }
}

class Pago20DoctoRelacionado {
  Pago20DoctoRelacionado({
    required this.idDocumento,
    required this.serie,
    required this.folio,
    required this.monedaDr,
    required this.equivalenciaDr,
    required this.numParcialidad,
    required this.impSaldoAnt,
    required this.impPagado,
    required this.impSaldoInsoluto,
    required this.objetoImpDr,
    required this.tipoCambioDr,
    required this.pago20ImpuestosDr,
  });

  String idDocumento;
  String serie;
  String folio;
  String monedaDr;
  String equivalenciaDr;
  String numParcialidad;
  String impSaldoAnt;
  String impPagado;
  String impSaldoInsoluto;
  String objetoImpDr;
  String tipoCambioDr;
  Pago20ImpuestosDr pago20ImpuestosDr;

  factory Pago20DoctoRelacionado.fromJson(Map<String, dynamic> parse, context) {
    final es = Provider.of<DatosCfdi>(context, listen: false);
    final json = parse["pago${es.PVersionC}\$DoctoRelacionado"];
    return Pago20DoctoRelacionado(
      idDocumento: json["IdDocumento"] ?? '',
      serie: json["Serie"] ?? '',
      folio: json["Folio"] ?? '',
      monedaDr: json["MonedaDR"] ?? '',
      equivalenciaDr: json["EquivalenciaDR"] ?? '',
      numParcialidad: json["NumParcialidad"] ?? '',
      impSaldoAnt: json["ImpSaldoAnt"] ?? '',
      impPagado: json["ImpPagado"] ?? '',
      impSaldoInsoluto: json["ImpSaldoInsoluto"] ?? '',
      objetoImpDr: json["ObjetoImpDR"] ?? '',
      tipoCambioDr: json['TipoCambioDR'] ?? '',
      pago20ImpuestosDr: Pago20ImpuestosDr.fromJson(
          json["pago${es.PVersionC}\u0024ImpuestosDR"] ?? {}, context),
    );
  }
}

class Pago20ImpuestosDr {
  Pago20ImpuestosDr({
    required this.pago20TrasladosDr,
  });

  Pago20TrasladosDr pago20TrasladosDr;

  factory Pago20ImpuestosDr.fromJson(Map<String, dynamic> json, context) {
    final es = Provider.of<DatosCfdi>(context, listen: false);
    return Pago20ImpuestosDr(
      pago20TrasladosDr: Pago20TrasladosDr.fromJson(
          json["pago${es.PVersionC}\u0024TrasladosDR"] ?? {}, context),
    );
  }
}

class Pago20TrasladosDr {
  Pago20TrasladosDr({
    required this.pago20TrasladoDr,
  });

  Pago20TrasladoDr pago20TrasladoDr;

  factory Pago20TrasladosDr.fromJson(Map<String, dynamic> json, context) {
    final es = Provider.of<DatosCfdi>(context, listen: false);
    return Pago20TrasladosDr(
      pago20TrasladoDr: Pago20TrasladoDr.fromJson(
          json["pago${es.PVersionC}\u0024TrasladoDR"] ?? {}),
    );
  }
}

class Pago20TrasladoDr {
  Pago20TrasladoDr({
    required this.baseDr,
    required this.impuestoDr,
    required this.tipoFactorDr,
    required this.tasaOCuotaDr,
    required this.importeDr,
  });

  String baseDr;
  String impuestoDr;
  String tipoFactorDr;
  String tasaOCuotaDr;
  String importeDr;

  factory Pago20TrasladoDr.fromJson(Map<String, dynamic> json) =>
      Pago20TrasladoDr(
        baseDr: json["BaseDR"] ?? "",
        impuestoDr: json["ImpuestoDR"] ?? "",
        tipoFactorDr: json["TipoFactorDR"] ?? "",
        tasaOCuotaDr: json["TasaOCuotaDR"] ?? "",
        importeDr: json["ImporteDR"] ?? "",
      );
}

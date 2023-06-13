// ignore_for_file: file_names

import 'dart:convert';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

nomina12cFromJson(String tipo, String str, String data, context) =>
    nomina12(tipo, json.decode(str), data, context);

nomina12(String tipo, Map<String, dynamic> parse, String data, context) {
  return Nomina12Nomina.fromJson(parse[tipo], data);
}

class Nomina12Nomina {
  Nomina12Nomina({
    required this.version,
    required this.tipoNomina,
    required this.fechaPago,
    required this.fechaInicialPago,
    required this.fechaFinalPago,
    required this.numDiasPagados,
    required this.totalPercepciones,
    required this.totalDeducciones,
    required this.totalOtrosPagos,
    required this.nomina12Emisor,
    required this.nomina12Receptor,
    required this.nomina12Percepciones,
    required this.nomina12Deducciones,
    required this.nomina12OtrosPagos,
  });

  String version;
  String tipoNomina;
  DateTime fechaPago;
  DateTime fechaInicialPago;
  DateTime fechaFinalPago;
  String numDiasPagados;
  String totalPercepciones;
  String totalDeducciones;
  String totalOtrosPagos;
  Nomina12Emisor nomina12Emisor;
  Nomina12Receptor nomina12Receptor;
  Nomina12Percepciones nomina12Percepciones;
  Nomina12Deducciones nomina12Deducciones;
  Nomina12OtrosPagos nomina12OtrosPagos;

  factory Nomina12Nomina.fromJson(Map<String, dynamic> json, String data) {
    return Nomina12Nomina(
      version: json["Version"] ?? '',
      tipoNomina: json["TipoNomina"] ?? '',
      fechaPago: DateTime.parse(json["FechaPago"]),
      fechaInicialPago: DateTime.parse(json["FechaInicialPago"]),
      fechaFinalPago: DateTime.parse(json["FechaFinalPago"]),
      numDiasPagados: json["NumDiasPagados"] ?? '',
      totalPercepciones: json["TotalPercepciones"] ?? '',
      totalDeducciones: json["TotalDeducciones"] ?? '',
      totalOtrosPagos: json["TotalOtrosPagos"] ?? '',
      nomina12Emisor: Nomina12Emisor.fromJson(json["nomina12\u0024Emisor"]),
      nomina12Receptor:
          Nomina12Receptor.fromJson(json["nomina12\u0024Receptor"]),
      nomina12Percepciones: json['nomina12\u0024Percepciones'] == null
          ? Nomina12Percepciones(
              totalSueldos: '',
              totalGravado: '',
              totalExento: '',
              nomina12Percepcion: [])
          : Nomina12Percepciones.fromJson(
              json["nomina12\u0024Percepciones"], data),
      nomina12Deducciones: json["nomina12\u0024Deducciones"] == null
          ? Nomina12Deducciones(
              totalOtrasDeducciones: '',
              totalImpuestosRetenidos: '',
              nomina12Deduccion: [])
          : Nomina12Deducciones.fromJson(
              json["nomina12\u0024Deducciones"], data),
      nomina12OtrosPagos: json["nomina12\u0024OtrosPagos"] == null
          ? Nomina12OtrosPagos(nomina12OtroPago: [])
          : Nomina12OtrosPagos.fromJson(json["nomina12\u0024OtrosPagos"], data),
    );
  }
}

class Nomina12Emisor {
  Nomina12Emisor({
    required this.registroPatronal,
  });

  String registroPatronal;

  factory Nomina12Emisor.fromJson(Map<String, dynamic> json) => Nomina12Emisor(
        registroPatronal: json["RegistroPatronal"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "RegistroPatronal": registroPatronal,
      };
}

class Nomina12Receptor {
  Nomina12Receptor({
    required this.curp,
    required this.numSeguridadSocial,
    required this.fechaInicioRelLaboral,
    required this.antigedad,
    required this.tipoContrato,
    required this.sindicalizado,
    required this.tipoJornada,
    required this.tipoRegimen,
    required this.numEmpleado,
    required this.riesgoPuesto,
    required this.periodicidadPago,
    required this.banco,
    required this.cuentaBancaria,
    required this.salarioBaseCotApor,
    required this.salarioDiarioIntegrado,
    required this.claveEntFed,
  });

  String curp;
  String numSeguridadSocial;
  String fechaInicioRelLaboral;
  String antigedad;
  String tipoContrato;
  String sindicalizado;
  String tipoJornada;
  String tipoRegimen;
  String numEmpleado;
  String riesgoPuesto;
  String periodicidadPago;
  String banco;
  String cuentaBancaria;
  String salarioBaseCotApor;
  String salarioDiarioIntegrado;
  String claveEntFed;

  factory Nomina12Receptor.fromJson(Map<String, dynamic> json) =>
      Nomina12Receptor(
        curp: json["Curp"] ?? '',
        numSeguridadSocial: json["NumSeguridadSocial"] ?? '',
        fechaInicioRelLaboral: json["FechaInicioRelLaboral"] ?? '',
        antigedad: json["Antigüedad"] ?? '',
        tipoContrato: json["TipoContrato"] ?? '',
        sindicalizado: json["Sindicalizado"] ?? '',
        tipoJornada: json["TipoJornada"] ?? '',
        tipoRegimen: json["TipoRegimen"] ?? '',
        numEmpleado: json["NumEmpleado"] ?? '',
        riesgoPuesto: json["RiesgoPuesto"] ?? '',
        periodicidadPago: json["PeriodicidadPago"] ?? '',
        banco: json["Banco"] ?? '',
        cuentaBancaria: json["CuentaBancaria"] ?? '',
        salarioBaseCotApor: json["SalarioBaseCotApor"] ?? '',
        salarioDiarioIntegrado: json["SalarioDiarioIntegrado"] ?? '',
        claveEntFed: json["ClaveEntFed"] ?? '',
      );
}

class Nomina12Percepciones {
  Nomina12Percepciones({
    required this.totalSueldos,
    required this.totalGravado,
    required this.totalExento,
    required this.nomina12Percepcion,
  });

  String totalSueldos;
  String totalGravado;
  String totalExento;
  List nomina12Percepcion;

  factory Nomina12Percepciones.fromJson(
      Map<String, dynamic> jsond, String data) {
    final Xml2Json xml = Xml2Json();
    List listP = [];
    final doc = XmlDocument.parse(data);
    final perp = doc
        .getElement('nomina12:Nomina')!
        .findAllElements('nomina12:Percepciones');

    final perpres = XmlDocument.parse(
        perp.toString().replaceAll('(', '').replaceAll(')', ''));
    final res = perpres
        .getElement('nomina12:Percepciones')!
        .findAllElements('nomina12:Percepcion');

    for (var i = 0; i < res.length; i++) {
      xml.parse(
          res.elementAt(i).toString().replaceAll('(', '').replaceAll(')', ''));
      var js = xml.toGData();
      listP.add(js);
    }

    return Nomina12Percepciones(
      totalSueldos: jsond["TotalSueldos"] ?? '',
      totalGravado: jsond["TotalGravado"] ?? '',
      totalExento: jsond["TotalExento"] ?? '',
      nomina12Percepcion: List.from(
          listP.map((x) => Nomina12Percepcion.fromJson(json.decode(x)))),
    );
  }
}

class Nomina12Percepcion {
  Nomina12Percepcion({
    required this.tipoPercepcion,
    required this.clave,
    required this.concepto,
    required this.importeGravado,
    required this.importeExento,
    required this.nomina12HorasExtra,
  });

  String tipoPercepcion;
  String clave;
  String concepto;
  String importeGravado;
  String importeExento;
  Nomina12HorasExtra nomina12HorasExtra;

  factory Nomina12Percepcion.fromJson(Map<String, dynamic> parse) {
    final json = parse['nomina12\$Percepcion'];
    return Nomina12Percepcion(
      tipoPercepcion: json["TipoPercepcion"] ?? '',
      clave: json["Clave"] ?? '',
      concepto: json["Concepto"] ?? '',
      importeGravado: json["ImporteGravado"] ?? '',
      importeExento: json["ImporteExento"] ?? '',
      nomina12HorasExtra: json["nomina12\u0024HorasExtra"] == null
          ? Nomina12HorasExtra(
              dias: '', tipoHoras: '', horasExtra: '', importePagado: '')
          : Nomina12HorasExtra.fromJson(json["nomina12\u0024HorasExtra"]),
    );
  }
}

class Nomina12Deducciones {
  Nomina12Deducciones({
    required this.totalOtrasDeducciones,
    required this.totalImpuestosRetenidos,
    required this.nomina12Deduccion,
  });

  String totalOtrasDeducciones;
  String totalImpuestosRetenidos;
  List<Nomina12Deduccion> nomina12Deduccion;

  factory Nomina12Deducciones.fromJson(
      Map<String, dynamic> jsond, String data) {
    final Xml2Json xml = Xml2Json();
    List listD = [];
    final doc = XmlDocument.parse(data);
    final ded = doc
        .getElement('nomina12:Nomina')!
        .findAllElements('nomina12:Deducciones');

    final dedres = XmlDocument.parse(
        ded.toString().replaceAll('(', '').replaceAll(')', ''));
    final res = dedres
        .getElement('nomina12:Deducciones')!
        .findAllElements('nomina12:Deduccion');

    for (var i = 0; i < res.length; i++) {
      xml.parse(
          res.elementAt(i).toString().replaceAll('(', '').replaceAll(')', ''));
      var js = xml.toGData();
      listD.add(js);
    }

    return Nomina12Deducciones(
      totalOtrasDeducciones: jsond["TotalOtrasDeducciones"] ?? '',
      totalImpuestosRetenidos: jsond["TotalImpuestosRetenidos"] ?? '',
      nomina12Deduccion: List<Nomina12Deduccion>.from(
          listD.map((x) => Nomina12Deduccion.fromJson(json.decode(x)))),
    );
  }
}

class Nomina12Deduccion {
  Nomina12Deduccion({
    required this.tipoDeduccion,
    required this.clave,
    required this.concepto,
    required this.importe,
  });

  String tipoDeduccion;
  String clave;
  String concepto;
  String importe;

  factory Nomina12Deduccion.fromJson(Map<String, dynamic> parse) {
    final json = parse['nomina12\$Deduccion'];
    return Nomina12Deduccion(
      tipoDeduccion: json["TipoDeduccion"] ?? '',
      clave: json["Clave"] ?? '',
      concepto: json["Concepto"] ?? '',
      importe: json["Importe"] ?? '',
    );
  }
}

class Nomina12OtrosPagos {
  Nomina12OtrosPagos({
    required this.nomina12OtroPago,
  });

  List nomina12OtroPago;

  factory Nomina12OtrosPagos.fromJson(Map<String, dynamic> jsonp, String data) {
    final Xml2Json xml = Xml2Json();
    List listOT = [];
    final doc = XmlDocument.parse(data);
    final otp = doc
        .getElement('nomina12:Nomina')!
        .findAllElements('nomina12:OtrosPagos');

    final otpres = XmlDocument.parse(
        otp.toString().replaceAll('(', '').replaceAll(')', ''));

    final res = otpres
        .getElement('nomina12:OtrosPagos')!
        .findAllElements('nomina12:OtroPago');

    for (var i = 0; i < res.length; i++) {
      xml.parse(
          res.elementAt(i).toString().replaceAll('(', '').replaceAll(')', ''));
      var js = xml.toGData();
      listOT.add(js);
    }

    return Nomina12OtrosPagos(
      nomina12OtroPago: List<Nomina12OtroPago>.from(
          listOT.map((x) => Nomina12OtroPago.fromJson(json.decode(x)))),
    );
  }
}

class Nomina12OtroPago {
  Nomina12OtroPago({
    required this.tipoOtroPago,
    required this.clave,
    required this.concepto,
    required this.importe,
    required this.nomina12SubsidioAlEmpleo,
  });

  String tipoOtroPago;
  String clave;
  String concepto;
  String importe;
  Nomina12SubsidioAlEmpleo? nomina12SubsidioAlEmpleo;

  factory Nomina12OtroPago.fromJson(Map<String, dynamic> parse) {
    final json = parse['nomina12\$OtroPago'];

    return Nomina12OtroPago(
      tipoOtroPago: json["TipoOtroPago"] ?? '',
      clave: json["Clave"] ?? '',
      concepto: json["Concepto"] ?? '',
      importe: json["Importe"] ?? '',
      nomina12SubsidioAlEmpleo: json["nomina12\u0024SubsidioAlEmpleo"] == null
          ? Nomina12SubsidioAlEmpleo(subsidioCausado: '')
          : Nomina12SubsidioAlEmpleo.fromJson(
              json["nomina12\u0024SubsidioAlEmpleo"]),
    );
  }
}

class Nomina12SubsidioAlEmpleo {
  Nomina12SubsidioAlEmpleo({
    required this.subsidioCausado,
  });

  String subsidioCausado;

  factory Nomina12SubsidioAlEmpleo.fromJson(Map<String, dynamic> json) =>
      Nomina12SubsidioAlEmpleo(
        subsidioCausado: json["SubsidioCausado"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "SubsidioCausado": subsidioCausado,
      };
}

class Nomina12HorasExtra {
  Nomina12HorasExtra({
    required this.dias,
    required this.tipoHoras,
    required this.horasExtra,
    required this.importePagado,
  });

  String dias;
  String tipoHoras;
  String horasExtra;
  String importePagado;

  factory Nomina12HorasExtra.fromJson(Map<String, dynamic> json) =>
      Nomina12HorasExtra(
        dias: json["Dias"] ?? '',
        tipoHoras: json["TipoHoras"] ?? '',
        horasExtra: json["HorasExtra"] ?? '',
        importePagado: json["ImportePagado"] ?? '',
      );
}

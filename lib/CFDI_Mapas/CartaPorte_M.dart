// ignore_for_file: file_names

import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

cartaporteAutoFromJson(String tipo, String str, context) =>
    cartaporte(tipo, str, context);
cartaporte(String tipo, String str, context) {
  var es = Provider.of<DatosCfdi>(context, listen: false);
  str.contains('Autotransporte')
      ? es.cartaPorteAuto = Cartaporte20CartaPorte.fromJson(str, tipo, context)
      : {};
}

class Cartaporte20CartaPorte {
  Cartaporte20CartaPorte(
      {required this.totalDistRec,
      required this.transpInternac,
      required this.version,
      required this.cartaporte20FiguraTransporte,
      required this.cartaporte20Ubicaciones,
      required this.cartaporte20Mercancias,
      required this.cartaporte20MercanciasT,
      required this.carttaporte20Autotrasporte});

  String totalDistRec;
  String transpInternac;
  String version;
  List cartaporte20FiguraTransporte;
  List cartaporte20Ubicaciones;
  List cartaporte20Mercancias;
  Cartaporte20MercanciaT cartaporte20MercanciasT;
  List carttaporte20Autotrasporte;

  factory Cartaporte20CartaPorte.fromJson(String str, String tipo, context) {
    var es = Provider.of<DatosCfdi>(context, listen: false);
    final v = es.PVersionC;
    List figuraT = [];
    List ubicacioT = [];
    List mercaT = [];
    List autoT = [];
    ///////////////////////////////
    final Xml2Json xml = Xml2Json();
    xml.parse(str);
    var js = xml.toGData();
    final jsonres = json.decode(js);
    final jsonc = jsonres[tipo];
    //////////////////////////////
    final cp = XmlDocument.parse(str);
    final figuraTipo = cp
        .getElement('cartaporte$v:CartaPorte')!
        .findAllElements('cartaporte$v:FiguraTransporte');
    final tiposFiguras = XmlDocument.parse(
        figuraTipo.toString().replaceAll('(', '').replaceAll(')', ''));
    final tiposFigura = tiposFiguras
        .getElement('cartaporte$v:FiguraTransporte')!
        .findAllElements('cartaporte$v:TiposFigura');

    for (var i = 0; i < tiposFigura.length; i++) {
      final parsetf = tiposFigura
          .elementAt(i)
          .toString()
          .replaceAll('(', '')
          .replaceAll(')', '');
      xml.parse(parsetf);
      var js = xml.toGData();
      figuraT.add(Cartaporte20TiposFigura.fromJson(
          json.decode(js), 'cartaporte$v\$TiposFigura'));
    }

    final ubicacionc = cp
        .getElement('cartaporte$v:CartaPorte')!
        .findAllElements('cartaporte$v:Ubicaciones');
    final ubicaciones = XmlDocument.parse(
        ubicacionc.toString().replaceAll('(', '').replaceAll(')', ''));
    final ubicacion = ubicaciones
        .getElement('cartaporte$v:Ubicaciones')!
        .findAllElements('cartaporte$v:Ubicacion');
    for (var i = 0; i < ubicacion.length; i++) {
      final parseub = ubicacion
          .elementAt(i)
          .toString()
          .replaceAll('(', '')
          .replaceAll(')', '');
      xml.parse(parseub);
      var js = xml.toGData();
      ubicacioT.add(Cartaporte20Ubicacion.fromJson(
          json.decode(js), 'cartaporte$v\$Ubicacion'));
    }

    final mercanciasc = cp
        .getElement('cartaporte$v:CartaPorte')!
        .findAllElements('cartaporte$v:Mercancias');
    final mercancias = XmlDocument.parse(
        mercanciasc.toString().replaceAll('(', '').replaceAll(')', ''));
    xml.parse(mercancias.toString());
    final mjs = xml.toGData();

    final mercancia = mercancias
        .getElement('cartaporte$v:Mercancias')!
        .findAllElements('cartaporte$v:Mercancia');

    for (var i = 0; i < mercancia.length; i++) {
      final parsem = mercancia
          .elementAt(i)
          .toString()
          .replaceAll('(', '')
          .replaceAll(')', '');
      xml.parse(parsem);
      final js = xml.toGData();
      mercaT.add(Cartaporte20Mercancia.fromJson(
          json.decode(js), 'cartaporte$v\$Mercancia', context));
    }

    final autotrans = mercancias
        .getElement('cartaporte$v:Mercancias')!
        .findAllElements('cartaporte$v:Autotransporte');
    for (var i = 0; i < autotrans.length; i++) {
      final parsea = autotrans
          .elementAt(i)
          .toString()
          .replaceAll('(', '')
          .replaceAll(')', '');
      xml.parse(parsea);
      final js = xml.toGData();
      autoT.add(Cartaporte20Autotransporte.fromJson(
          json.decode(js), 'cartaporte$v\$Autotransporte', context));
    }

    //////////////////////////////////////////////////////////////////////////
    return Cartaporte20CartaPorte(
        totalDistRec: jsonc["TotalDistRec"] ?? '',
        transpInternac: jsonc["TranspInternac"] ?? '',
        version: jsonc["Version"] ?? '',
        cartaporte20FiguraTransporte: figuraT,
        cartaporte20Ubicaciones: ubicacioT,
        cartaporte20MercanciasT: Cartaporte20MercanciaT.fromJson(
            json.decode(mjs), 'cartaporte$v\$Mercancias'),
        cartaporte20Mercancias: mercaT,
        carttaporte20Autotrasporte: autoT);
  }
}

class Cartaporte20TiposFigura {
  Cartaporte20TiposFigura({
    required this.numLicencia,
    required this.rfcFigura,
    required this.tipoFigura,
    required this.nombreFigura,
    required this.numRegIdTribFigura,
    required this.residenciaFiscalFigura,
  });

  String numLicencia;
  String rfcFigura;
  String tipoFigura;
  String nombreFigura;
  String numRegIdTribFigura;
  String residenciaFiscalFigura;

  factory Cartaporte20TiposFigura.fromJson(
      Map<String, dynamic> jsontf, String tipo) {
    final json = jsontf[tipo];
    return Cartaporte20TiposFigura(
      numLicencia: json["NumLicencia"] ?? '',
      rfcFigura: json["RFCFigura"] ?? '',
      tipoFigura: json["TipoFigura"] ?? '',
      nombreFigura: json["NombreFigura"] ?? '',
      numRegIdTribFigura: json["NumRegIdTribFigura"] ?? '',
      residenciaFiscalFigura: json["ResidenciaFiscalFigura"] ?? '',
    );
  }
}

class Cartaporte20Ubicacion {
  Cartaporte20Ubicacion({
    required this.fechaHoraSalidaLlegada,
    required this.idUbicacion,
    required this.rfcRemitenteDestinatario,
    required this.tipoUbicacion,
    required this.cartaporte20Domicilio,
    this.distanciaRecorrida,
  });

  String fechaHoraSalidaLlegada;
  String idUbicacion;
  String rfcRemitenteDestinatario;
  String tipoUbicacion;
  Cartaporte20Domicilio cartaporte20Domicilio;
  String? distanciaRecorrida;

  factory Cartaporte20Ubicacion.fromJson(
      Map<String, dynamic> jsonub, String tipo) {
    final json = jsonub[tipo];
    return Cartaporte20Ubicacion(
      fechaHoraSalidaLlegada: json["FechaHoraSalidaLlegada"] ?? '',
      idUbicacion: json["IDUbicacion"] ?? '',
      rfcRemitenteDestinatario: json["RFCRemitenteDestinatario"] ?? '',
      tipoUbicacion: json["TipoUbicacion"] ?? '',
      cartaporte20Domicilio: Cartaporte20Domicilio.fromJson(
          json["cartaporte20\u0024Domicilio"] ?? {}),
      distanciaRecorrida: json["DistanciaRecorrida"] ?? '',
    );
  }
}

class Cartaporte20Domicilio {
  Cartaporte20Domicilio({
    required this.calle,
    required this.codigoPostal,
    required this.colonia,
    required this.estado,
    required this.localidad,
    required this.municipio,
    required this.numeroExterior,
    required this.pais,
    this.referencia,
  });

  String calle;
  String codigoPostal;
  String colonia;
  String estado;
  String localidad;
  String municipio;
  String numeroExterior;
  String pais;
  String? referencia;

  factory Cartaporte20Domicilio.fromJson(Map<String, dynamic> json) =>
      Cartaporte20Domicilio(
        calle: json["Calle"] ?? '',
        codigoPostal: json["CodigoPostal"] ?? '',
        colonia: json["Colonia"] ?? '',
        estado: json["Estado"] ?? '',
        localidad: json["Localidad"] ?? '',
        municipio: json["Municipio"] ?? '',
        numeroExterior: json["NumeroExterior"] ?? '',
        pais: json["Pais"] ?? '',
        referencia: json["Referencia"] ?? '',
      );
}

class Cartaporte20MercanciaT {
  Cartaporte20MercanciaT(
      {required this.numTotalMercancias,
      required this.pesoBrutoTotal,
      required this.unidadPeso});

  String numTotalMercancias;
  String pesoBrutoTotal;
  String unidadPeso;
  factory Cartaporte20MercanciaT.fromJson(
      Map<String, dynamic> jsonm, String tipo) {
    final json = jsonm[tipo];
    return Cartaporte20MercanciaT(
        numTotalMercancias: json['NumTotalMercancias'] ?? '',
        pesoBrutoTotal: json['PesoBrutoTotal'] ?? '',
        unidadPeso: json['UnidadPeso'] ?? '');
  }
}

class Cartaporte20Mercancia {
  Cartaporte20Mercancia({
    required this.bienesTransp,
    required this.cantidad,
    required this.claveUnidad,
    required this.descripcion,
    required this.moneda,
    required this.pesoEnKg,
    required this.valorMercancia,
    required this.cartaporte20CantidadTransporta,
  });

  String bienesTransp;
  String cantidad;
  String claveUnidad;
  String descripcion;
  String moneda;
  String pesoEnKg;
  String valorMercancia;
  Cartaporte20CantidadTransporta cartaporte20CantidadTransporta;
  factory Cartaporte20Mercancia.fromJson(
      Map<String, dynamic> jsonm, String tipo, context) {
    var es = Provider.of<DatosCfdi>(context, listen: false);
    final v = es.PVersionC;
    final json = jsonm[tipo];
    return Cartaporte20Mercancia(
      bienesTransp: json["BienesTransp"] ?? '',
      cantidad: json["Cantidad"] ?? '',
      claveUnidad: json["ClaveUnidad"] ?? '',
      descripcion: json["Descripcion"] ?? '',
      moneda: json["Moneda"] ?? '',
      pesoEnKg: json["PesoEnKg"] ?? '',
      valorMercancia: json["ValorMercancia"] ?? '',
      cartaporte20CantidadTransporta: Cartaporte20CantidadTransporta.fromJson(
          json["cartaporte$v\u0024CantidadTransporta"] ?? {}),
    );
  }
}

class Cartaporte20CantidadTransporta {
  Cartaporte20CantidadTransporta(
      {required this.cantidad,
      required this.idDestino,
      required this.idOrigen,
      required this.claveTransporte});

  String cantidad;
  String idDestino;
  String idOrigen;
  String claveTransporte;

  factory Cartaporte20CantidadTransporta.fromJson(Map<String, dynamic> json) =>
      Cartaporte20CantidadTransporta(
          cantidad: json["Cantidad"] ?? '',
          idDestino: json["IDDestino"] ?? '',
          idOrigen: json["IDOrigen"] ?? '',
          claveTransporte: json['ClaveTransporte'] ?? '');
}

class Cartaporte20Autotransporte {
  Cartaporte20Autotransporte({
    required this.numPermisoSct,
    required this.permSct,
    required this.cartaporte20IdentificacionVehicular,
    required this.cartaporte20Seguros,
    required this.cartaporte20Remolques,
  });

  String numPermisoSct;
  String permSct;
  Cartaporte20IdentificacionVehicular cartaporte20IdentificacionVehicular;
  Cartaporte20Seguros cartaporte20Seguros;
  Cartaporte20Remolques cartaporte20Remolques;

  factory Cartaporte20Autotransporte.fromJson(
      Map<String, dynamic> jsonauto, String tipo, context) {
    var es = Provider.of<DatosCfdi>(context, listen: false);
    final v = es.PVersionC;
    final json = jsonauto[tipo];
    return Cartaporte20Autotransporte(
      numPermisoSct: json["NumPermisoSCT"] ?? '',
      permSct: json["PermSCT"] ?? '',
      cartaporte20IdentificacionVehicular:
          json["cartaporte$v\u0024IdentificacionVehicular"] == null
              ? Cartaporte20IdentificacionVehicular(
                  anioModeloVm: '', configVehicular: '', placaVm: '')
              : Cartaporte20IdentificacionVehicular.fromJson(
                  json["cartaporte$v\u0024IdentificacionVehicular"]),
      cartaporte20Seguros: json["cartaporte$v\u0024Seguros"] == null
          ? Cartaporte20Seguros(
              aseguraRespCivil: '',
              polizaMedAmbiente: '',
              polizaRespCivil: '',
              aseguraMedAmbiente: '')
          : Cartaporte20Seguros.fromJson(json["cartaporte$v\u0024Seguros"]),
      cartaporte20Remolques: json["cartaporte$v\u0024Remolques"] == null
          ? Cartaporte20Remolques(
              cartaporte20Remolque:
                  Cartaporte20Remolque(placa: '', subTipoRem: ''))
          : Cartaporte20Remolques.fromJson(
              json["cartaporte$v\u0024Remolques"], context),
    );
  }
}

class Cartaporte20IdentificacionVehicular {
  Cartaporte20IdentificacionVehicular({
    required this.anioModeloVm,
    required this.configVehicular,
    required this.placaVm,
  });

  String anioModeloVm;
  String configVehicular;
  String placaVm;

  factory Cartaporte20IdentificacionVehicular.fromJson(
          Map<String, dynamic> json) =>
      Cartaporte20IdentificacionVehicular(
        anioModeloVm: json["AnioModeloVM"] ?? '',
        configVehicular: json["ConfigVehicular"] ?? '',
        placaVm: json["PlacaVM"] ?? '',
      );
}

class Cartaporte20Remolques {
  Cartaporte20Remolques({
    required this.cartaporte20Remolque,
  });

  Cartaporte20Remolque cartaporte20Remolque;

  factory Cartaporte20Remolques.fromJson(Map<String, dynamic> json, context) {
    var es = Provider.of<DatosCfdi>(context, listen: false);
    final v = es.PVersionC;
    return Cartaporte20Remolques(
      cartaporte20Remolque: Cartaporte20Remolque.fromJson(
          json["cartaporte$v\u0024Remolque"] ?? {}),
    );
  }
}

class Cartaporte20Remolque {
  Cartaporte20Remolque({
    required this.placa,
    required this.subTipoRem,
  });

  String placa;
  String subTipoRem;

  factory Cartaporte20Remolque.fromJson(Map<String, dynamic> json) =>
      Cartaporte20Remolque(
        placa: json["Placa"] ?? '',
        subTipoRem: json["SubTipoRem"] ?? '',
      );
}

class Cartaporte20Seguros {
  Cartaporte20Seguros({
    required this.aseguraRespCivil,
    required this.polizaMedAmbiente,
    required this.polizaRespCivil,
    required this.aseguraMedAmbiente,
  });

  String aseguraRespCivil;
  String polizaMedAmbiente;
  String polizaRespCivil;
  String aseguraMedAmbiente;

  factory Cartaporte20Seguros.fromJson(Map<String, dynamic> json) =>
      Cartaporte20Seguros(
        aseguraRespCivil: json["AseguraRespCivil"] ?? '',
        aseguraMedAmbiente: json['AseguraMedAmbiente'] ?? '',
        polizaMedAmbiente: json["PolizaMedAmbiente"] ?? '',
        polizaRespCivil: json["PolizaRespCivil"] ?? '',
      );
}

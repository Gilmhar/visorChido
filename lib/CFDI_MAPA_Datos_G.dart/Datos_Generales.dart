// ignore_for_file: file_names

import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';

datosGeneralesFromjson(String tipo, String str, context) =>
    datosGenerales(tipo, json.decode(str), context);

datosGenerales(String tipo, Map<String, dynamic> parse, context) {
  var es = Provider.of<DatosCfdi>(context, listen: false);

  final json = parse[tipo];

  if (tipo.toUpperCase().contains('COMPROBANTE')) {
    es.xsiSchemaLocation = json["xsi:schemaLocation"] ?? '';
    es.version = json["Version"] ?? json['version'] ?? '';
    es.fecha = DateTime.parse(json["Fecha"] ?? json['fecha'] ?? '');
    es.serie = json['Serie'] ?? json['serie'] ?? '';
    es.folio = json['Folio'] ?? json['folio'] ?? '';
    es.sello = json["Sello"] ?? json['sello'] ?? '';
    es.formaPago = json["FormaPago"] ?? json['formaDePago'] ?? '';
    es.noCertificado = json["NoCertificado"] ?? json['noCertificado'] ?? '';
    es.certificado = json["Certificado"] ?? json['certificado'] ?? '';
    es.subTotal = json["SubTotal"] ?? json['subTotal'] ?? '';
    es.descuento = json["Descuento"] ?? json['descuento'] ?? '';
    es.moneda = json["Moneda"] ?? json['moneda'] ?? '';
    es.total = json["Total"] ?? json['total'] ?? '';
    es.tipoDeComprobante =
        json["TipoDeComprobante"] ?? json['tipoDeComprobante'] ?? '';
    es.exportacion = json["Exportacion"] ?? '';
    es.metodoPago = json["MetodoPago"] ?? json['metodoDePago'] ?? '';
    es.lugarExpedicion =
        json["LugarExpedicion"] ?? json['lugarExpedicion'] ?? '';
    es.xmlns = List<Xmln>.from(json["xmlns"].map((x) => Xmln.fromJson(x)));
    es.xmlnsCfdi = json["xmlns\u0024cfdi"] ?? '';
    es.xmlnsXsi = json["xmlns\u0024xsi"] ?? '';
  } else if (tipo.toUpperCase().contains('EMISOR')) {
    es.rfcEmisor = json["Rfc"] ?? json['rfc'] ?? '';
    es.nombreEmisor = json["Nombre"] ?? json['nombre'] ?? '';

    if (json["RegimenFiscal"] == null) {
      es.regimenFiscalEmisor = '';
    } else {
      es.regimenFiscalEmisor = json["RegimenFiscal"] ?? json['regimenfiscal'];
    }

    es.regimenFiscalEmisor == ''
        ? es.regimenFiscalEmisor = json['cfdi\$RegimenFiscal']['Regimen']
        : es.regimenFiscalEmisor = es.regimenFiscalEmisor;

    es.domiciliocalleEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['calle'] ?? '';
    es.domicilionoExteriorEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['noExterior'] ?? '';
    es.domiciliocoloniaEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['colonia'] ?? '';
    es.domiciliolocalidadEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['localidad'] ?? '';
    es.domicilioreferenciaEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['referencia'] ?? '';
    es.domiciliomunicipioEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['municipio'] ?? '';
    es.domicilioestadoEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['estado'] ?? '';
    es.domiciliopaisEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['pais'] ?? '';
    es.domiciliocpEmisor = json['cfdi\$DomicilioFiscal'] == null
        ? ''
        : json['cfdi\$DomicilioFiscal']['codigoPostal'] ?? '';
  } else if (tipo.toUpperCase().contains('RECEPTOR')) {
    //TODO: AGREGAR DATOS RECEPTOR 3.2 CHECAR IMPUESTOS
    es.rfcReceptor = json["Rfc"] ?? json['rfc'] ?? '';
    es.nombreReceptor = json["Nombre"] ?? json['nombre'] ?? '';
    es.domicilioFiscalReceptor = json["DomicilioFiscalReceptor"] ?? '';
    es.regimenFiscalReceptor = json["RegimenFiscalReceptor"] ?? '';
    es.usoCfdiReceptor = json["UsoCFDI"] ?? '';

    es.domiciliocalleReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['calle'] ?? '';
    es.domicilionoExteriorReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['noExterior'] ?? '';
    es.domiciliocoloniaReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['colonia'] ?? '';
    es.domiciliolocalidadReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['localidad'] ?? '';
    es.domicilioreferenciaReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['referencia'] ?? '';
    es.domiciliomunicipioReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['municipio'] ?? '';
    es.domicilioestadoReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['estado'] ?? '';
    es.domiciliopaisReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['pais'] ?? '';
    es.domiciliocpReceptor = json['cfdi\$Domicilio'] == null
        ? ''
        : json['cfdi\$Domicilio']['codigoPostal'] ?? '';
  } else if (tipo.toUpperCase().contains('TIMBREFISCALDIGITAL')) {
    es.xsiSchemaLocationT = json["xsi:schemaLocation"] ?? "";
    es.versionT = json["Version"] ?? json["version"];
    es.uuidT = json["UUID"] ?? "";
    es.fechaTimbradoT = DateTime.parse(json["FechaTimbrado"]);
    es.rfcProvCertifT = json["RfcProvCertif"] ?? "";
    es.selloCfdT = json["SelloCFD"] ?? json["selloCFD"];
    es.noCertificadoSatT = json["NoCertificadoSAT"] ?? json["noCertificadoSAT"];
    es.selloSatT = json["SelloSAT"] ?? json["selloSAT"];
    es.xmlnsT = json["xmlns"] == null
        ? []
        : List<Xmln>.from(json["xmlns"].map((x) => Xmln.fromJson(x)));
    es.xmlnsTfdT = json["xmlns\u0024tfd"] ?? "";
    es.xmlnsXsiT = json["xmlns\u0024xsi"] ?? '';
  }
}

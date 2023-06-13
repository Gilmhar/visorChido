// ignore_for_file: file_names, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:visor_xml/CFDI_Mapas/CartaPorte_M.dart';

class DatosCfdi extends ChangeNotifier {
  late double heidh1;
  late double heidh2;
  late double heidh3;
  late double heidh4;
  
  late String xsiSchemaLocation;
  late String version;
  late String serie;
  late String folio;
  late DateTime fecha;
  late String sello;
  late String formaPago;
  late String noCertificado;
  late String certificado;
  late String subTotal;
  late String descuento;
  late String moneda;
  late String total;
  late String tipoDeComprobante;
  late String exportacion;
  late String metodoPago;
  late String lugarExpedicion;
  late List<Xmln> xmlns;
  late String xmlnsCfdi;
  late String xmlnsXsi;
  //DATOS EMISOR
  late String rfcEmisor;
  late String nombreEmisor;
  late String regimenFiscalEmisor;
  late String domiciliocalleEmisor;
  late String domicilionoExteriorEmisor;
  late String domiciliocoloniaEmisor;
  late String domiciliolocalidadEmisor;
  late String domicilioreferenciaEmisor;
  late String domiciliomunicipioEmisor;
  late String domicilioestadoEmisor;
  late String domiciliopaisEmisor;
  late String domiciliocpEmisor;
  //DATOS RECEPTOR
  late String rfcReceptor;
  late String nombreReceptor;
  late String domicilioFiscalReceptor;
  late String regimenFiscalReceptor;
  late String usoCfdiReceptor;
  late String domiciliocalleReceptor;
  late String domicilionoExteriorReceptor;
  late String domiciliocoloniaReceptor;
  late String domiciliolocalidadReceptor;
  late String domicilioreferenciaReceptor;
  late String domiciliomunicipioReceptor;
  late String domicilioestadoReceptor;
  late String domiciliopaisReceptor;
  late String domiciliocpReceptor;
  //DATOS TIMBRE FISCAL
  late String xsiSchemaLocationT;
  late String versionT;
  late String uuidT;
  late DateTime fechaTimbradoT;
  late String rfcProvCertifT;
  late String selloCfdT;
  late String noCertificadoSatT;
  late String selloSatT;
  late List<Xmln> xmlnsT;
  late String xmlnsTfdT;
  late String xmlnsXsiT;
  //DATOS CONCEPTO
  late List concepto;
  //IMPUESTOS TOTALES
  //IMPUESTOS TRASLADADOS LIST
  late String totalImpuestosTrasladados;
  late List impuestoTraslado;
  //IMPUESTOS RETENIDOS LIST
  late String totalImpuestosRetenidos;
  late List impuestoRetenido;
  //*****COMPLEMENTO PAGOS*****
  late String PVersionC;
  late String pagosVersion;
  late String pagoXxmlns;
  late String pagosTotalTrasladosBaseIVA16;
  late String pagosTotaltrasladosImpuestoIVA;
  late String pagosMontoTotal;
  late List complementoPagos;
  //*****COMPLEMENTO NOMINAS*****
  late List complementosNomina;
  //COMPLEMENTO CARTA PORTE AUTOTRASPORTE
  late Cartaporte20CartaPorte cartaPorteAuto;
}

class Xmln {
  Xmln();

  factory Xmln.fromJson(Map<String, dynamic> json) => Xmln();

  Map<String, dynamic> toJson() => {};
}

// ignore_for_file: file_names

import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';

// ignore: non_constant_identifier_names
vaciar_Datos(context) {
  var v = Provider.of<DatosCfdi>(context, listen: false);
  v.xsiSchemaLocation = '';
  v.version = '';
  v.serie = '';
  v.folio = '';
  v.fecha = DateTime(0000, 0, 0, 0);
  v.sello = '';
  v.formaPago = '';
  v.noCertificado = '';
  v.certificado = '';
  v.subTotal = '';
  v.descuento = '';
  v.moneda = '';
  v.total = '';
  v.tipoDeComprobante = '';
  v.exportacion = '';
  v.metodoPago = '';
  v.lugarExpedicion = '';
  v.xmlns = [];
  v.xmlnsCfdi = '';
  v.xmlnsXsi = '';

  v.rfcEmisor = '';
  v.nombreEmisor = '';
  v.regimenFiscalEmisor = '';
  v.domiciliocalleEmisor = '';
  v.domicilionoExteriorEmisor = '';
   v.domiciliocoloniaEmisor = '';

  v.domiciliolocalidadEmisor = '';
  v. domicilioreferenciaEmisor = '';
  v. domiciliomunicipioEmisor = '';
  v. domicilioestadoEmisor = '';
  v. domiciliopaisEmisor = '';
  v. domiciliocpEmisor = '';
  //DATOS RECEPTOR
  v. rfcReceptor = '';
  v. nombreReceptor = '';
  v. domicilioFiscalReceptor = '';
  v. regimenFiscalReceptor = '';
  v. usoCfdiReceptor = '';
  v. domiciliocalleReceptor = '';
  v. domicilionoExteriorReceptor = '';
  v. domiciliocoloniaReceptor = '';
  v. domiciliolocalidadReceptor = '';
  v. domicilioreferenciaReceptor = '';
  v. domiciliomunicipioReceptor = '';
  v. domicilioestadoReceptor = '';
  v. domiciliopaisReceptor = '';
  v. domiciliocpReceptor = '';
  //DATOS TIMBRE FISCAL
  v. xsiSchemaLocationT = '';
  v. versionT = '';
  v. uuidT = '';
  v. fechaTimbradoT = DateTime(0000,0,0,0);
  v. rfcProvCertifT = '';
  v. selloCfdT = '';
  v. noCertificadoSatT = '';
  v. selloSatT = '';
  v. xmlnsT = [];
  v. xmlnsTfdT = '';
  v. xmlnsXsiT = '';
  //DATOS CONCEPTO
  v. concepto = [];
  //IMPUESTOS TOTALES
  //IMPUESTOS TRASLADADOS LIST
  v. totalImpuestosTrasladados = '';
  v. impuestoTraslado = [];
  //IMPUESTOS RETENIDOS LIST
  v. totalImpuestosRetenidos = '';
  v. impuestoRetenido = [];
  //*****COMPLEMENTO PAGOS*****
  v. PVersionC = '';
  v. pagosVersion = '';
  v. pagoXxmlns = '';
  v. pagosTotalTrasladosBaseIVA16 = '';
  v. pagosTotaltrasladosImpuestoIVA = '';
  v. pagosMontoTotal = '';
  v. complementoPagos = [];
  //*****COMPLEMENTO NOMINAS*****
  v. complementosNomina = [];
}

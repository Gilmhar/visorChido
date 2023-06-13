// ignore_for_file: file_names

import 'package:provider/provider.dart';
import 'package:visor_xml/CFDI4.3_PDFs/PDF_CFID40.dart';
import 'package:visor_xml/CFDI4.3_PDFs/PDF_Cartaporte.dart';
import 'package:visor_xml/CFDI4.3_PDFs/PDF_Nomina12.dart';
import 'package:visor_xml/CFDI4.3_PDFs/PDF_Pagos.dart';
import 'package:visor_xml/CFDI4.3_PDFs_Validacion/PDF_Validacion_CFDI4.0.dart';
import 'package:visor_xml/CFDI4.3_PDFs_Validacion/PDF_Validacion_Cartaporte.dart';
import 'package:visor_xml/CFDI4.3_PDFs_Validacion/PDF_Validacion_Noima.dart';
import 'package:visor_xml/CFDI4.3_PDFs_Validacion/PDF_Validacion_Pagos20.dart';
import 'package:visor_xml/CFDI_MAPA_Datos_G.dart/Datos_Post.dart';
import 'package:visor_xml/Moldes/DatosDe.dart';
import 'package:visor_xml/Moldes/Nodos.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:visor_xml/Moldes/Vaciar_Datos.dart';

cargarComprobante(String data, context) async {
  vaciar_Datos(context);
  String cfdi = 'cfdi:Comprobante';
  String retenciones = '<retenciones:Retenciones';

  data.contains(cfdi)
      ? comprobante(data, context)
      : data.contains(retenciones)
          ? cfdiRetencion(data, context)
          : '';
}

void comprobante(String data, context) async {
  String cfdi40 = 'http://www.sat.gob.mx/cfd/4';
  String cfdi33 = 'http://www.sat.gob.mx/cfd/3';
  String pagos20 = 'http://www.sat.gob.mx/Pagos20';
  String pagos = 'http://www.sat.gob.mx/Pagos';
  String nomina12 = 'http://www.sat.gob.mx/nomina12';
  String cartaPorte20AutoT = 'http://www.sat.gob.mx/CartaPorte20';
  String cartaPorteAutoT = 'http://www.sat.gob.mx/CartaPorte';

  var save = Provider.of<DatosDe>(context, listen: false);
  final es = Provider.of<DatosCfdi>(context, listen: false);

  if (data.contains(pagos20)) {
    es.PVersionC = '20';
    save.comprobante('cfdi\$Comprobante', data, context);
    save.emisor('cfdi\$Comprobante', 'cfdi\$Emisor', data, context);
    save.receptor('cfdi\$Comprobante', 'cfdi\$Receptor', data, context);
    save.conceptos('cfdi\$Comprobante', 'cfdi\$Conceptos', 'cfdi\$Concepto',
        data, context);
    save.timbre('cfdi\$Comprobante', 'cfdi\$Complemento', data,
        'tfd\$TimbreFiscalDigital', context);
    save.complementoPagos(
        'cfdi\$Comprobante', 'cfdi\$Complemento', data, context);
  } else if (data.contains(pagos)) {
    es.PVersionC = '10';
    save.comprobante('cfdi\$Comprobante', data, context);
    save.emisor('cfdi\$Comprobante', 'cfdi\$Emisor', data, context);
    save.receptor('cfdi\$Comprobante', 'cfdi\$Receptor', data, context);
    save.conceptos('cfdi\$Comprobante', 'cfdi\$Conceptos', 'cfdi\$Concepto',
        data, context);
    save.timbre('cfdi\$Comprobante', 'cfdi\$Complemento', data,
        'tfd\$TimbreFiscalDigital', context);
    save.complementoPagos(
        'cfdi\$Comprobante', 'cfdi\$Complemento', data, context);
  } else if (data.contains(nomina12)) {
    save.comprobante('cfdi\$Comprobante', data, context);
    save.emisor('cfdi\$Comprobante', 'cfdi\$Emisor', data, context);
    save.receptor('cfdi\$Comprobante', 'cfdi\$Receptor', data, context);
    save.conceptos('cfdi\$Comprobante', 'cfdi\$Conceptos', 'cfdi\$Concepto',
        data, context);
    save.timbre('cfdi\$Comprobante', 'cfdi\$Complemento', data,
        'tfd\$TimbreFiscalDigital', context);
    save.complementoNomina(
        'cfdi\$Comprobante', 'cfdi\$Complemento', data, context);
  } else if (data.contains(cartaPorte20AutoT)) {
    es.PVersionC = '20';
    save.impuestos('cfdi\$Comprobante', 'cfdi\$Impuestos', data, context);
    save.comprobante('cfdi\$Comprobante', data, context);
    save.emisor('cfdi\$Comprobante', 'cfdi\$Emisor', data, context);
    save.receptor('cfdi\$Comprobante', 'cfdi\$Receptor', data, context);
    save.conceptos('cfdi\$Comprobante', 'cfdi\$Conceptos', 'cfdi\$Concepto',
        data, context);
    save.timbre('cfdi\$Comprobante', 'cfdi\$Complemento', data,
        'tfd\$TimbreFiscalDigital', context);
    save.complementoCartaporte(
        'cfdi\$Comprobante', 'cfdi\$Complemento', data, context);
  } else if (data.contains(cartaPorteAutoT)) {
    es.PVersionC = '';
    save.impuestos('cfdi\$Comprobante', 'cfdi\$Impuestos', data, context);
    save.comprobante('cfdi\$Comprobante', data, context);
    save.emisor('cfdi\$Comprobante', 'cfdi\$Emisor', data, context);
    save.receptor('cfdi\$Comprobante', 'cfdi\$Receptor', data, context);
    save.conceptos('cfdi\$Comprobante', 'cfdi\$Conceptos', 'cfdi\$Concepto',
        data, context);
    save.timbre('cfdi\$Comprobante', 'cfdi\$Complemento', data,
        'tfd\$TimbreFiscalDigital', context);
    save.complementoCartaporte(
        'cfdi\$Comprobante', 'cfdi\$Complemento', data, context);
  } else if (data.contains(cfdi40)) {
    save.comprobante('cfdi\$Comprobante', data, context);
    save.emisor('cfdi\$Comprobante', 'cfdi\$Emisor', data, context);
    save.receptor('cfdi\$Comprobante', 'cfdi\$Receptor', data, context);
    save.impuestos('cfdi\$Comprobante', 'cfdi\$Impuestos', data, context);
    save.conceptos('cfdi\$Comprobante', 'cfdi\$Conceptos', 'cfdi\$Concepto',
        data, context);
    save.timbre('cfdi\$Comprobante', 'cfdi\$Complemento', data,
        'tfd\$TimbreFiscalDigital', context);
  } else if (data.contains(cfdi33)) {
    save.comprobante('cfdi\$Comprobante', data, context);
    save.emisor('cfdi\$Comprobante', 'cfdi\$Emisor', data, context);
    save.receptor('cfdi\$Comprobante', 'cfdi\$Receptor', data, context);
    save.impuestos('cfdi\$Comprobante', 'cfdi\$Impuestos', data, context);
    save.conceptos('cfdi\$Comprobante', 'cfdi\$Conceptos', 'cfdi\$Concepto',
        data, context);
    save.timbre('cfdi\$Comprobante', 'cfdi\$Complemento', data,
        'tfd\$TimbreFiscalDigital', context);
  } else {}
}

cfdiRetencion(String data, context) {}

/////////////////////////////////////////////////////////////////////

Future crearPDFV(String data, context) async {
  String cfdi = '<cfdi:Comprobante';
  String pagos20 = 'http://www.sat.gob.mx/Pagos20';
  String pagos10 = 'http://www.sat.gob.mx/Pagos';
  String nomina12 = 'http://www.sat.gob.mx/nomina12';
  String cartaporte20 = 'http://www.sat.gob.mx/CartaPorte20';
  String retenciones = '<retenciones:Retenciones';

  if (data.contains(cfdi)) {
    return data.contains(pagos20)
        ? await PDFPagos20Validacion(context, data)
        : data.contains(pagos10)
            ? await PDFPagos20Validacion(context, data)
            : data.contains(nomina12)
                ? await PDFNominaValidacion(context, data)
                : data.contains(cartaporte20)
                    ? await PDFcartaPorteValidacion(context, data)
                    : await PDFCFDI4Validacion(context, data);
  } else if (data.contains(retenciones)) {}
}

void crearPdf(String data, context) async {
  String cfdi = '<cfdi:Comprobante';
  String pagos20 = 'http://www.sat.gob.mx/Pagos20';
  String pagos10 = 'http://www.sat.gob.mx/Pagos';
  String nomina12 = 'http://www.sat.gob.mx/nomina12';
  String cartaporte20 = 'http://www.sat.gob.mx/CartaPorte20';
  String retenciones = '<retenciones:Retenciones';
  if (data.contains(cfdi)) {
    data.contains(pagos20)
        ? await PDFPagos20(context, data)
        : data.contains(pagos10)
            ? await PDFPagos20(context, data)
            : data.contains(nomina12)
                ? await PDFNomina12(context, data)
                : data.contains(cartaporte20)
                    ? await PDFCartaPorte(context, data)
                    : await PDF40(context, data);
  } else if (data.contains(retenciones)) {}
}

vSATP(String nodoG, String etEm, String etRe, String etT, String subetT,
    String data) {
  final emi = subNodojs(data, nodoG, etEm);
  final rec = subNodojs(data, nodoG, etRe);
  final timbre = subSubNodojs(data, nodoG, etT, subetT);
  eruDatos(etEm, emi, etRe, rec, subetT, timbre);
}

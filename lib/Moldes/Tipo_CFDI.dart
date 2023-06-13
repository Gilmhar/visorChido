// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:visor_xml/CFDI4.3_Disenos/Cartaporte_40.dart';
import 'package:visor_xml/CFDI4.3_Disenos/Factura_40.dart';
import 'package:visor_xml/CFDI4.3_Disenos/Nomina_40.dart';
import 'package:visor_xml/CFDI4.3_PDFs/PDF_CFID40.dart';
import 'package:visor_xml/CFDI4.3_PDFs/PDF_Cartaporte.dart';
import 'package:visor_xml/CFDI4.3_PDFs/PDF_Nomina12.dart';
import 'package:visor_xml/CFDI4.3_PDFs/PDF_Pagos.dart';
import 'package:visor_xml/CFDI4.3_PDFs_Validacion/PDF_Validacion_Cartaporte.dart';
import 'package:visor_xml/CFDI4.3_PDFs_Validacion/PDF_Validacion_Noima.dart';
import 'package:visor_xml/CFDI4.3_PDFs_Validacion/PDF_Validacion_CFDI4.0.dart';
import 'package:visor_xml/CFDI4.3_PDFs_Validacion/PDF_Validacion_Pagos20.dart';
import 'package:visor_xml/CFDI4.3_Disenos/Pagos20_40.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Retenciones_/interese.dart';

class TipoCFDI with ChangeNotifier {
  String cfdi = '<cfdi:Comprobante';
  String pagos20 = 'http://www.sat.gob.mx/Pagos20';
  String pagos10 = 'http://www.sat.gob.mx/Pagos';
  String nomina12 = 'http://www.sat.gob.mx/nomina12';
  String cartaporte20 = 'http://www.sat.gob.mx/CartaPorte20';
  String cartaPorte = 'http://www.sat.gob.mx/CartaPorte';
  String retenciones = '<retenciones:Retenciones';

  //MANDA XML A LA PAGINA DE RESALTADO
  Future<String?> od(context) async {
    return Pref.file;
  }

  //MANDA XML A LA PAGINA DE VALIDACION PDF DEPENDIENDO EL TIPO QUE SEA
  Future validarPDF(context, String data) async {
    if (data.contains(cfdi)) {
      return data.contains(pagos20)
          ? await PDFPagos20Validacion(context, data)
          : data.contains(pagos10)
              ? await PDFPagos20Validacion(context, data)
              : data.contains(nomina12)
                  ? await PDFNominaValidacion(context, data)
                  : data.contains(cartaporte20)
                      ? await PDFcartaPorteValidacion(context, data)
                      : data.contains(cartaPorte)
                          ? await PDFcartaPorteValidacion(context, data)
                          : await PDFCFDI4Validacion(context, data);
    } else if (data.contains(retenciones)) {}
  }

  //MANDA XML A LA PAGINA DE ESTRUCTUTRADO DEPENDIENDO EL TIPO QUE SEA
  esturcturado() {
    return Container(
        margin: const EdgeInsets.only(left: 5),
        child: Pref.file.isNotEmpty ? CFDI(Pref.file) : 'No se pudo leer xxml');
  }

  //MANDA XML A LA PAGINA DE PDF DEPENDIENDO EL TIPO QUE SEA
  Future PDF(context, String data) async {
    if (data.contains(cfdi)) {
      return data.contains(pagos20)
          ? await PDFPagos20(context, data)
          : data.contains(pagos10)
              ? await PDFPagos20(context, data)
              : data.contains(nomina12)
                  ? await PDFNomina12(context, data)
                  : data.contains(cartaporte20)
                      ? await PDFCartaPorte(context, data)
                      : data.contains(cartaPorte)
                          ? await PDFCartaPorte(context, data)
                          : await PDF40(context, data);
    } else if (data.contains(retenciones)) {}
  }
}

CFDI(String doc) {
  String cfdi = '<cfdi:Comprobante';
  String retenciones = '<retenciones:Retenciones';
  String pagos20 = 'http://www.sat.gob.mx/Pagos20';
  String pagos10 = 'http://www.sat.gob.mx/Pagos';
  String nomina40 = 'http://www.sat.gob.mx/nomina12';
  String cartaporte20 = 'http://www.sat.gob.mx/CartaPorte20';
  String cartaPorte = 'http://www.sat.gob.mx/CartaPorte';

  if (doc.contains(cfdi)) {
    return doc.contains(pagos20)
        ? Pagos20_40(data: doc)
        : doc.contains(pagos10)
            ? Pagos20_40(data: doc)
            : doc.contains(nomina40)
                ? Nomina_40(data: doc)
                : doc.contains(cartaporte20)
                    ? Cartaporte_20(data: doc)
                    : doc.contains(cartaPorte)
                        ? Cartaporte_20(data: doc)
                        : Factura40(data: doc);
  } else if (doc.contains(retenciones)) {
    return esRetencion(doc);
  }
}

esRetencion(String doc) {
  String intereses = 'http://www.sat.gob.mx/esquemas/retencionpago/1/intereses';
  return doc.contains(intereses) ? rIntereses(data: doc) : '';
}

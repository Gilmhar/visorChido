// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:visor_xml/Moldes/DatosCFDI.dart';
import 'package:visor_xml/Moldes/PDF_Styles.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:visor_xml/utils/Date_Format.dart';
import 'package:visor_xml/utils/Save_PDF.dart';
import 'package:visor_xml/utils/datos_xml.dart';
import 'package:visor_xml/utils/post.dart';

PDFcartaPorteValidacion(context, String data) async {
  final fecha = dateYMD();
  final fechaV = dateDMY();

  var dato = Provider.of<DatosCfdi>(context, listen: false);
  final Concepto = dato.concepto;

  var mMF = '';

  if (dato.metodoPago == 'PUE') {
    dato.formaPago != '99' ? mMF = 'Correcta' : mMF = 'Incorrecta';
  } else if (dato.metodoPago == 'PPD') {
    dato.formaPago == '99' ? mMF = 'Correcta' : mMF = 'Incorrecta';
  }

  final Value = Pref.resSAT;

  var rfcE = Ob_D2(Value, 'id="ctl00_MainContent_LblRfcEmisor"', '</span>');
  var nombreE =
      Ob_D2(Value, 'id="ctl00_MainContent_LblNombreEmisor"', '</span>');
  var nombreR =
      Ob_D2(Value, 'id="ctl00_MainContent_LblNombreReceptor"', '</span>');
  var rfcR = Ob_D2(Value, 'id="ctl00_MainContent_LblRfcReceptor"', '</span>');
  var uuid = Ob_D2(Value, 'id="ctl00_MainContent_LblUuid"', '</span>');
  var fechaEmi =
      Ob_D2(Value, 'id="ctl00_MainContent_LblFechaEmision"', '</span>');
  var fechaCer =
      Ob_D2(Value, 'id="ctl00_MainContent_LblFechaCertificacion"', '</span>');
  var rfcPAC = Ob_D2(Value, 'id="ctl00_MainContent_LblRfcPac"', '</span>');
  var monto = Ob_D2(Value, 'id="ctl00_MainContent_LblMonto"', '</span>');
  var efectoCom =
      Ob_D2(Value, 'id="ctl00_MainContent_LblEfectoComprobante"', '</span>');
  var estado = Ob_D2(Value, 'id="ctl00_MainContent_LblEstado"', '</span>');
  var esCancel =
      Ob_D2(Value, 'id="ctl00_MainContent_LblEsCancelable"', '</span>');
  var estatusCancel =
      Ob_D2(Value, 'id="ctl00_MainContent_LblEstatusCancelacion"', '</span>');
  if (estatusCancel == '') {
    estatusCancel = '';
  }
  var fechaCancel =
      Ob_D2(Value, 'id="ctl00_MainContent_LblFechaCancelacion"', '</span>');
  if (fechaCancel == '') {
    fechaCancel = '';
  }
  var motivo = Ob_D2(Value, 'id="ctl00_MainContent_lblMotivo"', '</span>');
  if (motivo == '') {
    motivo = '';
  }
  var folioSust =
      Ob_D2(Value, 'id="ctl00_MainContent_lblFolioSustitucion"', '</span>');
  if (folioSust == '') {
    folioSust = '';
  }

  final vrfcE = await busquedaArt69(rfcE == '' ? dato.rfcEmisor : rfcE);
  final vrfcR = await busquedaArt69(rfcR == '' ? dato.rfcReceptor : rfcR);

  List<int> bytes = [];

  PdfDocument document = PdfDocument();
  final page = document.pages.add();
  PdfGrid gridG = PdfGrid();

  gridG.columns.add(count: 8);

  PdfGridRow pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = 'Fecha de Validación: $fecha';
  pv.cells[0].style = pdfValidacionStyle(sinB, 8);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.right);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 5;
  pv.cells[0].value =
      'Validación y verificación de CFDI con ID: ${uuid == '' ? dato.uuidT : uuid}';
  pv.cells[5].value = 'Versión: ${dato.version}';
  pv.cells[6].columnSpan = 2;
  pv.cells[6].value =
      'Tipo: ${efectoCom == '' ? dato.tipoDeComprobante : efectoCom}';

  for (var i = 0; i < pv.cells.count; i++) {
    pv.cells[i].style = pdfValidacionStyle(sinB, 8);
    pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
  }

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 2;
  pv.cells[0].value =
      'Fecha de Emisión: ${fechaEmi == '' ? dato.fecha : fechaEmi}';
  pv.cells[2].columnSpan = 2;
  pv.cells[2].value = 'Método de Pago: ${metodoPago(dato.metodoPago)}';
  pv.cells[4].columnSpan = 2;
  pv.cells[4].value = 'Folio: ${dato.folio}';
  pv.cells[6].columnSpan = 2;
  pv.cells[6].value =
      'Total: ${formatCantidades(dato.total == '' ? '0.0' : dato.total)}';

  for (var i = 0; i < pv.cells.count; i++) {
    pv.cells[i].style = pdfValidacionStyle(sinB, 9);
    pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 2;
  pv.cells[0].value = 'Emisor: ${nombreE == "" ? dato.nombreEmisor : nombreE}';
  pv.cells[2].columnSpan = 2;
  pv.cells[2].value = '';
  pv.cells[4].columnSpan = 2;
  pv.cells[4].value = 'RFC: ${rfcE == "" ? dato.rfcEmisor : rfcE} ';
  pv.cells[6].columnSpan = 2;
  pv.cells[6].value = '';

  for (var i = 0; i < pv.cells.count; i++) {
    pv.cells[i].style = pdfValidacionStyle(sinB, 9);
    pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 2;
  pv.cells[0].value =
      'Receptor: ${nombreR == "" ? dato.nombreReceptor : nombreR}';
  pv.cells[2].columnSpan = 2;
  pv.cells[2].value = '';
  pv.cells[4].columnSpan = 2;
  pv.cells[4].value = 'RFC: ${rfcR == "" ? dato.rfcReceptor : rfcR}';
  pv.cells[6].columnSpan = 2;
  pv.cells[6].value = '';

  for (var i = 0; i < pv.cells.count; i++) {
    pv.cells[i].style = pdfValidacionStyle(sinB, 9);
    pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = ' ';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      'Validación en Página del SAT de la operación....................................................................................................................................';
  pv.cells[0].style = pdfValidacionStyle(onlitop, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  if (estado == 'Vigente') {
    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 2;
    pv.cells[0].value = 'Estado: $estado';
    pv.cells[2].columnSpan = 3;
    pv.cells[2].value = 'Estatus de Cancelacion: $esCancel';
    pv.cells[5].columnSpan = 3;
    pv.cells[5].value = 'Efecto del Comprobante: $efectoCom';
    for (var i = 0; i < pv.cells.count; i++) {
      pv.cells[i].style = pdfValidacionStyle(sinB, 9);
      pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
    }

    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 3;
    pv.cells[0].value = 'Fecha de Expedición:  ${dato.fecha}  ';
    pv.cells[3].columnSpan = 3;
    pv.cells[3].value = 'Fecha Timbrado:  ${dato.fechaTimbradoT}  ';
    pv.cells[6].columnSpan = 2;
    pv.cells[6].value = 'PAC:  $rfcPAC';
    for (var i = 0; i < pv.cells.count; i++) {
      pv.cells[i].style = pdfValidacionStyle(sinB, 9);
      pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
    }

    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 2;
    pv.cells[0].value = 'Moneda: ${dato.moneda}';
    pv.cells[2].columnSpan = 2;
    pv.cells[2].value = 'Lugar de Expedición: ${dato.lugarExpedicion}';
    for (var i = 0; i < pv.cells.count; i++) {
      pv.cells[i].style = pdfValidacionStyle(sinB, 9);
      pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
    }

    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 3;
    pv.cells[0].value = 'Sub Total: \$ ${formatCantidades(dato.subTotal)}';
    pv.cells[3].columnSpan = 3;
    pv.cells[3].value =
        'Impuestos: \$ ${formatCantidades(dato.totalImpuestosTrasladados)}';
    pv.cells[6].columnSpan = 2;
    pv.cells[6].value = 'Total: ${formatCantidades(monto)}';
    for (var i = 0; i < pv.cells.count; i++) {
      pv.cells[i].style = pdfValidacionStyle(sinB, 9);
      pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
    }
  } else {
    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 4;
    pv.cells[0].value = 'Estado: COMPROBANTE NO LOCALIZADO';
    pv.cells[4].columnSpan = 4;
    pv.cells[4].value =
        'Mensaje Importante: Este comprobante no se encuentra registrado en los controles del Servicio de Administración Tributaria. Si el comprobante tiene menos de 72 horas de haber sido timbrado, le recomendamos esperar y verificarlo posteriormente';
    for (var i = 0; i < pv.cells.count; i++) {
      pv.cells[i].style = pdfValidacionStyle(sinB, 9);
      pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
    }
    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 3;
    pv.cells[0].value =
        'Sub Total: \$ ${formatCantidades(dato.subTotal == '' ? '0.0' : dato.subTotal)}';
    pv.cells[3].columnSpan = 3;
    pv.cells[3].value =
        'Impuestos: \$ ${formatCantidades(dato.totalImpuestosTrasladados == '' ? '0.0' : dato.totalImpuestosTrasladados)}';
    pv.cells[6].columnSpan = 2;
    pv.cells[6].value =
        'Total: ${formatCantidades(monto == '' ? '0.0' : monto)}';
    for (var i = 0; i < pv.cells.count; i++) {
      pv.cells[i].style = pdfValidacionStyle(sinB, 9);
      pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
    }
  }

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = ' ';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      'Verificación de integridad del XML.......................................................................................................................................................';
  pv.cells[0].style = pdfValidacionStyle(onlitop, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = 'Sello emisor N°: ${dato.noCertificadoSatT}';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = 'Estado: ';
  //TODO: CHECAR COMPROBANCION El documento está íntegro y coincide con el sello digital del emisor
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = ' ';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      'Verificación del Artículo 69B................................................................................................................................................................';
  pv.cells[0].style = pdfValidacionStyle(onlitop, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      'Con fecha $fechaV se verificó en la lista negra del SAT del artículo 69B arrojando el siguiente resultado:';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = vrfcE;
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = vrfcR;
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = ' ';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      'Revisión de errores de emisión............................................................................................................................................................';
  pv.cells[0].style = pdfValidacionStyle(onlitop, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 2;
  pv.cells[0].value = 'Metodo de pago: ${dato.metodoPago}';
  pv.cells[2].columnSpan = 3;
  pv.cells[2].value = 'Forma de pago: ${formadepago(dato.formaPago)}';
  pv.cells[5].columnSpan = 3;
  pv.cells[5].value = 'Manifestacion Metodo/Forma: $mMF';
  for (var i = 0; i < pv.cells.count; i++) {
    pv.cells[i].style = pdfValidacionStyle(sinB, 9);
    pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
  }

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      'Validación de pago: Verifique que el pago se realizo mediante ${formadepago(dato.formaPago)}';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      'Verificación Regimen Fiscal Receptor: Verifique que sea Régimen de ${regimenFiscal(dato.regimenFiscalReceptor)}';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      'Verificación de USO del CFDI: Corrobore que sea ${usoCFDI(dato.usoCfdiReceptor)}';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value =
      '*Si alguno de los anteriores fuera incorrecto, debera solicitar la sustitucion del CFDI que contenga los datos correctoscorrectos, de no hacerlo NO podra ser deducible y/o podria estar sujeto a multas.';
  pv.cells[0].style = pdfValidacionStyle(sinB, 5.5);
  pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

  pv = gridG.rows.add();
  pv.cells[0].columnSpan = 8;
  pv.cells[0].value = ' ';
  pv.cells[0].style = pdfValidacionStyle(sinB, 9);

  final c = dato.concepto;
  //TODO: METER A CONFIGURACIONES LA OPCCION DE DESGLOZAR CONCEPTOS AQUI
  final n = Pref.desglose == true ? c.length : 1;
  for (var i = 0; i < n; i++) {
    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 8;
    pv.cells[0].value = "${i + 1}. Concepto";
    pv.cells[0].style = pdfValidacionStyle(onlitop, 9);
    pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);
    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 8;
    pv.cells[0].value =
        ".............................................................................................................................................................................................................";
    pv.cells[0].style = pdfValidacionStyle(sinB, 9);
    pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 8;
    pv.cells[0].value =
        "Clave Prod. Srv: ${await buscarConceptos(c[i].claveProdServ)}";
    pv.cells[0].style = pdfValidacionStyle(sinB, 9);
    pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);
    pv = gridG.rows.add();
    pv.cells[0].columnSpan = 8;
    pv.cells[0].value = "Descripccion: ${c[i].descripcion}";
    pv.cells[0].style = pdfValidacionStyle(sinB, 9);
    pv.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

    if (c[i].cfdiImpuestos.cfdiTraslados.length > 0) {
      for (var it = 0; it < c[i].cfdiImpuestos.cfdiTraslados.length; it++) {
        pv = gridG.rows.add();
        pv.cells[0].value = 'Cantida: ${c[i].cantidad}';
        pv.cells[1].columnSpan = 2;
        pv.cells[1].value = 'Unidad: ${c[i].unidad}';
        pv.cells[3].columnSpan = 2;
        pv.cells[3].value =
            'Valor Unitario: \$${formatCantidades(c[i].valorUnitario)}';
        pv.cells[5].value = 'Importe: \$${formatCantidades(c[i].importe)}';
        pv.cells[6].columnSpan = 2;
        pv.cells[6].value =
            'Importe IVA: ${formatCantidades(c[i].cfdiImpuestos.cfdiTraslados[it].cfdiTraslado.importe)}';

        for (var i = 0; i < pv.cells.count; i++) {
          pv.cells[i].style = pdfValidacionStyle(sinB, 9);
          pv.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
        }
      }
    }
  }

  gridG.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));

  bytes = await document.save();
  document.dispose();

  return Pref.file.isEmpty ? null : PDFView(bytes, 'validacion');
}

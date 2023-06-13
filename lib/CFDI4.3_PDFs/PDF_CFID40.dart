// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable

import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:visor_xml/Moldes/DatosCFDI.dart';
import 'package:visor_xml/Moldes/PDF_Styles.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:visor_xml/utils/C_numeros_letras.dart';
import 'package:visor_xml/utils/Save_PDF.dart';

Future PDF40(context, String data) async {


  var dato = Provider.of<DatosCfdi>(context, listen: false);
  final Concepto = dato.concepto;
  await createQR(dato.uuidT, dato.rfcEmisor, dato.rfcReceptor);

  List<int> bytes = [];
  PdfDocument document = PdfDocument();

  final page = document.pages.add();
  PdfGrid grid = PdfGrid();
  PdfGrid grid2 = PdfGrid();
  PdfGrid grid3 = PdfGrid();
  PdfGrid grid4 = PdfGrid();

  grid.columns.add(count: 2);

  final PdfGridRow headerRow = grid.headers.add(1)[0];
  headerRow.cells[0].value = 'Datos del Emisor';
  headerRow.cells[1].value = 'Datos del Receptor';

  for (var i = 0; i < headerRow.cells.count; i++) {
    i == 0 ? dato.heidh1 = headerRow.cells[0].height.roundToDouble() : null;
    headerRow.cells[i].style = pdfCellStyle(
        5, 0, 0, 0, PdfColor(96, 96, 96), 14, sinB, PdfBrushes.white);
    headerRow.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  PdfGridRow row = grid.rows.add();
  row.cells[0].value = dato.rfcEmisor;
  row.cells[1].value = dato.rfcReceptor;
  row = grid.rows.add();
  row.cells[0].value = dato.nombreEmisor;
  row.cells[1].value = dato.nombreReceptor;
  row = grid.rows.add();
  row.cells[0].value = regimenFiscal(dato.regimenFiscalEmisor);
  row.cells[1].value = regimenFiscal(dato.regimenFiscalReceptor);
  row = grid.rows.add();
  row.cells[0].value = 'C.P. ${dato.lugarExpedicion}';
  row.cells[1].value = 'C.P. ${dato.domicilioFiscalReceptor}';
  row = grid.rows.add();
  row.cells[0].value = '';
  row.cells[1].value = usoCFDI(dato.usoCfdiReceptor);

  for (var grc = 0; grc < grid.rows.count; grc++) {
    dato.heidh1 =
        (dato.heidh1).ceilToDouble() + (grid.rows[grc].height).ceilToDouble();
    for (var hcc = 0; hcc < headerRow.cells.count; hcc++) {
      grid.rows[grc].cells[hcc].style = pdfDatosStyle(sinB);
      grid.rows[grc].cells[hcc].stringFormat =
          pdfStrAlin(PdfTextAlignment.left);
    }
  }

  grid2.columns.add(count: 1);
  PdfGridRow head2 = grid2.headers.add(1)[0];
  head2.cells[0].value = 'Datos del Comprobante';
  head2.cells[0].style = pdfCellStyle(
      0, 0, 0, 0, PdfColor(96, 96, 96), 14, sinB, PdfBrushes.white);
  head2.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);
  dato.heidh2 =
      (dato.heidh1).ceilToDouble() + (head2.cells[0].height).ceilToDouble();

  grid3.columns.add(count: 2);
  PdfGridRow head3 = grid3.headers.add(1)[0];
  head3.cells[0].value = 'Versión : ${dato.version}';
  head3.cells[1].value = 'Folio Fiscal: ${dato.uuidT}';
  dato.heidh3 = head3.cells[0].height + dato.heidh2;
  for (var i = 0; i < head3.cells.count; i++) {
    head3.cells[i].style = pdfDatosStyle(sinB);
    head3.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  PdfGridRow rowg3 = grid3.rows.add();
  rowg3.cells[0].value = 'Tipo: ${dato.tipoDeComprobante}';
  rowg3.cells[1].value = 'Serie-Folio: ${dato.serie}${dato.folio}';
  rowg3 = grid3.rows.add();
  rowg3.cells[0].value = 'F.Emisión: ${dato.fecha.toString().replaceAll('.000', '')}';
  rowg3.cells[1].value = 'F.Timbrado: ${dato.fechaTimbradoT.toString().replaceAll('.000', '')}';
  rowg3 = grid3.rows.add();
  rowg3.cells[0].value = 'M. de Pago: ${metodoPago(dato.metodoPago)}';
  rowg3.cells[1].value = 'Forma de Pago: ${formadepago(dato.formaPago)}';
  rowg3 = grid3.rows.add();
  rowg3.cells[0].value = 'Moneda: ${dato.moneda}';
  rowg3.cells[1].value = '';

  for (var grc = 0; grc < grid3.rows.count; grc++) {
    dato.heidh3 =
        (dato.heidh3).ceilToDouble() + (grid.rows[grc].height).ceilToDouble();
    for (var hcc = 0; hcc < head3.cells.count; hcc++) {
      grid3.rows[grc].cells[hcc].style = pdfDatosStyle(sinB);
      grid3.rows[grc].cells[hcc].stringFormat =
          pdfStrAlin(PdfTextAlignment.left);
    }
  }

  grid4.columns.add(count: 9);
  PdfGridRow head4 = grid4.headers.add(1)[0];
  head4.cells[0].value = 'P.';
  head4.cells[1].value = 'No. Identificacion';
  head4.cells[2].value = 'Clave Prod./Serv.';
  head4.cells[3].value = 'U. de Medida';
  head4.cells[4].value = 'Clave U. de Medida';
  head4.cells[5].value = 'Cantidad';
  head4.cells[6].value = 'P. Unitario';
  head4.cells[7].value = 'Decuento';
  head4.cells[8].value = 'Importe';

  dato.heidh4 = dato.heidh3 + head4.cells[0].height.ceilToDouble();

  for (var i = 0; i < head4.cells.count; i++) {
    head4.cells[i].style = pdfCellStyle(
        5, 0, 2, 2, PdfColor(160, 160, 160), 8, allgray, PdfBrushes.white);
    head4.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  PdfGridRow concepto = grid4.rows.add();

  double subt = 0.0;
  double ivat = 0.0;

  for (var cp = 0; cp < Concepto.length; cp++) {
    if (cp == 0) {
      concepto.cells[0].value = '${cp + 1}';
      concepto.cells[1].value = Concepto[cp].noIdentificacion;
      concepto.cells[2].value = Concepto[cp].claveProdServ;
      concepto.cells[3].value = Concepto[cp].unidad;
      concepto.cells[4].value = Concepto[cp].claveUnidad;
      concepto.cells[5].value = Concepto[cp].cantidad;
      concepto.cells[6].value = formatCantidades(
          Concepto[cp].valorUnitario == ''
              ? '0.0'
              : Concepto[cp].valorUnitario);
      concepto.cells[7].value = formatCantidades(
          Concepto[cp].descuento == '' ? '0.0' : Concepto[cp].descuento);
      concepto.cells[8].value = formatCantidades(
          Concepto[cp].importe == '' ? '0.0' : Concepto[cp].importe);
      for (var i = 0; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfDatosStyle(sinB);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }
      concepto = grid4.rows.add();
      concepto.cells[0].columnSpan = 9;
      concepto.cells[0].value = 'Descripccion: ${Concepto[cp].descripcion}';

      for (var i = 0; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfDatosStyle(onliBu);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
      }
    } else {
      concepto = grid4.rows.add();
      concepto.cells[0].value = '${cp + 1}';
      concepto.cells[1].value = Concepto[cp].noIdentificacion;
      concepto.cells[2].value = Concepto[cp].claveProdServ;
      concepto.cells[3].value = Concepto[cp].unidad;
      concepto.cells[4].value = Concepto[cp].claveUnidad;
      concepto.cells[5].value = Concepto[cp].cantidad;
      concepto.cells[6].value = formatCantidades(
          Concepto[cp].valorUnitario == ''
              ? '0.0'
              : Concepto[cp].valorUnitario);
      concepto.cells[7].value = formatCantidades(
          Concepto[cp].descuento == '' ? '0.0' : Concepto[cp].descuento);
      concepto.cells[8].value = formatCantidades(
          Concepto[cp].importe == '' ? '0.0' : Concepto[cp].importe);
      for (var i = 0; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfDatosStyle(onlitop);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }
      concepto = grid4.rows.add();
      concepto.cells[0].columnSpan = 9;
      concepto.cells[0].value = 'Descripccion: ${Concepto[cp].descripcion}';
      for (var i = 0; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfDatosStyle(onliBu);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
      }
    }

    //RETENCIONES
    if (Concepto[cp].cfdiImpuestos.cfdiRetenciones.length != 0) {
      for (var re = 0;
          re < Concepto[cp].cfdiImpuestos.cfdiRetenciones.length;
          re++) {
        concepto = grid4.rows.add();
        concepto.cells[0].columnSpan = 4;
        concepto.cells[0].value = 'Impuestos Trasladados';
        concepto.cells[0].rowSpan = 2;
        concepto.cells[4].value = 'Impuesto';
        concepto.cells[5].value = 'Base';
        concepto.cells[6].value = 'Tipo Factor';
        concepto.cells[7].value = 'Tasa O Cuota';
        concepto.cells[8].value = 'Importe';

        for (var i = 0; i < concepto.cells.count; i++) {
          concepto.cells[i].style = pdfDatosStyle(sinB);
          concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }

        final r = Concepto[cp].cfdiImpuestos.cfdiRetenciones[re].cfdiRetencion;

        concepto = grid4.rows.add();
        concepto.cells[4].value = r.impuesto;
        concepto.cells[5].value =
            formatCantidades(r.base == '' ? '0.0' : r.base);
        concepto.cells[6].value = r.tipoFactor;
        concepto.cells[7].value = r.tasaOCuota;
        concepto.cells[8].value =
            formatCantidades(r.importe == '' ? '0.0' : r.importe);

        ivat = double.parse(r.importe == '' ? '0.0' : r.importe) + ivat;

        for (var i = 0; i < concepto.cells.count; i++) {
          concepto.cells[i].style = pdfCellStyle(5, 0, 2, 2,
              PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black);
          concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }
      }
    }

    //TRASLADOS
    if (Concepto[cp].cfdiImpuestos.cfdiTraslados.length != 0) {
      for (var tr = 0;
          tr < Concepto[cp].cfdiImpuestos.cfdiTraslados.length;
          tr++) {
        concepto = grid4.rows.add();
        concepto.cells[0].columnSpan = 4;
        concepto.cells[0].value = 'Impuestos Trasladados';
        concepto.cells[0].rowSpan = 2;
        concepto.cells[4].value = 'Impuesto';
        concepto.cells[5].value = 'Base';
        concepto.cells[6].value = 'Tipo Factor';
        concepto.cells[7].value = 'Tasa O Cuota';
        concepto.cells[8].value = 'Importe';

        for (var i = 0; i < concepto.cells.count; i++) {
          concepto.cells[i].style = pdfDatosStyle(sinB);
          concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }

        final t = Concepto[cp].cfdiImpuestos.cfdiTraslados[tr].cfdiTraslado;

        concepto = grid4.rows.add();
        concepto.cells[4].value = t.impuesto;
        concepto.cells[4].style = pdfCellStyle(
            5, 0, 2, 2, PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black);
        concepto.cells[5].value =
            formatCantidades(t.base == '' ? '0.0' : t.base);
        concepto.cells[6].value = t.tipoFactor;
        concepto.cells[7].value = t.tasaOCuota;
        concepto.cells[8].value =
            formatCantidades(t.importe == '' ? '0.0' : t.importe);
        ivat = double.parse(t.importe == '' ? '0.0' : t.importe) + ivat;
        for (var i = 3; i < concepto.cells.count; i++) {
          concepto.cells[i].style = pdfCellStyle(5, 0, 2, 2,
              PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black);
          concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }
      }
    }

    subt = double.parse(
            Concepto[cp].importe == '' ? '0.0' : Concepto[cp].importe) +
        subt;
  }

  final total = subt + ivat;

  //QR Y DATOS ADICIONALES DE CFDI
  final Uint8List imageData =
      File('${Pref.Directorio}/QR.png').readAsBytesSync();
  final PdfBitmap image = PdfBitmap(imageData);

  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 9;
  concepto.cells[0].value = '';
  concepto.cells[0].style =
      PdfGridCellStyle(cellPadding: PdfPaddings(top: 30, bottom: 30));
  concepto.cells[0].style = pdfDatosStyle(sinB);

  final dl = converNumToLetras(total, dato.moneda);

  for (var i = 0; i < 8; i++) {
    concepto = grid4.rows.add();

    concepto.cells[0].columnSpan = 2;

    i == 0 ? concepto.cells[0].value = image : null;
    i == 0 ? concepto.cells[0].rowSpan = 8 : null;

    concepto.cells[2].columnSpan = 2;
    concepto.cells[2].value = i == 0
        ? ' '
        : i == 2
            ? 'Importe con letra:'
            : i == 3
                ? 'No. CSD:'
                : i == 4
                    ? 'NO. CSD SAT:'
                    : i == 5
                        ? 'RFC PAC:'
                        : ' ';

    concepto.cells[4].columnSpan = 3;
    concepto.cells[4].value = i == 0
        ? ' '
        : i == 2
            ? dl
            : i == 3
                ? ' ${dato.noCertificado}'
                : i == 4
                    ? ' ${dato.noCertificadoSatT}'
                    : i == 5
                        ? ' ${dato.rfcProvCertifT}'
                        : ' ';

    concepto.cells[7].value = i == 0
        ? ' '
        : i == 2
            ? 'Sub Total:'
            : i == 3
                ? 'IVA:'
                : i == 4
                    ? 'Total:'
                    : ' ';

    concepto.cells[8].value = i == 0
        ? ' '
        : i == 2
            ? ' \$${formatCantidades(subt.toString())}'
            : i == 3
                ? ' \$${formatCantidades(ivat.toString())}'
                : i == 4
                    ? ' \$${formatCantidades(total.toString())}'
                    : ' ';

    if (i == 2) {
      for (var i = 0; i < concepto.cells.count; i++) {
        (i == 4)
            ? concepto.cells[4].style = pdfCellStyle(5, 0, 2, 2,
                PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black)
            : concepto.cells[i].style = pdfDatosStyle(sinB);

        (i == 4)
            ? concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left)
            : i == 8
                ? concepto.cells[i].stringFormat =
                    pdfStrAlin(PdfTextAlignment.left)
                : concepto.cells[i].stringFormat =
                    pdfStrAlin(PdfTextAlignment.right);
      }
    } else {
      for (var i = 0; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfDatosStyle(sinB);

        (i == 4)
            ? concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left)
            : i == 8
                ? concepto.cells[i].stringFormat =
                    pdfStrAlin(PdfTextAlignment.left)
                : concepto.cells[i].stringFormat =
                    pdfStrAlin(PdfTextAlignment.right);
      }
    }
  }

  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 9;
  concepto.cells[0].value = ' ';
  concepto.cells[0].style = pdfDatosStyle(sinB);
  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 9;
  concepto.cells[0].value = 'Sello Digital';
  concepto.cells[0].style = pdfDatosStyle(sinB);
  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 9;
  concepto.cells[0].value =
      dato.selloCfdT.substring(0, dato.selloCfdT.length - 120);
  concepto.cells[0].style = pdfDatosStyle(sinB);
  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 9;
  concepto.cells[0].value = 'Sello Digital del SAT';
  concepto.cells[0].style = pdfDatosStyle(sinB);
  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 9;
  concepto.cells[0].value =
      dato.selloSatT.substring(0, dato.selloSatT.length - 120);
  concepto.cells[0].style = pdfDatosStyle(sinB);
  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 9;
  concepto.cells[0].value = 'Cadena Original';
  concepto.cells[0].style = pdfDatosStyle(sinB);
  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 9;
  concepto.cells[0].value = dato.selloCfdT;
  concepto.cells[0].style = pdfDatosStyle(sinB);

  final PdfPageTemplateElement headerTemplate =
      PdfPageTemplateElement(const Rect.fromLTWH(0, 50, 550, 25));
  headerTemplate.graphics.drawString(
      'Folio Administrativo: ${dato.tipoDeComprobante}${dato.folio}                                                            UUID: ${dato.uuidT}                                                            Receptor: ${dato.nombreReceptor}',
      PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: const Rect.fromLTWH(0, 0, 550, 25),
      format: PdfStringFormat(alignment: PdfTextAlignment.justify));
  document.template.evenTop = headerTemplate;

  grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));
  grid2.draw(page: page, bounds: Rect.fromLTWH(0, dato.heidh1, 0, 0));
  grid3.draw(page: page, bounds: Rect.fromLTWH(0, dato.heidh2, 0, 0));
  grid4.draw(page: page, bounds: Rect.fromLTWH(0, dato.heidh3, 0, 0));

  bytes = await document.save();
  document.dispose();
  return Pref.file.isEmpty ? null : PDFView(bytes, 'Comprobante');
}

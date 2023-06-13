// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable, avoid_print

import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:visor_xml/Moldes/DatosCFDI.dart';
import 'package:visor_xml/Moldes/PDF_Styles.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:visor_xml/utils/Save_PDF.dart';

Future PDFPagos20(context, String data) async {
  var dato = Provider.of<DatosCfdi>(context, listen: false);
  await createQR(dato.uuidT, dato.rfcEmisor, dato.rfcReceptor);

  final Concepto = dato.concepto;

  List<int> bytes = [];
  PdfDocument document = PdfDocument();

  final page = document.pages.add();
  PdfGrid ncell = PdfGrid();

  ncell.columns.add(count: 10);
  final PdfGridRow hR = ncell.headers.add(1)[0];
  hR.cells[0].columnSpan = 5;
  hR.cells[0].value = 'Datos del Emisor';
  hR.cells[5].columnSpan = 5;
  hR.cells[5].value = 'Datos del Receptor';

  for (var i = 0; i < hR.cells.count; i++) {
    i == 0 ? dato.heidh1 = hR.cells[0].height.roundToDouble() : null;
    hR.cells[i].style = pdfCellStyle(
        5, 0, 0, 0, PdfColor(96, 96, 96), 14, sinB, PdfBrushes.white);
    hR.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  PdfGridRow row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = dato.rfcEmisor;
  row.cells[5].columnSpan = 5;
  row.cells[5].value = dato.rfcReceptor;

  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = dato.nombreEmisor;
  row.cells[5].columnSpan = 5;
  row.cells[5].value = dato.nombreReceptor;

  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = regimenFiscal(dato.regimenFiscalEmisor);
  
  row.cells[5].columnSpan = 5;
  row.cells[5].value = regimenFiscal(dato.regimenFiscalReceptor);

  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = 'C.P. ${dato.lugarExpedicion}';
  row.cells[5].columnSpan = 5;
  row.cells[5].value = 'C.P. ${dato.domicilioFiscalReceptor}';

  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = '';
  row.cells[5].columnSpan = 5;
  row.cells[5].value = usoCFDI(dato.usoCfdiReceptor);

  for (var grc = 0; grc < ncell.rows.count; grc++) {
    dato.heidh1 =
        (dato.heidh1).ceilToDouble() + (ncell.rows[grc].height).ceilToDouble();

    for (var hcc = 0; hcc < hR.cells.count; hcc++) {
      ncell.rows[grc].cells[hcc].style = pdfDatosStyle(sinB);
      ncell.rows[grc].cells[hcc].stringFormat =
          pdfStrAlin(PdfTextAlignment.left);
    }
  }

  row = ncell.rows.add();
  row.cells[0].columnSpan = 10;
  row.cells[0].value = 'Datos del Comprobante';
  row.cells[0].style = pdfCellStyle(
      0, 0, 0, 0, PdfColor(96, 96, 96), 14, sinB, PdfBrushes.white);
  row.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = 'Versión: ${dato.version}';
  row.cells[5].columnSpan = 5;
  row.cells[5].value = 'Folio Fiscal: ${dato.uuidT}';
  for (var i = 0; i < row.cells.count; i++) {
    row.cells[i].style = pdfDatosStyle(sinB);
    row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }
  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = 'Tipo: ${dato.tipoDeComprobante}';
  row.cells[5].columnSpan = 5;
  row.cells[5].value = 'Serie-Folio: ${dato.serie}${dato.folio}';
  for (var i = 0; i < row.cells.count; i++) {
    row.cells[i].style = pdfDatosStyle(sinB);
    row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }
  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = 'F.Emisión: ${dato.fecha.toString().replaceAll('.000', '')}';
  row.cells[5].columnSpan = 5;
  row.cells[5].value = 'F.Timbrado: ${dato.fechaTimbradoT.toString().replaceAll('.000', '')}';
  for (var i = 0; i < row.cells.count; i++) {
    row.cells[i].style = pdfDatosStyle(sinB);
    row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }
  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = 'M. de Pago: ${metodoPago(dato.metodoPago)}';
  row.cells[5].columnSpan = 5;
  row.cells[5].value = 'Forma de Pago: ${formadepago(dato.formaPago)}';
  for (var i = 0; i < row.cells.count; i++) {
    row.cells[i].style = pdfDatosStyle(sinB);
    row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }
  row = ncell.rows.add();
  row.cells[0].columnSpan = 5;
  row.cells[0].value = 'Moneda: ${dato.moneda}';
  row.cells[5].columnSpan = 5;
  row.cells[5].value = '';
  for (var i = 0; i < row.cells.count; i++) {
    row.cells[i].style = pdfDatosStyle(sinB);
    row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  row = ncell.rows.add();
  row.cells[0].value = 'P.';
  row.cells[1].columnSpan = 2;
  row.cells[1].value = 'No. Identificacion';
  row.cells[3].value = 'Clave Prod./Serv.';
  row.cells[4].value = 'U. de Medida';
  row.cells[5].value = 'Clave U. de Medida';
  row.cells[6].value = 'Cantidad';
  row.cells[7].value = 'P. Unitario';
  row.cells[8].value = 'Decuento';
  row.cells[9].value = 'Importe';
  for (var i = 0; i < row.cells.count; i++) {
    row.cells[i].style = pdfCellStyle(
        5, 0, 2, 2, PdfColor(160, 160, 160), 8, allgray, PdfBrushes.white);
    row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  for (var cp = 0; cp < Concepto.length; cp++) {
    row = ncell.rows.add();
    if (cp == 0) {
      row.cells[0].value = '${cp + 1}';
      row.cells[1].columnSpan = 2;
      row.cells[1].value = Concepto[cp].noIdentificacion;
      row.cells[3].value = Concepto[cp].claveProdServ;
      row.cells[4].value = Concepto[cp].unidad;
      row.cells[5].value = Concepto[cp].claveUnidad;
      row.cells[6].value = Concepto[cp].cantidad;
      row.cells[7].value = formatCantidades(Concepto[cp].valorUnitario == ''
          ? '0.0'
          : Concepto[cp].valorUnitario);
      row.cells[8].value = formatCantidades(
          Concepto[cp].descuento == '' ? '0.0' : Concepto[cp].descuento);
      row.cells[9].value = formatCantidades(
          Concepto[cp].importe == '' ? '0.0' : Concepto[cp].importe);
      for (var i = 0; i < row.cells.count; i++) {
        row.cells[i].style = pdfDatosStyle(onliBu);
        row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }

      row = ncell.rows.add();
      row.cells[0].columnSpan = 10;
      row.cells[0].value = 'Descripccion: ${Concepto[cp].descripcion}';

      for (var i = 0; i < row.cells.count; i++) {
        row.cells[i].style = pdfDatosStyle(onliBu);
        row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
      }
    } else {
      row = ncell.rows.add();
      row.cells[0].value = '${cp + 1}';
      row.cells[1].columnSpan = 2;
      row.cells[1].value = Concepto[cp].noIdentificacion;
      row.cells[3].value = Concepto[cp].claveProdServ;
      row.cells[4].value = Concepto[cp].unidad;
      row.cells[5].value = Concepto[cp].claveUnidad;
      row.cells[6].value = Concepto[cp].cantidad;
      row.cells[7].value = formatCantidades(Concepto[cp].valorUnitario == ''
          ? '0.0'
          : Concepto[cp].valorUnitario);
      row.cells[8].value = formatCantidades(
          Concepto[cp].descuento == '' ? '0.0' : Concepto[cp].descuento);
      row.cells[9].value = formatCantidades(
          Concepto[cp].importe == '' ? '0.0' : Concepto[cp].importe);

      for (var i = 0; i < row.cells.count; i++) {
        row.cells[i].style = pdfDatosStyle(onlitop);
        row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }
      row = ncell.rows.add();
      row.cells[0].columnSpan = 10;
      row.cells[0].value = 'Descripccion: ${Concepto[cp].descripcion}';
      for (var i = 0; i < row.cells.count; i++) {
        row.cells[i].style = pdfDatosStyle(onliBu);
        row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
      }
    }

    //RETENCIONES
    if (Concepto[cp].cfdiImpuestos.cfdiRetenciones.length != 0) {
      for (var re = 0;
          re < Concepto[cp].cfdiImpuestos.cfdiRetenciones.length;
          re++) {
        row = ncell.rows.add();
        row.cells[0].columnSpan = 4;
        row.cells[0].value = 'Impuestos Trasladados';
        row.cells[0].rowSpan = 2;
        row.cells[4].value = 'Impuesto';
        row.cells[5].value = 'Base';
        row.cells[6].value = 'Tipo Factor';
        row.cells[7].value = 'Tasa O Cuota';
        row.cells[8].columnSpan = 2;
        row.cells[8].value = 'Importe';

        for (var i = 0; i < row.cells.count; i++) {
          row.cells[i].style = pdfDatosStyle(sinB);
          row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }

        final r = Concepto[cp].cfdiImpuestos.cfdiRetenciones[re].cfdiRetencion;

        row = ncell.rows.add();
        row.cells[4].value = r.impuesto;
        row.cells[5].value = formatCantidades(r.base == '' ? '0.0' : r.base);
        row.cells[6].value = r.tipoFactor;
        row.cells[7].value = r.tasaOCuota;
        row.cells[8].columnSpan = 2;
        row.cells[8].value =
            formatCantidades(r.importe == '' ? '0.0' : r.importe);

        for (var i = 0; i < row.cells.count; i++) {
          row.cells[i].style = pdfCellStyle(5, 0, 2, 2, PdfColor(224, 224, 224),
              8, allgray, PdfBrushes.black);
          row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }
      }
    }

    //TRASLADOS
    if (Concepto[cp].cfdiImpuestos.cfdiTraslados.length != 0) {
      for (var tr = 0;
          tr < Concepto[cp].cfdiImpuestos.cfdiTraslados.length;
          tr++) {
        row = ncell.rows.add();
        row.cells[0].columnSpan = 4;
        row.cells[0].value = 'Impuestos Trasladados';
        row.cells[0].rowSpan = 2;
        row.cells[4].value = 'Impuesto';
        row.cells[5].value = 'Base';
        row.cells[6].value = 'Tipo Factor';
        row.cells[7].value = 'Tasa O Cuota';
        row.cells[8].value = 'Importe';

        for (var i = 0; i < row.cells.count; i++) {
          row.cells[i].style = pdfDatosStyle(sinB);
          row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }

        final t = Concepto[cp].cfdiImpuestos.cfdiTraslados[tr].cfdiTraslado;

        row = ncell.rows.add();
        row.cells[4].value = t.impuesto;
        row.cells[4].style = pdfCellStyle(
            5, 0, 2, 2, PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black);
        row.cells[5].value = formatCantidades(t.base == '' ? '0.0' : t.base);
        row.cells[6].value = t.tipoFactor;
        row.cells[7].value = t.tasaOCuota;
        row.cells[8].value =
            formatCantidades(t.importe == '' ? '0.0' : t.importe);

        for (var i = 3; i < row.cells.count; i++) {
          row.cells[i].style = pdfCellStyle(5, 0, 2, 2, PdfColor(224, 224, 224),
              8, allgray, PdfBrushes.black);
          row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }
      }
    }

    row = ncell.rows.add();
    row.cells[0].columnSpan = 10;
    row.cells[0].style = pdfDatosStyle(sinB);

    row = ncell.rows.add();
    row.cells[0].columnSpan = 10;
    row.cells[0].value = 'Complemento de Pago';
    row.cells[0].style = pdfCellStyle(
        0, 0, 0, 0, PdfColor(96, 96, 96), 14, sinB, PdfBrushes.white);
    row.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

    row = ncell.rows.add();
    row.cells[0].columnSpan = 10;
    row.cells[0].value = dato.pagosTotalTrasladosBaseIVA16 +
                dato.pagosTotaltrasladosImpuestoIVA +
                dato.pagosMontoTotal ==
            ''
        ? 'Complemento'
        : 'Total de impuestos';
    row.cells[0].style = pdfCellStyle(
        5, 0, 2, 2, PdfColor(160, 160, 160), 13, allgray, PdfBrushes.white);
    row.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

    row = ncell.rows.add();
    row.cells[0].columnSpan = 3;
    row.cells[0].value = dato.pagosMontoTotal == ''
        ? ''
        : 'Monto Total: ${formatCantidades(dato.pagosMontoTotal)}';
    row.cells[3].columnSpan = 4;
    row.cells[3].value = dato.pagosTotalTrasladosBaseIVA16 == ''
        ? ''
        : 'Base IVA 16%: ${formatCantidades(dato.pagosTotalTrasladosBaseIVA16)}';
    row.cells[7].columnSpan = 3;
    row.cells[7].value = dato.pagosTotaltrasladosImpuestoIVA == ''
        ? ''
        : 'IVA 16%: ${formatCantidades(dato.pagosTotaltrasladosImpuestoIVA)}';

    for (var i = 0; i < row.cells.count; i++) {
      row.cells[i].style = pdfDatosStyle(sinB);
      row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
    }

    for (var i = 0; i < dato.complementoPagos.length; i++) {
      row = ncell.rows.add();
      row.cells[0].columnSpan = 3;
      row.cells[0].value = 'Detalle del Pago';
      row.cells[0].style = pdfCellStyle(
          5, 0, 2, 2, PdfColor(160, 160, 160), 13, allgray, PdfBrushes.white);
      row.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

      for (var i = 2; i < row.cells.count; i++) {
        row.cells[i].style = pdfDatosStyle(sinB);
      }

      row = ncell.rows.add();
      row.cells[0].columnSpan = 2;
      row.cells[0].value = 'Versió';
      row.cells[2].columnSpan = 2;
      row.cells[2].value = 'Fecha de Pago';
      row.cells[4].columnSpan = 2;
      row.cells[4].value = 'Moneda';
      row.cells[6].columnSpan = 3;
      row.cells[6].value = 'Forma de pago';
      row.cells[9].value = 'Monto';

      for (var i = 0; i < row.cells.count; i++) {
        row.cells[i].style = pdfDatosStyle(sinB);
        row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }

      row = ncell.rows.add();
      row.cells[0].columnSpan = 2;
      row.cells[0].value = dato.pagosVersion;
      row.cells[2].columnSpan = 2;
      row.cells[2].value = dato.complementoPagos[i].fechaPago;
      row.cells[4].columnSpan = 2;
      row.cells[4].value = dato.complementoPagos[i].monedaP;
      row.cells[6].columnSpan = 3;
      row.cells[6].value = dato.complementoPagos[i].formaDePagoP;
      row.cells[9].value = formatCantidades(dato.complementoPagos[i].monto == ''
          ? '0.0'
          : dato.complementoPagos[i].monto);

      for (var i = 0; i < row.cells.count; i++) {
        row.cells[i].style = pdfDatosStyle(onliBu);
        row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }

      row = ncell.rows.add();
      row.cells[0].columnSpan = 2;
      row.cells[0].value = dato.complementoPagos[i].noOperacionP == ''
          ? 'Tipo de Cambio: ${formatCantidades(dato.complementoPagos[i].tipoCambioP)}'
          : dato.complementoPagos[i].tipoCambioP == ''
              ? ''
              : '# Operación: ${dato.complementoPagos[i].noOperacionP}';
      row.cells[2].columnSpan = 2;
      row.cells[2].value = dato.complementoPagos[i].noOperacionP == ''
          ? ''
          : dato.complementoPagos[i].tipoCambioP == ''
              ? ''
              : 'Tipo de Cambio: ${formatCantidades(dato.complementoPagos[i].tipoCambioP)}';

      for (var i = 0; i < row.cells.count; i++) {
        row.cells[i].style = pdfDatosStyle(onlitop);
        row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }

      for (var dc = 0;
          dc < dato.complementoPagos[i].pago20DoctoRelacionado.length;
          dc++) {
        row = ncell.rows.add();
        row.cells[0].columnSpan = 4;
        row.cells[0].value = 'Comprobante Relacionado';
        row.cells[0].style = pdfCellStyle(
            5, 0, 2, 2, PdfColor(160, 160, 160), 11, allgray, PdfBrushes.white);
        row.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        for (var i = 4; i < row.cells.count; i++) {
          row.cells[i].style = pdfDatosStyle(sinB);
        }

        row = ncell.rows.add();
        row.cells[0].value = "Serie y Folio";
        row.cells[1].columnSpan = 2;
        row.cells[1].value = "UUID Relacionado";
        row.cells[3].value = "Moneda";
        row.cells[4].value = "T.Cambio";
        row.cells[5].value = "Parcialidad";
        row.cells[6].value = "Obj. Impuesto";
        row.cells[7].value = "Saldo Anterior";
        row.cells[8].value = "Importe Pagado";
        row.cells[9].value = "Saldo Insoluto";

        for (var i = 0; i < row.cells.count; i++) {
          row.cells[i].style = PdfGridCellStyle(
              borders: sinB,
              font: PdfStandardFont(PdfFontFamily.helvetica, 6.5),
              textBrush: PdfSolidBrush(PdfColor(32, 32, 32)));
          row.cells[i].stringFormat =
              PdfStringFormat(alignment: PdfTextAlignment.center);
        }

        row = ncell.rows.add();
        row.cells[0].value =
            '${dato.complementoPagos[i].pago20DoctoRelacionado[dc].serie}${dato.complementoPagos[i].pago20DoctoRelacionado[dc].folio}';
        row.cells[1].columnSpan = 2;
        row.cells[1].value = dato
            .complementoPagos[i].pago20DoctoRelacionado[dc].idDocumento
            .toString()
            .toUpperCase();
        row.cells[3].value =
            dato.complementoPagos[i].pago20DoctoRelacionado[dc].monedaDr;
        row.cells[4].value =
            dato.complementoPagos[i].pago20DoctoRelacionado[dc].tipoCambioDr;
        row.cells[5].value =
            dato.complementoPagos[i].pago20DoctoRelacionado[dc].numParcialidad;
        row.cells[6].value =
            dato.complementoPagos[i].pago20DoctoRelacionado[dc].objetoImpDr;
        row.cells[7].value = formatCantidades(
            dato.complementoPagos[i].pago20DoctoRelacionado[dc].impSaldoAnt);
        row.cells[8].value = formatCantidades(
            dato.complementoPagos[i].pago20DoctoRelacionado[dc].impPagado);
        row.cells[9].value = formatCantidades(dato
            .complementoPagos[i].pago20DoctoRelacionado[dc].impSaldoInsoluto);

        for (var i = 0; i < row.cells.count; i++) {
          row.cells[i].style = PdfGridCellStyle(
              borders: sinB,
              font: PdfStandardFont(PdfFontFamily.helvetica, 6.5),
              textBrush: PdfSolidBrush(PdfColor(32, 32, 32)));
          row.cells[i].stringFormat =
              PdfStringFormat(alignment: PdfTextAlignment.center);
        }

        if (dato.complementoPagos[i].pago20DoctoRelacionado[dc]
                .pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.baseDr !=
            '') {
          row = ncell.rows.add();
          row.cells[0].columnSpan = 5;
          row.cells[0].value = 'Impuestos del Documento Relacionado';
          row.cells[0].style = pdfCellStyle(5, 0, 2, 2, PdfColor(160, 160, 160),
              11, allgray, PdfBrushes.white);
          row.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);
          for (var i = 4; i < row.cells.count; i++) {
            row.cells[i].style = pdfDatosStyle(sinB);
          }

          row = ncell.rows.add();
          row.cells[0].columnSpan = 4;
          row.cells[0].value = 'Traslados';

          row.cells[4].value =
              'Base: ${dato.complementoPagos[i].pago20DoctoRelacionado[dc].pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.baseDr}';
          row.cells[5].value =
              'Impuesto: ${dato.complementoPagos[i].pago20DoctoRelacionado[dc].pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.impuestoDr}';
          row.cells[6].value =
              'Tipo Factor: ${dato.complementoPagos[i].pago20DoctoRelacionado[dc].pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.tipoFactorDr}';
          row.cells[7].value =
              'Tasa o Cuota: ${dato.complementoPagos[i].pago20DoctoRelacionado[dc].pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.tasaOCuotaDr}';
          row.cells[8].columnSpan = 2;
          row.cells[8].value =
              'Importe: ${dato.complementoPagos[i].pago20DoctoRelacionado[dc].pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.importeDr}';

          for (var i = 0; i < row.cells.count; i++) {
            row.cells[i].style = PdfGridCellStyle(
                borders: sinB,
                font: PdfStandardFont(PdfFontFamily.helvetica, 6.5),
                textBrush: PdfSolidBrush(PdfColor(32, 32, 32)));
            row.cells[i].stringFormat =
                PdfStringFormat(alignment: PdfTextAlignment.center);
          }

          row = ncell.rows.add();
          row.cells[0].columnSpan = 5;
          row.cells[0].value = 'Impuestos Pagados';
          row.cells[0].style = pdfCellStyle(5, 0, 2, 2, PdfColor(160, 160, 160),
              11, allgray, PdfBrushes.white);
          row.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);
          for (var i = 4; i < row.cells.count; i++) {
            row.cells[i].style = pdfDatosStyle(sinB);
          }

          row = ncell.rows.add();
          row.cells[0].columnSpan = 4;
          row.cells[0].value = 'Traslados';

          row.cells[4].value =
              'Base: ${formatCantidades(dato.pagosTotalTrasladosBaseIVA16)}';
          row.cells[5].value =
              'Impuesto: ${dato.complementoPagos[i].pago20DoctoRelacionado[dc].pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.impuestoDr}';
          row.cells[6].value =
              'Tipo Factor: ${dato.complementoPagos[i].pago20DoctoRelacionado[dc].pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.tipoFactorDr}';
          row.cells[7].value =
              'Tasa o Cuota: ${dato.complementoPagos[i].pago20DoctoRelacionado[dc].pago20ImpuestosDr.pago20TrasladosDr.pago20TrasladoDr.tasaOCuotaDr}';
          row.cells[8].columnSpan = 2;
          row.cells[8].value =
              'Importe: ${formatCantidades(dato.pagosTotaltrasladosImpuestoIVA)}';

          for (var i = 0; i < row.cells.count; i++) {
            row.cells[i].style = PdfGridCellStyle(
                borders: sinB,
                font: PdfStandardFont(PdfFontFamily.helvetica, 6.5),
                textBrush: PdfSolidBrush(PdfColor(32, 32, 32)));
            row.cells[i].stringFormat =
                PdfStringFormat(alignment: PdfTextAlignment.center);
          }
        }
        row = ncell.rows.add();
      }
    }
  }

  for (var i = 0; i < 2; i++) {
    row = ncell.rows.add();
    row.cells[0].columnSpan = 10;
    row.cells[0].value = " ";
    row.cells[0].style = pdfDatosStyle(sinB);
  }

  final Uint8List imageData =
      File('${Pref.Directorio}/QR.png').readAsBytesSync();
  final PdfBitmap image = PdfBitmap(imageData);

  for (var i = 0; i < 8; i++) {
    row = ncell.rows.add();
    row.cells[0].columnSpan = 2;

    i == 0 ? row.cells[0].value = image : null;
    i == 0 ? row.cells[0].rowSpan = 8 : null;

    row.cells[3].columnSpan = 7;
    row.cells[3].value = i == 0
        ? ''
        : i == 1
            ? 'Sello Digital'
            : i == 2
                ? dato.selloCfdT.substring(0, 80)
                : i == 3
                    ? 'Sello Digital del SAT'
                    : i == 4
                        ? dato.selloSatT.substring(0, 80)
                        : i == 5
                            ? 'Cadena Original'
                            : i == 6
                                ? dato.selloCfdT
                                : '';

    for (var i = 0; i < row.cells.count; i++) {
      row.cells[i].style = PdfGridCellStyle(
          borders: sinB,
          font: PdfStandardFont(PdfFontFamily.helvetica, 6),
          textBrush: PdfSolidBrush(PdfColor(32, 32, 32)));
      row.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
    }
  }

  final PdfPageTemplateElement headerTemplate =
      PdfPageTemplateElement(const Rect.fromLTWH(0, 50, 550, 25));
  headerTemplate.graphics.drawString(
      'Folio Administrativo: ${dato.tipoDeComprobante}${dato.folio}                                                            UUID: ${dato.uuidT}                                                            Receptor: ${dato.nombreReceptor}',
      PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: const Rect.fromLTWH(0, 0, 550, 25),
      format: PdfStringFormat(alignment: PdfTextAlignment.left));
  document.template.top = headerTemplate;

  ncell.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));

  bytes = await document.save();
  document.dispose();

  return Pref.file.isEmpty ? null : PDFView(bytes, 'Comprobante');
}

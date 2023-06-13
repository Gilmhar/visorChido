// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'dart:io';
import 'dart:ui';
// import 'package:number_to_character/number_to_character.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:visor_xml/Moldes/DatosCFDI.dart';
import 'package:visor_xml/Moldes/PDF_Styles.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:visor_xml/utils/C_numeros_letras.dart';
import 'package:visor_xml/utils/Save_PDF.dart';

Future PDFNomina12(context, String data) async {
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

  for (var i = 0; i < headerRow.cells.count; i++) {
    i == 0 ? dato.heidh1 = headerRow.cells[0].height.roundToDouble() : null;
    headerRow.cells[i].style = pdfCellStyle(
        5, 0, 0, 0, PdfColor(96, 96, 96), 14, sinB, PdfBrushes.white);
    headerRow.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

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
  for (var i = 0; i < Concepto.length; i++) {
    if (i == 0) {
      concepto.cells[0].value = '${i + 1}';
      concepto.cells[1].value = Concepto[i].noIdentificacion;
      concepto.cells[2].value = Concepto[i].claveProdServ;
      concepto.cells[3].value = Concepto[i].unidad;
      concepto.cells[4].value = Concepto[i].claveUnidad;
      concepto.cells[5].value = Concepto[i].cantidad;
      concepto.cells[6].value = formatCantidades(
          Concepto[i].valorUnitario == '' ? '0.0' : Concepto[i].valorUnitario);
      concepto.cells[7].value = formatCantidades(
          Concepto[i].descuento == '' ? '0.0' : Concepto[i].descuento);
      concepto.cells[8].value = formatCantidades(
          Concepto[i].importe == '' ? '0.0' : Concepto[i].importe);
      concepto = grid4.rows.add();
      concepto.cells[0].columnSpan = 9;
      concepto.cells[0].value = 'Descripccion: ${Concepto[i].descripcion}';
    } else {
      concepto = grid4.rows.add();
      concepto.cells[0].value = '${i + 1}';
      concepto.cells[1].value = Concepto[i].noIdentificacion;
      concepto.cells[2].value = Concepto[i].claveProdServ;
      concepto.cells[3].value = Concepto[i].unidad;
      concepto.cells[4].value = Concepto[i].claveUnidad;
      concepto.cells[5].value = Concepto[i].cantidad;
      concepto.cells[6].value = formatCantidades(
          Concepto[i].valorUnitario == '' ? '0.0' : Concepto[i].valorUnitario);
      concepto.cells[7].value = formatCantidades(
          Concepto[i].descuento == '' ? '0.0' : Concepto[i].descuento);
      concepto.cells[8].value = formatCantidades(
          Concepto[i].importe == '' ? '0.0' : Concepto[i].importe);
      concepto = grid4.rows.add();
      concepto.cells[0].columnSpan = 9;
      concepto.cells[0].value = 'Descripccion: ${Concepto[i].descripcion}';
    }
    for (var r = 0; r < grid4.rows.count; r++) {
      for (var i = 0; i < concepto.cells.count; i++) {
        grid4.rows[r].cells[i].style = pdfDatosStyle(onliBu);
        grid4.rows[r].cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
      }
    }
  }

  var npg = 0.0;

  for (var dc = 0; dc < dato.complementosNomina.length; dc++) {
    concepto = grid4.rows.add();
    concepto.cells[0].columnSpan = 9;
    concepto.cells[0].value = 'Datos del Complemento Nómina';
    concepto.cells[0].style = pdfCellStyle(
        0, 0, 0, 0, PdfColor(96, 96, 96), 14, sinB, PdfBrushes.white);
    concepto.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

    for (var i = 0; i < 9; i++) {
      concepto = grid4.rows.add();
      concepto.cells[0].columnSpan = 3;
      concepto.cells[3].columnSpan = 3;
      concepto.cells[6].columnSpan = 3;
      concepto.cells[0].style = pdfDatosStyle(sinB);
      concepto.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);
      concepto.cells[3].style = pdfDatosStyle(sinB);
      concepto.cells[3].stringFormat = pdfStrAlin(PdfTextAlignment.left);
      concepto.cells[6].style = pdfDatosStyle(sinB);
      concepto.cells[6].stringFormat = pdfStrAlin(PdfTextAlignment.left);

      if (i == 0) {
        concepto.cells[0].value =
            'Antiguedad: ${dato.complementosNomina[dc].nomina12Receptor.antigedad}';
        concepto.cells[3].value =
            'Tipo de Nómina: ${dato.complementosNomina[dc].tipoNomina}';
        concepto.cells[6].value =
            'Fecha de Pago: ${dato.complementosNomina[dc].fechaPago}';
      } else if (i == 1) {
        concepto.cells[0].value =
            'Inicio Rel. Laboral: ${dato.complementosNomina[dc].nomina12Receptor.fechaInicioRelLaboral}';
        concepto.cells[3].value =
            'Fecha Inicial: ${dato.complementosNomina[dc].fechaInicialPago}';
        concepto.cells[6].value =
            'Sindicalizado: ${dato.complementosNomina[dc].nomina12Receptor.sindicalizado}';
      } else if (i == 2) {
        concepto.cells[0].value =
            'Fecha de Emisión: ${dato.complementosNomina[dc].fechaPago}';
        concepto.cells[3].value =
            'Fecha Final: ${dato.complementosNomina[dc].fechaFinalPago}';
        concepto.cells[6].value =
            'Tipo de Jornada: ${dato.complementosNomina[dc].nomina12Receptor.tipoJornada}';
      } else if (i == 3) {
        concepto.cells[0].value =
            'Fecha de Timbrado: ${dato.complementosNomina[dc].fechaPago}';
        concepto.cells[3].value =
            'Días Pagados: ${dato.complementosNomina[dc].numDiasPagados}';
        concepto.cells[6].value =
            'Salario Base: ${dato.complementosNomina[dc].nomina12Receptor.salarioBaseCotApor}';
      } else if (i == 4) {
        concepto.cells[0].value = 'CSD: ${dato.noCertificado}';
        concepto.cells[3].value =
            'Periodicidad de Pago: ${dato.complementosNomina[dc].nomina12Receptor.periodicidadPago}';
        concepto.cells[6].value =
            'Salario Diario: ${dato.complementosNomina[dc].nomina12Receptor.salarioDiarioIntegrado}';
      } else if (i == 5) {
        concepto.cells[0].value = 'CSD SAT: ${dato.noCertificadoSatT}';
        concepto.cells[3].value =
            'Entidad Federativa: ${dato.complementosNomina[dc].nomina12Receptor.claveEntFed}';
        concepto.cells[6].value =
            'Riesgo Puesto: ${dato.complementosNomina[dc].nomina12Receptor.riesgoPuesto}';
      } else if (i == 6) {
        concepto.cells[0].value = 'RFC PAC: ${dato.rfcProvCertifT}';
        concepto.cells[3].value =
            'Tipo de Contrato: ${dato.complementosNomina[dc].nomina12Receptor.tipoContrato}';
        concepto.cells[6].value = '';
      } else if (i == 7) {
        concepto.cells[0].value = 'Uso de CFDI: ${dato.usoCfdiReceptor}';
        concepto.cells[3].value =
            'Regimen Contratación: ${dato.complementosNomina[dc].nomina12Receptor.tipoRegimen}';
        concepto.cells[6].value = '';
      } else if (i == 8) {
        concepto.cells[0].value =
            'Cta Bancaria: ${dato.complementosNomina[dc].nomina12Receptor.cuentaBancaria}';
        concepto.cells[3].value = 'Metodo de pago: ${dato.metodoPago}';
        concepto.cells[6].value = 'Tipo de Moneda: ${dato.moneda}';
      }
    }

    if (dato.complementosNomina[dc].nomina12Percepciones.nomina12Percepcion
            .length >
        0) {
      concepto = grid4.rows.add();
      concepto.cells[0].columnSpan = 9;
      concepto.cells[0].value = 'CONCEPTOS DE LA NÓMINDA DE TIPO ORDINARIO';
      concepto.cells[0].style = pdfDatosStyle(onlitop);
      concepto.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.left);

      concepto = grid4.rows.add();
      concepto.cells[0].value = 'Percepciones';
      concepto.cells[0].style = pdfCellStyle(
          0, 0, 0, 0, PdfColor(96, 96, 96), 8, sinB, PdfBrushes.white);
      concepto.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

      for (var i = 1; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfDatosStyle(sinB);
      }

      concepto = grid4.rows.add();
      concepto.cells[0].value = 'Clave';
      concepto.cells[1].columnSpan = 5;
      concepto.cells[1].value = 'Concepto';
      concepto.cells[6].value = 'Importe';
      concepto.cells[7].columnSpan = 2;
      concepto.cells[7].value = 'Importe Exento';

      for (var i = 0; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfCellStyle(
            5, 0, 2, 2, PdfColor(160, 160, 160), 8, allgray, PdfBrushes.white);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }

      for (var i = 0;
          i <
              dato.complementosNomina[dc].nomina12Percepciones
                  .nomina12Percepcion.length;
          i++) {
        concepto = grid4.rows.add();
        concepto.cells[0].value = dato.complementosNomina[dc]
            .nomina12Percepciones.nomina12Percepcion[i].clave;
        concepto.cells[1].columnSpan = 5;
        concepto.cells[1].value = dato.complementosNomina[dc]
            .nomina12Percepciones.nomina12Percepcion[i].concepto;
        concepto.cells[6].value = formatCantidades(dato.complementosNomina[dc]
            .nomina12Percepciones.nomina12Percepcion[i].importeGravado);
        concepto.cells[7].columnSpan = 2;
        concepto.cells[7].value = formatCantidades(dato.complementosNomina[dc]
            .nomina12Percepciones.nomina12Percepcion[i].importeExento);

        for (var i = 0; i < concepto.cells.count; i++) {
          concepto.cells[i].style = pdfDatosStyle(sinB);
          concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }
      }

      concepto = grid4.rows.add();
      concepto.cells[4].columnSpan = 2;
      concepto.cells[4].value = 'Total Percepcciones:';

      concepto.cells[6].value =
          '\$${formatCantidades(dato.complementosNomina[dc].nomina12Percepciones.totalGravado)}';
      concepto.cells[7].columnSpan = 2;
      concepto.cells[7].value =
          '\$${formatCantidades(dato.complementosNomina[dc].nomina12Percepciones.totalExento)}';

      for (var i = 0; i < concepto.cells.count; i++) {
        i <= 3
            ? concepto.cells[i].style = pdfDatosStyle(sinB)
            : concepto.cells[i].style = pdfCellStyle(5, 0, 2, 2,
                PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }
    }

    if (dato.complementosNomina[dc].nomina12Deducciones.nomina12Deduccion
            .length >
        0) {
      concepto = grid4.rows.add();
      concepto.cells[0].value = 'Deducciones';
      concepto.cells[0].style = pdfCellStyle(
          0, 0, 0, 0, PdfColor(96, 96, 96), 8, sinB, PdfBrushes.white);
      concepto.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

      for (var i = 1; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfDatosStyle(sinB);
      }

      concepto = grid4.rows.add();
      concepto.cells[0].value = 'Clave';
      concepto.cells[1].columnSpan = 5;
      concepto.cells[1].value = 'Concepto';
      concepto.cells[6].value = '';
      concepto.cells[7].columnSpan = 2;
      concepto.cells[7].value = 'Importe';

      for (var i = 0; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfCellStyle(
            5, 0, 2, 2, PdfColor(160, 160, 160), 8, allgray, PdfBrushes.white);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }

      for (var i = 0;
          i <
              dato.complementosNomina[dc].nomina12Deducciones.nomina12Deduccion
                  .length;
          i++) {
        concepto = grid4.rows.add();
        concepto.cells[0].value = dato.complementosNomina[dc]
            .nomina12Deducciones.nomina12Deduccion[i].clave;
        concepto.cells[1].columnSpan = 5;
        concepto.cells[1].value = dato.complementosNomina[dc]
            .nomina12Deducciones.nomina12Deduccion[i].concepto;
        concepto.cells[6].value = '';
        concepto.cells[7].columnSpan = 2;
        concepto.cells[7].value = formatCantidades(dato.complementosNomina[dc]
            .nomina12Deducciones.nomina12Deduccion[i].importe);

        for (var i = 0; i < concepto.cells.count; i++) {
          concepto.cells[i].style = pdfDatosStyle(sinB);
          concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }
      }

      final totalD = double.parse(dato.complementosNomina[dc]
                      .nomina12Deducciones.totalOtrasDeducciones ==
                  ''
              ? '0.0'
              : dato.complementosNomina[dc].nomina12Deducciones
                  .totalOtrasDeducciones) +
          double.parse(dato.complementosNomina[dc].nomina12Deducciones
                      .totalImpuestosRetenidos ==
                  ''
              ? '0.0'
              : dato.complementosNomina[dc].nomina12Deducciones
                  .totalImpuestosRetenidos);

      concepto = grid4.rows.add();
      concepto.cells[4].columnSpan = 2;
      concepto.cells[4].value = 'Total Deducciones:';
      concepto.cells[6].value = '';
      concepto.cells[7].columnSpan = 2;
      concepto.cells[7].value =
          '\$${formatCantidades(totalD.toStringAsFixed(2))}';

      for (var i = 0; i < concepto.cells.count; i++) {
        i <= 3
            ? concepto.cells[i].style = pdfDatosStyle(sinB)
            : concepto.cells[i].style = pdfCellStyle(5, 0, 2, 2,
                PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }
    }

    if (dato.complementosNomina[dc].nomina12OtrosPagos.nomina12OtroPago.length >
        0) {
      concepto = grid4.rows.add();
      concepto.cells[0].value = 'Otros Pagos';
      concepto.cells[0].style = pdfCellStyle(
          0, 0, 0, 0, PdfColor(96, 96, 96), 8, sinB, PdfBrushes.white);
      concepto.cells[0].stringFormat = pdfStrAlin(PdfTextAlignment.center);

      for (var i = 1; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfDatosStyle(sinB);
      }

      concepto = grid4.rows.add();
      concepto.cells[0].value = 'Clave';
      concepto.cells[1].columnSpan = 5;
      concepto.cells[1].value = 'Concepto';
      concepto.cells[6].value = '';
      concepto.cells[7].columnSpan = 2;
      concepto.cells[7].value = 'Importe';

      for (var i = 0; i < concepto.cells.count; i++) {
        concepto.cells[i].style = pdfCellStyle(
            5, 0, 2, 2, PdfColor(160, 160, 160), 8, allgray, PdfBrushes.white);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }

      double top = 0.00;

      for (var i = 0;
          i <
              dato.complementosNomina[dc].nomina12OtrosPagos.nomina12OtroPago
                  .length;
          i++) {
        concepto = grid4.rows.add();
        concepto.cells[0].value = dato.complementosNomina[dc].nomina12OtrosPagos
            .nomina12OtroPago[i].clave;
        concepto.cells[1].columnSpan = 5;
        concepto.cells[1].value = dato.complementosNomina[dc].nomina12OtrosPagos
            .nomina12OtroPago[i].concepto;
        concepto.cells[6].value = '';
        concepto.cells[7].columnSpan = 2;
        concepto.cells[7].value = dato.complementosNomina[dc].nomina12OtrosPagos
            .nomina12OtroPago[i].importe;
        for (var i = 0; i < concepto.cells.count; i++) {
          concepto.cells[i].style = pdfDatosStyle(sinB);
          concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
        }
        top = double.parse(dato.complementosNomina[dc].nomina12OtrosPagos
                .nomina12OtroPago[i].importe) +
            top;
      }

      concepto = grid4.rows.add();
      concepto.cells[4].columnSpan = 2;
      concepto.cells[4].value = 'Total Otros Pagos:';
      concepto.cells[6].value = '';
      concepto.cells[7].columnSpan = 2;
      concepto.cells[7].value = '\$${formatCantidades(top.toString())}';

      for (var i = 0; i < concepto.cells.count; i++) {
        i <= 3
            ? concepto.cells[i].style = pdfDatosStyle(sinB)
            : concepto.cells[i].style = pdfCellStyle(5, 0, 2, 2,
                PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black);
        concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center);
      }
    }

    npg = double.parse(dato.complementosNomina[dc].totalPercepciones == ''
            ? '0.0'
            : dato.complementosNomina[dc].totalPercepciones) +
        double.parse(dato.complementosNomina[dc].totalOtrosPagos == ''
            ? '0.0'
            : dato.complementosNomina[dc].totalOtrosPagos) -
        double.parse(dato.complementosNomina[dc].totalDeducciones == ''
            ? '0.0'
            : dato.complementosNomina[dc].totalDeducciones) +
        npg;
  }

  final dl = converNumToLetras(npg, dato.moneda);

  concepto = grid4.rows.add();
  concepto.cells[0].columnSpan = 2;
  concepto.cells[0].value = 'Importe con letra:';
  concepto.cells[2].columnSpan = 3;
  concepto.cells[2].value = dl;
  concepto.cells[5].columnSpan = 2;
  concepto.cells[5].value = 'Neto Pagado:';
  concepto.cells[7].columnSpan = 2;
  concepto.cells[7].value =
      '\$${formatCantidades(npg.toStringAsFixed(2).toString())}';

  for (var i = 0; i < concepto.cells.count; i++) {
    i == 2
        ? concepto.cells[i].style = pdfDatosStyle(sinB)
        : concepto.cells[i].style = pdfCellStyle(
            5, 0, 2, 2, PdfColor(224, 224, 224), 8, allgray, PdfBrushes.black);
    i == 7
        ? concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.center)
        : concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
  }

  //QR Y DATOS ADICIONALES DE CFDI
  final Uint8List imageData =
      File('${Pref.Directorio}/QR.png').readAsBytesSync();
  final PdfBitmap image = PdfBitmap(imageData);

  for (var i = 0; i < 8; i++) {
    concepto = grid4.rows.add();
    concepto.cells[0].columnSpan = 2;

    i == 0 ? concepto.cells[0].value = image : null;
    i == 0 ? concepto.cells[0].rowSpan = 8 : null;

    concepto.cells[3].columnSpan = 6;
    concepto.cells[3].value = i == 0
        ? ' '
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

    for (var i = 0; i < concepto.cells.count; i++) {
      concepto.cells[i].style = PdfGridCellStyle(
          borders: sinB,
          font: PdfStandardFont(PdfFontFamily.helvetica, 6),
          textBrush: PdfSolidBrush(PdfColor(32, 32, 32)));
      concepto.cells[i].stringFormat = pdfStrAlin(PdfTextAlignment.left);
    }
  }

  final PdfPageTemplateElement headerTemplate =
      PdfPageTemplateElement(const Rect.fromLTWH(0, 50, 550, 25));
  headerTemplate.graphics.drawString(
      'Folio Administrativo: ${dato.tipoDeComprobante}${dato.folio}                                                            UUID: ${dato.uuidT}                                                            Receptor: ${dato.nombreReceptor}',
      PdfStandardFont(PdfFontFamily.helvetica, 6),
      bounds: const Rect.fromLTWH(0, 0, 550, 25),
      format: PdfStringFormat(alignment: PdfTextAlignment.justify));
  document.template.evenTop = headerTemplate;

  //TODO: FALTA AGREGAR PIE DE PAGs ajustar

  // for (var i = 0; i < document.pages.count; i++) {
  //   PdfTemplate footerTemplate = PdfTemplate(500, 800)
  //     ..graphics!.drawRectangle(
  //         brush: PdfSolidBrush(PdfColor(255, 0, 0)),
  //         bounds: const Rect.fromLTWH(0, 0, 0, 0))
  //     ..graphics!.drawString(
  //         'Este documento es una representacion impresa de un CFDI ${dato.version}                                                                         Página ${i + 1} de ${document.pages.count}',
  //         PdfStandardFont(PdfFontFamily.helvetica, 9),
  //         format: PdfStringFormat(alignment: PdfTextAlignment.justify));
  //   document.pages[i].graphics
  //       .drawPdfTemplate(footerTemplate, const Offset(0, 710));
  // }

  grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));
  grid2.draw(page: page, bounds: Rect.fromLTWH(0, dato.heidh1, 0, 0));
  grid3.draw(page: page, bounds: Rect.fromLTWH(0, dato.heidh2, 0, 0));
  grid4.draw(page: page, bounds: Rect.fromLTWH(0, dato.heidh3 - 5, 0, 0));

  bytes = await document.save();
  document.dispose();

  return Pref.file.isEmpty ? null : PDFView(bytes, 'Comprobante');
}

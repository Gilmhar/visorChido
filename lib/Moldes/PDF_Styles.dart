// ignore_for_file: file_names

import 'package:syncfusion_flutter_pdf/pdf.dart';

pdfCellStyle(double l, double r, double t, double b, PdfColor c, double s,
    PdfBorders bd,PdfBrush colorT ) {
  return PdfGridCellStyle(
      borders: bd,
      backgroundBrush: PdfSolidBrush(c),
      cellPadding: PdfPaddings(left: l, right: r, top: t, bottom: b),
      font:
          PdfStandardFont(PdfFontFamily.helvetica, s, style: PdfFontStyle.bold),
      textBrush: colorT);
}

pdfDatosStyle(PdfBorders  b) {
  return PdfGridCellStyle(
      borders: b,
      font: PdfStandardFont(PdfFontFamily.helvetica, 8),
      textBrush: PdfSolidBrush(PdfColor(32, 32, 32)));
}


pdfValidacionStyle(PdfBorders  b, double n) {
  return PdfGridCellStyle(
      borders: b,
      font: PdfStandardFont(PdfFontFamily.helvetica, n),
      textBrush: PdfSolidBrush(PdfColor(32, 32, 32)));
}


pdfStrAlin(PdfTextAlignment a) {
  return PdfStringFormat(
      alignment: a, lineAlignment: PdfVerticalAlignment.middle);
}

PdfBorders sinB = PdfBorders(
    left: PdfPen(PdfColor(300, 300, 300)),
    right: PdfPen(PdfColor(300, 300, 300)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(300, 300, 300)));
PdfBorders onlitop = PdfBorders(
    left: PdfPen(PdfColor(300, 300, 300)),
    right: PdfPen(PdfColor(300, 300, 300)),
    top: PdfPen(PdfColor(0, 0, 0)),
    bottom: PdfPen(PdfColor(300, 300, 300)));
PdfBorders onliL = PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0)),
    right: PdfPen(PdfColor(300, 300, 300)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(300, 300, 300)));

PdfBorders onliR = PdfBorders(
    left: PdfPen(PdfColor(300, 300, 300)),
    right: PdfPen(PdfColor(0, 0, 0)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(300, 300, 300)));

PdfBorders onliBu = PdfBorders(
    left: PdfPen(PdfColor(300, 300, 300)),
    right: PdfPen(PdfColor(300, 300, 300)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(0, 0, 0)));

PdfBorders onliLR = PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0)),
    right: PdfPen(PdfColor(0, 0, 0)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(300, 300, 300)));

PdfBorders onliLB = PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0)),
    right: PdfPen(PdfColor(300, 300, 300)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(0, 0, 0)));

PdfBorders onliRB = PdfBorders(
    left: PdfPen(PdfColor(300, 300, 300)),
    right: PdfPen(PdfColor(0, 0, 0)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(0, 0, 0)));

PdfBorders onliLRB = PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0)),
    right: PdfPen(PdfColor(0, 0, 0)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(0, 0, 0)));

PdfBorders allBlue = PdfBorders(
    left: PdfPen(PdfColor(142, 170, 219)),
    right: PdfPen(PdfColor(142, 170, 219)),
    top: PdfPen(PdfColor(142, 170, 219)),
    bottom: PdfPen(PdfColor(142, 170, 219)));

PdfBorders allgray = PdfBorders(
    left: PdfPen(PdfColor(225, 211, 211, 0)),
    right: PdfPen(PdfColor(225, 211, 211, 0)),
    top: PdfPen(PdfColor(300, 300, 300)),
    bottom: PdfPen(PdfColor(300, 300, 300)));

PdfBorders firmas = PdfBorders(
    left: PdfPen(PdfColor(300, 300, 300)),
    right: PdfPen(PdfColor(300, 300, 300)),
    top: PdfPen(PdfColor(142, 170, 219)),
    bottom: PdfPen(PdfColor(300, 300, 300)));

// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:io';
import 'dart:ui';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';

PDFView(List<int> bytes, String documento) async {
  final file = File('${Pref.Directorio}/$documento.pdf');
  await file.writeAsBytes(bytes, flush: true);
  var d = await PDFDocument.fromFile(file);
  return PDFViewer(
      document: d,
      showNavigation: false,
      showPicker: false,
      indicatorPosition: IndicatorPosition.topLeft);
}

Future<void> createQR(String uuid, String emisor, String receptor) async {
  try {
    final image = await QrPainter(
            data: 'https://verificacfdi.facturaelectronica.sat.gob.mx/default.aspx?id=$uuid&re=$emisor&rr=$receptor&tt=0000007505.770000&fe=35FF1A2B',
            version: QrVersions.auto,
            color: Colors.black,
            emptyColor: Colors.white)
        .toImage(160);
    final a = await image.toByteData(format: ImageByteFormat.png);
    final bytes = a!.buffer.asUint8List();
    final imgFile = File('${Pref.Directorio}/QR.png');
    await imgFile.writeAsBytes(bytes, flush: true);
  } catch (e) {
    rethrow;
  }
}

// ignore_for_file: file_names

import 'package:open_as_default/open_as_default.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'dart:io';
import 'package:xml/xml.dart';

Future init() async {
  if (Platform.isAndroid) {
    var r = await OpenAsDefault.getFileIntent.then((value) {
      return value;
    });
    if (r != null) {
      final data = await File(r.path).readAsString();
      final doc = XmlDocument.parse(data);
      final docxml = doc.toXmlString();
      Pref.file = docxml.toString();
    } else {}
  } else {}
}

// ignore_for_file: use_key_in_widget_constructors, camel_case_types, non_constant_identifier_names
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/Cargar_Comprobante.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/UiProviders.dart';
import 'package:visor_xml/pages/home.dart';
import 'package:visor_xml/utils/post.dart';

class addbutton extends StatefulWidget {
  @override
  State<addbutton> createState() => _addbuttonState();
}

class _addbuttonState extends State<addbutton> {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<Uiprovider>(context);
    var cI = uiprovider.selectedMenuOpt;

    if (cI == 1) {
      return Spin(
        child: FloatingActionButton(
            heroTag: 'estructurado',
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0,
            backgroundColor: const Color.fromARGB(235, 34, 157, 184),
            child: Image.asset('assets/ICONOXML.png'),
            onPressed: () async {
              final data = await file(context);
              if (data != null) {
                Pref.file = data;
                Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => home(),
                        transitionDuration: const Duration(milliseconds: 0)),
                    (Route<dynamic> route) => false);
              } else {}
            }),
      );
    } else if (cI == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BounceInUp(
            child: FloatingActionButton(
                heroTag: 'PDF',
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                elevation: 0,
                backgroundColor: const Color.fromARGB(235, 34, 157, 184),
                child: const Icon(Icons.share, size: 40, color: Colors.white),
                onPressed: () async {
                  await FlutterShare.shareFile(
                      title: 'PDF',
                      filePath: '${Pref.Directorio}/Comprobante.pdf');
                }),
          ),
          const SizedBox(
            height: 12,
          ),
          Spin(
            child: FloatingActionButton(
                heroTag: 'btn3',
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                elevation: 0,
                backgroundColor: const Color.fromARGB(235, 34, 157, 184),
                child: Image.asset('assets/ICONOXML.png'),
                onPressed: () async {
                  final data = await file(context);
                  if (data != null) {
                    Pref.file = data;
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => home(),
                            transitionDuration:
                                const Duration(milliseconds: 0)),
                        (Route<dynamic> route) => false);

                    return data;
                  } else {}
                }),
          ),
        ],
      );
    } else if (cI == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BounceInUp(
            child: FloatingActionButton(
                heroTag: 'analisis',
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                elevation: 0,
                backgroundColor: const Color.fromARGB(235, 34, 157, 184),
                child: const Icon(Icons.share, size: 40, color: Colors.white),
                onPressed: () async {
                  await FlutterShare.shareFile(
                      title: 'PDF',
                      filePath: '${Pref.Directorio}/validacion.pdf');
                }),
          ),
          const SizedBox(
            height: 12,
          ),
          Spin(
            child: FloatingActionButton(
                heroTag: 'btn3',
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                elevation: 0,
                backgroundColor: const Color.fromARGB(235, 34, 157, 184),
                child: Image.asset('assets/ICONOXML.png'),
                onPressed: () async {
                  final data = await file(context);
                  if (data != null) {
                    Pref.file = data;
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => home(),
                            transitionDuration:
                                const Duration(milliseconds: 0)),
                        (Route<dynamic> route) => false);

                    return data;
                  } else {}
                }),
          ),
        ],
      );
    }
    return Container();
  }
}

Future file(context) async {
  final result = await FilePicker.platform.pickFiles(
      type: FileType.custom, allowedExtensions: ['xml'], allowMultiple: true);
  if (result == null) return;
  final file = result.files.first;
  final res = await File('${file.path}').readAsString();
  await vSATP('cfdi\$Comprobante', 'cfdi\$Emisor', 'cfdi\$Receptor',
      'cfdi\$Complemento', 'tfd\$TimbreFiscalDigital', res.toString());
  Pref.resSAT = await post(Pref.uuid, Pref.rfcE, Pref.rfcR, context);
  cargarComprobante(res.toString(), context);
  Pref.file = res.toString();
  return res;
}

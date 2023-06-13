// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/Tipo_CFDI.dart';

class GraficoPDF extends StatefulWidget {
  const GraficoPDF({Key? key}) : super(key: key);

  @override
  State<GraficoPDF> createState() => _GraficoPDFState();
}

class _GraficoPDFState extends State<GraficoPDF> {
  @override
  Widget build(BuildContext context) {
    var Tipo = Provider.of<TipoCFDI>(context, listen: false);
    return Container(
        margin: const EdgeInsets.only(top: 5, left: 2, right: 2),
        child: SafeArea(
          child: Center(
            child: FutureBuilder(
                future: Tipo.PDF(context, Pref.file),
                initialData: null,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return snapshot.data;
                  }
                  return Center(
                      child: Column(children: [
                    const SizedBox(height: 250),
                    Pref.file.isEmpty
                        ? const Text('No se a seleccionado ningun XML....')
                        : const Text('CREANDO PDF....')
                  ]));
                }),
          ),
        ));
  }
}

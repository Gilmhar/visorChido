// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:visor_xml/utils/post.dart';

class PageValidacion extends StatefulWidget {
  const PageValidacion({Key? key}) : super(key: key);

  @override
  State<PageValidacion> createState() => _PageValidacionState();
}

class _PageValidacionState extends State<PageValidacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color.fromARGB(255, 0, 81, 115),
        elevation: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/ENCABEZADO.png',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
              future: htmlSAT(context),
              initialData: null,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  // return Html(data: document.text);
                  return snapshot.data;
                }
                return Center(
                    child: Column(
                  children: [
                    const SizedBox(height: 250),
                    Pref.file.isEmpty
                        ? const Text('No se a seleccionado ningun XML....')
                        : const Text('Validando datos....'),
                  ],
                ));
              }),
        ),
      ),
    );
  }
}

Future htmlSAT(context) async {
  var dato = Provider.of<DatosCfdi>(context, listen: false);
  final htmlValue = await vSAT(dato.uuidT, dato.rfcEmisor, dato.rfcReceptor, context);
  return htmlValue;
}

// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/Estilo_XML.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/Tipo_CFDI.dart';

class Pagexml extends StatefulWidget {
  const Pagexml({Key? key}) : super(key: key);
  @override
  State<Pagexml> createState() => _PagexmlState();
}

class _PagexmlState extends State<Pagexml> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 81, 115),
        elevation: 0,
        title: const Text('XML Resaltado'),
        centerTitle: true,
        actions:  [
          Padding(
            padding:const EdgeInsets.only(right: 10),
            child: Image.asset('assets/ICONOXML.png')
          )
        ],
      ),
      body: _body(),
    );
  }
}

class _body extends StatefulWidget {
  @override
  State<_body> createState() => _bodyState();
}

class _bodyState extends State<_body> {
  int _c = 0;

  void _inC() {
    _c++;
    (_c > 2) ? _c = 1 : _c = _c;
    (_c == 1) ? Pref.show = true : Pref.show = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var Tipo = Provider.of<TipoCFDI>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: PinchZoom(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: Tipo.od(context),
              initialData: null,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  String d = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            _inC();
                          },
                          child: const Text(
                            'Presione aqui para mostrar el valor completo de "Certificado"',
                            style: TextStyle(fontSize: 12),
                          )),
                      FormattedText(d,
                          style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  );
                }
                return Center(
                    child: Column(children: [
                  const SizedBox(height: 250),
                  Pref.file.isEmpty
                      ? const Text('No se a seleccionado ningun XML....')
                      : const Text('RESALTANDO....'),
                ]));
              }),
        ),
        maxScale: 2.5,
        resetDuration: const Duration(seconds: 4),
      ),
    );
  }
}

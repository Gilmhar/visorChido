// ignore_for_file: avoid_unnecessary_containers, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/Tipo_CFDI.dart';

class ValidacionPDF extends StatelessWidget {
  const ValidacionPDF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Tipo = Provider.of<TipoCFDI>(context, listen: false);

    //En la validacion del PDF primero tenemos que definir que tipo de XML es con Tipo.validarPDF en el que tenemos que mandar el Context y el XML(este como String)

    return Pref.file.isNotEmpty
        ? FutureBuilder(
            future: Tipo.validarPDF(context, Pref.file),
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return snapshot.data;
              }
              return Container(
                  child: const Center(
                      child: Column(
                children:  [SizedBox(height: 250), Text('Validando PDF')],
              )));
            })
        : Container(
            child: const Center(
                child: Column(
            children:  [
              SizedBox(height: 250),
              Text('No se a seleccionado ningun XML....')
            ],
          )));
  }
}

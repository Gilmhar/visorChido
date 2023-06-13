// ignore_for_file: file_names, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:visor_xml/Moldes/Tipo_CFDI.dart';

class Estructurado extends StatelessWidget {
  
  // Aqui se carga todo el XML estructurado, dependiendo del tipo de XML que sea, esto en Tipo.esturcturado();

  const Estructurado({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var Tipo = Provider.of<TipoCFDI>(context, listen: false);
    return Tipo.esturcturado();
  }
}

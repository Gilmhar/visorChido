// ignore_for_file: must_be_immutable, camel_case_types, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/DatosDe.dart';

class rIntereses extends StatefulWidget {

  //TODO: PENDIENTE AGREGAR RETENCIONES
  String data;
  rIntereses({Key? key, required this.data}) : super(key: key);

  @override
  State<rIntereses> createState() => _rInteresesState();
}

class _rInteresesState extends State<rIntereses> {
  @override
  Widget build(BuildContext context) {
    var datosDe = Provider.of<DatosDe>(context, listen: false);
    final retenciones = datosDe.retenciones(widget.data);
    final emisorR = datosDe.retencionesEmisor(widget.data);
    final receptorR = datosDe.retencionesReceptor(widget.data);
    final periodo = datosDe.retencionesPeriodo(widget.data);
    final totales = datosDe.retencionesTotatles(widget.data);
    final timbre = datosDe.retencionesTimbre(widget.data, context);
    final complemenrtoR = datosDe.retencionesComplemento(widget.data);

    return Container();
  }
}

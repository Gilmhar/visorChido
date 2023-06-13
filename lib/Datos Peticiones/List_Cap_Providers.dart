

// ignore_for_file: unrelated_type_equality_checks, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:visor_xml/Datos%20Peticiones/Db_Cap.dart';

import 'Mapa_Cap.dart';

class PDatosListProvider extends ChangeNotifier {
  List<PaqueteDatos?> PD = [];

  Future<PaqueteDatos> nuevoPaquete(String identificador, String cap, String  res ) async {
    final nuevoPaquete =  PaqueteDatos(id: null, identificador: identificador, cap: cap, res: res);
    final id = await DBprovider.db.nuevoPaquete(nuevoPaquete);
    nuevoPaquete.id = id;
    return nuevoPaquete;
  }

  cargarPD() async {
    final datos = await DBprovider.db.getTodosLosPaquetes();
     PD = [...datos];
    notifyListeners();
  }

  cargarPDTipo(String tipo) async {
    final datos = await DBprovider.db.getPaquetePorTipo(tipo);
    PD = [...?datos];
    notifyListeners();
  }

  borrarTodo() async {
    await DBprovider.db.deleteAllPaquetes();
    PD = [];
    notifyListeners();
  }

  borrarPDPorid(int id) async {
    await DBprovider.db.deletePaquete(id);
  }

  actuPD(int id, String identificador, String cap, String res) async {
    final nuevoPaquete = PaqueteDatos(id: id, identificador: identificador, cap: cap, res: res);
    await DBprovider.db.updatePaquete(nuevoPaquete);
  }
}

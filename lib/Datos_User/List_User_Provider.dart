// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:visor_xml/Datos_User/Map_User.dart';

import 'DB_User.dart';

class UserListProvider extends ChangeNotifier {
  List<Usuario?> user = [];

  Future<Usuario?> nuevoUSER(
      String idcelular,
      String nombre,
      String celular,
      String correo,
      String contra,
      String fechaDescarga,
      String fechaFinalPruena,
      String pruebaOPago,
      String fechaPago) async {

    final nuevoUser =  Usuario(
        id: null,
        idcelular: idcelular,
        nombre: nombre,
        celular: celular,
        correo: correo,
        contra: contra,
        fechaDescarga: fechaDescarga,
        fechaFinalPruena: fechaFinalPruena,
        pruebaOPago: pruebaOPago,
        fechaPago: fechaPago);
        //Se agrega el registro con los datos que se mandan
    final id = await DBprovider.db.nuevoUsuario(nuevoUser);
    nuevoUser.id = id;
    return nuevoUser;
  }

  // Aqui simplificamos los metodos para poder llamar en cualquier parte de la APP y mandar los datos necesarios, dependiendo de lo que se va a hacer en la DB

  cargarPD() async {
    final datos = await DBprovider.db.getTodosLosUser();
    user = [...datos];
    notifyListeners();
  }

  cargarPDTipo(String tipo) async {
    final datos = await DBprovider.db.getUserPorTipo(tipo);
    user = [...?datos];
    notifyListeners();
  }

  borrarTodo() async {
    await DBprovider.db.deleteAllUser();
    user = [];
    notifyListeners();
  }

  borrarPDPorid(int id) async {
    await DBprovider.db.deleteUser(id);
  }

  actuPD(
      int id,
      String idcelular,
      String nombre,
      String celular,
      String correo,
      String contra,
      String fechaDescarga,
      String fechaFinalPruena,
      String pruebaOPago,
      String fechaPago) async {
    final nuevoUser = Usuario(
        id: id,
        idcelular: idcelular,
        nombre: nombre,
        celular: celular,
        correo: correo,
        contra: contra,
        fechaDescarga: fechaDescarga,
        fechaFinalPruena: fechaFinalPruena,
        pruebaOPago: pruebaOPago,
        fechaPago: fechaPago);
    await DBprovider.db.updateUser(nuevoUser);
  }
}

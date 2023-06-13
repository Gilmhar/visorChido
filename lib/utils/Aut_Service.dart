// ignore_for_file: file_names, avoid_print, unused_local_variable
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:visor_xml/Datos%20Peticiones/List_Cap_Providers.dart';
import 'package:visor_xml/Datos_User/List_User_Provider.dart';
import 'package:visor_xml/utils/Enviroments.dart';
import 'package:ntp/ntp.dart';

class AutS with ChangeNotifier {
  
  Future<void> primerInicio(context) async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    var deviceData = <String, dynamic>{};
    Platform.isAndroid
        ? deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo)
        : "";

    final fechaDescarga = DateTime.now();
    final fechafinal = DateTime(
        fechaDescarga.year, fechaDescarga.month, fechaDescarga.day + 30);
    final idcelular = deviceData['id']; 

    final altaUser = Provider.of<UserListProvider>(context, listen: false);
    //Aqui se manda a llamar la DB y se escribe en ella
    await altaUser.nuevoUSER(idcelular.toString(), "x", "x", "x", "x",fechaDescarga.toString(), fechafinal.toString(), "x", "x");
  }

  Future<void> capchat(context) async {
    final res = await http.get(Uri.parse("${Enviroment.apiUrl}basecaph.php"));
    var datos = json.decode(res.body);
    final pD = Provider.of<PDatosListProvider>(context, listen: false);
    for (var i = 0; i < 10; i++) {
      await pD.nuevoPaquete(datos[i]['id'], datos[i]['cap'], datos[i]['res']);
    }
  }

  Future periodoDprueba(context) async {
    // Se consulta la hora del dia actual y la hora de final de periodo de prueba de la DB creada previamente para hacer la consulta de dias de prueba que en este caso se le dan 30 
    DateTime _myTime;
    _myTime = DateTime.now();
    final int offset = await NTP.getNtpOffset(
        localTime: _myTime, lookUpAddress: 'mx.pool.ntp.org');
    final fechaNOW = _myTime.add(Duration(milliseconds: offset));

    final dataUser = Provider.of<UserListProvider>(context, listen: false);
    await dataUser.cargarPD();
    final fechaDescarga = DateTime.parse(dataUser.user[0]!.fechaDescarga);
    final difDeDias = fechaNOW.difference(fechaDescarga).inDays;

    //Si la Diferencia de Fechas es mayor a 30 dias se regresa false si no true
    // ya me acorde este se llama ternario: 
    return true;
    // return difDeDias >= 30 ?  false :  true;
    //Sustituye al if y te ahorras lineas de codigo

    // if (difDeDias >= 30) {
    //   return false;
    // }else{
    //   return true;
    // }
  }
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'id': build.id,
  };
}

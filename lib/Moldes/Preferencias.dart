// ignore_for_file: non_constant_identifier_names, file_names

import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static late SharedPreferences _pref;

  static String _Directorio = '';
  static String _file = '';
  static String _id = '';

  static String _rfcE = '';
  static String _rfcR = '';
  static String _uuid = '';

  static String _resSAT = '';

  static bool _show = false;
  static bool _desglose = false;

  static int _page = 0;
  static int _pages = 0;

  static int _contadorCH = 1;

  static int _contadorAPP = 1;

  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  //DIRECTORIO
  static String get Directorio {
    return _pref.getString('Directorio') ?? _Directorio;
  }

  static set Directorio(String Directorio) {
    _Directorio = Directorio;
    _pref.setString('Directorio', Directorio);
  }

  //ARCHIVO
  static String get file {
    return _pref.getString('file') ?? _file;
  }

  static set file(String file) {
    _file = file;
    _pref.setString('file', file);
  }

  //uuid
  static String get id {
    return _pref.getString('id') ?? _id;
  }

  static set id(String id) {
    _id = id;
    _pref.setString('id', id);
  }

  //RFC EMISOR
  static String get rfcE {
    return _pref.getString('rfcE') ?? _rfcE;
  }

  static set rfcE(String rfcE) {
    _rfcE = rfcE;
    _pref.setString('rfcE', rfcE);
  }

  //RFC RECEPTOR
  static String get rfcR {
    return _pref.getString('rfcR') ?? _rfcR;
  }

  static set rfcR(String rfcR) {
    _rfcR = rfcR;
    _pref.setString('rfcR', rfcR);
  }

  //UUID
  static String get uuid {
    return _pref.getString('uuid') ?? _uuid;
  }

  static set uuid(String uuid) {
    _uuid = uuid;
    _pref.setString('uuid', uuid);
  }

  //RESPUESTA SATA POST
  static String get resSAT {
    return _pref.getString('resSAT') ?? _resSAT;
  }

  static set resSAT(String resSAT) {
    _resSAT = resSAT;
    _pref.setString('resSAT', resSAT);
  }

  //mostrar certificado
  static bool get show {
    return _pref.getBool('show') ?? _show;
  }

  static set show(bool value) {
    _show = value;
    _pref.setBool('show', value);
  }

  //Desglozar datos validacion pdf
  static bool get desglose {
    return _pref.getBool('desglose') ?? _desglose;
  }

  static set desglose(bool value) {
    _desglose = value;
    _pref.setBool('desglose', value);
  }

  //Pagina actual pdf
  static int get page {
    return _pref.getInt('page') ?? _page;
  }

  static set page(int value) {
    _page = value;
    _pref.setInt('page', value);
  }

  //Total paginas PDF
  static int get pages {
    return _pref.getInt('pages') ?? _pages;
  }

  static set pages(int value) {
    _pages = value;
    _pref.setInt('pages', value);
  }

    //ContadorCAPCHAT
  static int get contadorCH {
    return _pref.getInt('contadorCH') ?? _contadorCH;
  }

  static set contadorCH(int value) {
    _contadorCH = contadorCH;
    _pref.setInt('contadorCH', value);
  }

      //ContadorINICIOAPP
  static int get contadorAPP {
    return _pref.getInt('contadorAPP') ?? _contadorAPP;
  }

  static set contadorAPP(int value) {
    _contadorAPP = contadorAPP;
    _pref.setInt('contadorAPP', value);
  }

}
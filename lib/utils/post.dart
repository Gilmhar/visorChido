import 'dart:convert';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/utils/Cooquies.dart';
import 'package:http/http.dart' as http;
import 'package:visor_xml/utils/datos_xml.dart';

import '../Datos Peticiones/List_Cap_Providers.dart';

Future post(String uuidxml, String rfcExml, String rfcRxml, context) async {
  final pD = Provider.of<PDatosListProvider>(context, listen: false);
  await pD.cargarPD();
  final c = pD.PD;
  Pref.contadorCH++;
  Pref.contadorCH >= 10
      ? Pref.contadorCH = 1
      : Pref.contadorCH = Pref.contadorCH;

  var s = Sesion();
  var R = await s.get('https://verificacfdi.facturaelectronica.sat.gob.mx/');
  if (s.statuscod == '200') {
    //UUID
    var uuid =
        'ctl00%24ScriptManager1=ctl00%24MainContent%24UpnlBusqueda%7Cctl00%24MainContent%24BtnBusqueda&' +
            Uri.encodeComponent('ctl00\$MainContent\$TxtUUID') +
            '=' +
            Uri.encodeComponent(uuidxml);
    //CAPCHAT
    var captxt = '&' +
        Uri.encodeComponent('ctl00\$MainContent\$TxtCaptchaNumbers') +
        '=' +
        Uri.encodeComponent(c[Pref.contadorCH]!.res);
    //RFC EMISOR
    var rfcE = '&' +
        Uri.encodeComponent('ctl00\$MainContent\$TxtRfcEmisor') +
        '=' +
        Uri.encodeComponent(rfcExml);
    //RFC RECEPTOR
    var rfcR = '&' +
        Uri.encodeComponent('ctl00\$MainContent\$TxtRfcReceptor') +
        '=' +
        Uri.encodeComponent(rfcRxml);
    var viewstate = '&' +
        Uri.encodeComponent('__VIEWSTATE') +
        '=' +
        Uri.encodeComponent(c[Pref.contadorCH]!.cap);
    var viewgeneretor = '&' +
        Uri.encodeComponent('__VIEWSTATEGENERATOR') +
        '=' +
        Uri.encodeComponent('CA0B0334');
    var viewencripted = '&' +
        Uri.encodeComponent('__VIEWSTATEENCRYPTED') +
        '=' +
        Uri.encodeComponent('');
    var etarget = '&' +
        Uri.encodeComponent('__EVENTTARGET') +
        '=' +
        '&' +
        Uri.encodeComponent('__EVENTARGUMENT') +
        '=';
    var post = uuid +
        captxt +
        rfcE +
        rfcR +
        viewstate +
        viewgeneretor +
        viewencripted +
        etarget +
        '&ctl00%24MainContent%24hdnTotal=' +
        '&ctl00%24MainContent%24hdnSello=' +
        '&__ASYNCPOST=true' +
        '&ctl00%24MainContent%24BtnBusqueda=Verificar%20CFDI';
    R = await s.post(
        'https://verificacfdi.facturaelectronica.sat.gob.mx/', post);
    return await R;
  }
}

////////////////////////////////////////////////////////////////////////////////

Future busquedaArt69(String rfc) async {
  final txt = File('${Pref.Directorio}/Art69.txt');
  var contents = '';
  try {
    contents = await txt.readAsString();
  } catch (e) {
    final data = await art69();
    await txt.writeAsString(data);
    contents = await txt.readAsString();
  }
  if (contents.contains(rfc)) {
    return '$rfc Si se encuentra en la presunción de llevar a cabo operaciones inexistentes';
  } else {
    return '$rfc No se encuentra en la presunción de llevar a cabo operaciones inexistentes';
  }
}

Future art69() async {
  http.Response response = await http.get(Uri.parse(
      'https://storage.googleapis.com/phonic-formula-197423.appspot.com/visorxmlt/art69.xml'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return 'ERROR';
  }
}

////////////////////////////////////////////////////////////////////////////////

Future buscarConceptos(String nConcepto) async {
  final txt = File('${Pref.Directorio}/CatalogoSAT.txt');
  var contents = '';
  try {
    contents = await txt.readAsString();
  } catch (e) {
    final data = await catalogoSAT();
    await txt.writeAsString(data);
    contents = await txt.readAsString();
  }
  final c = concepto(contents, nConcepto, '>');
  final d = const Utf8Decoder().convert(c.codeUnits);
  return '$nConcepto $d';
}

Future catalogoSAT() async {
  http.Response response = await http.get(Uri.parse(
      'https://storage.googleapis.com/phonic-formula-197423.appspot.com/visorxmlt/clavesatprod.xml'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return 'ERROR';
  }
}

Future vSAT(String uuidxml, String rfcExml, String rfcRxml, context) async {
  var s = Sesion();
  var R = await s.get('https://verificacfdi.facturaelectronica.sat.gob.mx/');
  if (s.statuscod == '200') {
    //UUID
    var uuid =
        'ctl00%24ScriptManager1=ctl00%24MainContent%24UpnlBusqueda%7Cctl00%24MainContent%24BtnBusqueda&' +
            Uri.encodeComponent('ctl00\$MainContent\$TxtUUID') +
            '=' +
            Uri.encodeComponent(uuidxml);
    //CAPCHAT
    var captxt = '&' +
        Uri.encodeComponent('ctl00\$MainContent\$TxtCaptchaNumbers') +
        '=' +
        Uri.encodeComponent('44575');
    //RFC EMISOR
    var rfcE = '&' +
        Uri.encodeComponent('ctl00\$MainContent\$TxtRfcEmisor') +
        '=' +
        Uri.encodeComponent(rfcExml);
    //RFC RECEPTOR
    var rfcR = '&' +
        Uri.encodeComponent('ctl00\$MainContent\$TxtRfcReceptor') +
        '=' +
        Uri.encodeComponent(rfcRxml);
    var viewstate = '&' +
        Uri.encodeComponent('__VIEWSTATE') +
        '=' +
        Uri.encodeComponent(
            'Lr2ynN2Qz/tMuaHcHKic7ZZzZCQk19bFd33oq6IBHmdt9WF+D2aEIb/wy9EVbuKwLrcMsGTFTmZy2o22z78svTIufZKPTNRTQvG+ubmLFfwAyEADLjvjplMjg3u5QPzpbgSF7Sz6Kxx2FbCvxQYvPrN2nUh8QoCUbWPLfg5ifT8OF9uJZ0nZW/xWGWGe55A5fxtzXvUJwPYSG+JvVLU7/e7k5SE0QBY9sEpu8b2U1Yho55vKoo+MCPI2XfPalz68i/VNfbStVqP5e3q07sGWCJ9IU79lz+Nj4W1Xg+iGkhAMlfV9XL0KviDc1wSwyD1FYN14ofuNxuSnv/URkSpBOaRu7jI3D6NGg8IQV9Qkax5T8nNW');
    var viewgeneretor = '&' +
        Uri.encodeComponent('__VIEWSTATEGENERATOR') +
        '=' +
        Uri.encodeComponent('CA0B0334');
    var viewencripted = '&' +
        Uri.encodeComponent('__VIEWSTATEENCRYPTED') +
        '=' +
        Uri.encodeComponent('');
    var etarget = '&' +
        Uri.encodeComponent('__EVENTTARGET') +
        '=' +
        '&' +
        Uri.encodeComponent('__EVENTARGUMENT') +
        '=';
    var post = uuid +
        captxt +
        rfcE +
        rfcR +
        viewstate +
        viewgeneretor +
        viewencripted +
        etarget +
        '&ctl00%24MainContent%24hdnTotal=' +
        '&ctl00%24MainContent%24hdnSello=' +
        '&__ASYNCPOST=true' +
        '&ctl00%24MainContent%24BtnBusqueda=Verificar%20CFDI';

    R = await ValidarS().post(
        'https://verificacfdi.facturaelectronica.sat.gob.mx/', post, context);

    return await R;
  }
}

// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visor_xml/pages/Ayuda.dart';
import 'package:visor_xml/pages/Validacion_web.dart';

import '../pages/page_xml.dart';

Widget Datos(BuildContext context, String titulo, Widget contenido) {
  return AlertDialog(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    alignment: Alignment.center,
    title: Text(
      titulo,
      style: const TextStyle(color: Colors.lightBlue),
      textAlign: TextAlign.center,
    ),
    content: SingleChildScrollView(child: contenido),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.black87),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    ],
  );
}

Widget MasDatos(BuildContext context) {
  return AlertDialog(
    backgroundColor: const Color.fromARGB(255, 0, 81, 115),
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    alignment: Alignment.topLeft,
    title: Image.asset('assets/ENCABEZADO.png'),
    content: SingleChildScrollView(
        child: Column(
      children: [
        Container(
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(225, 191, 206, 212)),
          child: InkWell(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Validar')],
            ),
            onTap: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const PageValidacion();
              }));
            },
          ),
        ),
        const Divider(color: Colors.transparent, height: 10),
        Container(
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(225, 191, 206, 212)),
          child: InkWell(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Estructurar')],
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const Pagexml();
              }));
            },
          ),
        ),
        const Divider(color: Colors.transparent, height: 10),
        Container(
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(225, 191, 206, 212)),
          child: InkWell(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [Text('¡Acerca de!')],
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Ayuda();
                }));
              }),
        )
      ],
    )),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent, elevation: 1),
              child: const Text('Aceptar'))
        ],
      )
    ],
  );
}

alertDialog(BuildContext context, String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.amber[700],
      textColor: Colors.white,
      fontSize: 15);
}

validateEmail(String email) {
  final emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}

validateContrasenia(String contra) {
  final contraReg = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8}$");
  return contraReg.hasMatch(contra);
}
 
  // final Uri ValidadorM = Uri.parse(
  //     'https://play.google.com/store/apps/details?id=com.kraitt.validador_qr');

// bool isInstalled =
              //     await DeviceApps.isAppInstalled('com.kraitt.validador_qr');
              // if (isInstalled == true) {
              //   Navigator.of(context).pop();
               
              // } else {
              //   launchUrl(ValidadorM);
              // }

// Future<void> openFile(context) async {
//   var file = File('${Pref.Directorio}/URL.vmk');
//   await file.writeAsString(
//       'https://verificacfdi.facturaelectronica.sat.gob.mx/default.aspx?id=AAA164F6-1C8C-4CAA-B87E-D18F47AC3DE3&re=NAMM630922GR9&rr=RNA860418NH9&tt=1044.000000&fe=QFo+SA==');
//   await OpenFile.open('${Pref.Directorio}/URL.vmk');
// }
//Pref.file
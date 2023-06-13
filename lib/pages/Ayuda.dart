// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Ayuda extends StatelessWidget {
  const Ayuda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //const Color.fromARGB(255, 0, 81, 115),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 0, 81, 115),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 35,
      ),
      body: const pagayuda(),
    );
  }
}

class pagayuda extends StatelessWidget {
  const pagayuda({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/LOGOINICIO.png'),
            const Text('''
          VISOR TRIFÁSICO MÓVIL VERSION: 1.0.0
          
          Una herramienta especial para el análisis,
          Verificación y validación de CFDI's mediante
          el archivo XML, evitando el fraude a la
          hora de acreditar documentos fiscales.
          Herramientas inteligentes, que los robots
          trabajen por ti.
          
          Agradecemos cualquier comentario para
          la mejora de la herramienta.
          Si estás interesado en distribuir
          nuestros productos puedes
          comunicarte a''', style: TextStyle(fontWeight: FontWeight.bold)),
            Image.asset(
              'assets/kraitt.png',
            ),
            const SizedBox(height: 3),
            Row(children: const [Text('Teléfonos de contacto:')]),
            InkWell(
                child: const Text(
                  "(55) 5758-5751",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  FlutterPhoneDirectCaller.callNumber('tel://5557585751');
                }),
            const SizedBox(height: 2),
            InkWell(
                child: const Text(
                  "(55) 5758-2268",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
                onTap: () async {await FlutterPhoneDirectCaller.callNumber('tel://5557582268');Navigator.of(context).pop();}),
            const SizedBox(height: 5),
            Row(children: const [Text('Correo eléctronico:')]),
            const SizedBox(height: 1),
            InkWell(
              child: const Text(
                'ventas@kraitt.net',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
              onTap: () => launchUrl(
                  Uri.parse('mailto:ventas@kraitt.net?subject=News&body=')),
              //despues de "News&body=" se puede poner un mensaje predeterminado con el cual puede empezar el correo
            ),
            const SizedBox(height: 5),
            Row(children: const [Text('Visistar nuestra página:')]),
            const SizedBox(height: 1),
            InkWell(
              child: const Text(
                'https://kraitt.net/home/',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
              onTap: () => launchUrl(Uri.parse('https://kraitt.net/home/')),
            ),
            const SizedBox(height: 10),
            const Text('''Horario de atención:
L-V de 9 a 18 horas
(Hora Centro CDMX)''',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 81, 115),
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            InkWell(
              child: const Text(
                'Aviso de privasidad términos y condiciones',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

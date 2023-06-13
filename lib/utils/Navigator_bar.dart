// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/UiProviders.dart';

//EN ESTA CLASSE SE DEFINE MIS DOS RUTAS PRINCIPALES DE NAVEGACION QUE SON LAS DE 'HOME' Y 'AYUDA' SE HACE USO DE LA DEPENDENCIA PROVIDER
class cnavigatorbar extends StatefulWidget {
  @override
  State<cnavigatorbar> createState() => _cnavigatorbarState();
}

class _cnavigatorbarState extends State<cnavigatorbar> {
  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<Uiprovider>(context);
    final currentIndex = uiprovider.selectedMenuOpt;
    return CurvedNavigationBar(
      index: currentIndex,
      height: 52,
      // buttonBackgroundColor:const Color.fromARGB(0, 234, 255, 0),
      backgroundColor: const Color.fromARGB(255, 234, 255, 0),
      color: const Color.fromARGB(255, 0, 81, 115),
      items: <Widget>[
        Image.asset('assets/ICONOAN.png', width: 40, height: 40),
        Image.asset('assets/ICONOESTRUCTURADO.png', width: 40, height: 40),
        Image.asset('assets/ICONOPDF.png', width: 40, height: 40)
      ],
      onTap: (int i) => uiprovider.selectedMenuOpt = i,
      animationCurve: Curves.ease,
      animationDuration: const Duration(seconds: 1),
    );
  }
}

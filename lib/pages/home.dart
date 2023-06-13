// ignore_for_file: use_key_in_widget_constructors, camel_case_types, import_of_legacy_library_into_null_safe, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/UiProviders.dart';
import 'package:visor_xml/pages/Estructurado.dart';
import 'package:visor_xml/pages/pdf.dart';
import 'package:visor_xml/pages/validacionPDF.dart';
import 'package:visor_xml/utils/Alertas.dart';
import 'package:visor_xml/utils/Navigator_bar.dart';
import 'package:visor_xml/utils/boton_add.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  Future<void> masDatos() {
    return showDialog<void>(
        context: context, builder: (_) => MasDatos(context));
  }

  @override
  Widget build(BuildContext context) {
    //Aqui se crea tomo el marco de la aplicacion lo que es el titulo los botones de navegacion etc dejando la parte de enmedio vacia para meter algun contenerdor con informacion
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: const Color.fromARGB(255, 0, 81, 115),
        elevation: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/ENCABEZADO.png',
          ),
        ),
        actions: [
          IconButton(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => masDatos(),
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            iconSize: 25,
          ),
        ],
      ),
      body: Stack(
        children: [
          _homebody(),
          //TODO: AGREGAR ROW SCROLEABLE PARA PODER ALMANECAR VARIOS XML EN PANTALLA Y INTERCAMBIAR.
        ],
      ),
      bottomNavigationBar: cnavigatorbar(),
      floatingActionButton: addbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

class _homebody extends StatefulWidget {
  @override
  State<_homebody> createState() => _homebodyState();
}

class _homebodyState extends State<_homebody> {
  @override
  Widget build(BuildContext context) {
    //El uiprovider nos indica en que pagina nos encontramos ya que este nos devuelve un int actualmente solo esta configurado para que sea 0 , 1 , 2
    final uiprovider = Provider.of<Uiprovider>(context);
    final currentIndex = uiprovider.selectedMenuOpt;

    switch (currentIndex) {
      // Cuando nuestro currentIndex sea 0 nos mostrara la pagina de ValidacionPDF();
      case 0:
        flutterToas('ANALISIS XML');
        return const ValidacionPDF();

      // Cuando nuestro currentIndex sea 1 nos mostrara la pagina de Estructurado();
      case 1:
        flutterToas('ESTRUCTURADO');
        return const Estructurado();

      // Cuando nuestro currentIndex sea 2 nos mostrara la pagina de GraficoPDF();
      case 2:
        flutterToas('REPRESENTACIÓN IMPRESA');
        return const GraficoPDF();

      default:
        return const ValidacionPDF();
    }
  }
}


//La funcion de flutterToas nos va a mostrar peque;os dialogos en cada pantalla en la que la mandemos a llamar, lo hay que poner el texto que quermos se muestre 
flutterToas(String text) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black38,
      fontSize: 15);
}

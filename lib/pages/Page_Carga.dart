// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, file_names, use_build_context_synchronously
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/Cargar_Comprobante.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/pages/Registro_User.dart';
import 'package:visor_xml/pages/home.dart';
import 'package:visor_xml/utils/Aut_Service.dart';
import 'package:visor_xml/utils/post.dart';

class PageCarga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Esta es la pantalla de carga principal del sitema donde se hacen las validaciones para ingresar a la app
    return Scaffold(
        body: FutureBuilder(
          //En el CheckLoginState se valida o se define a que pantalla se va a redirigir al usuario
            future: CheckLoginState(context),
            builder: (context, snapshot) {
              return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(height: 250),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text("Cargando...",
                              style:
                                  TextStyle(fontSize: 27, color: Colors.blue)),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text('estamos validando tus datos',
                              style: TextStyle(fontSize: 12)),
                        ]),
                     SizedBox(height: 270),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text('kraitt', style: TextStyle(fontSize: 17))
                        ]),
                  ]);
            }));
  }

  Future CheckLoginState(BuildContext context) async {
    
    //Validaciones generales
    await inicio(context);

    //Validacion del periodo de prueba
    final authservise = Provider.of<AutS>(context, listen: false);
    final autenticado = await authservise.periodoDprueba(context);
    
    //Este es solo una funcion para emular el tiempo de espera de una funcion asincrona -> await Future.delayed(const Duration(seconds: 3));
     
    //Una vez validado la autenticacion podemos rederigir al ussuario a la pagina principal o a crearse una cuenta
    if (autenticado == true) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => home(),
              transitionDuration: const Duration(milliseconds: 0)));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) =>  const regsitro_User(),
              transitionDuration: const Duration(milliseconds: 0)));
    }
  }
}

inicio(context) async {
  //La primera validacion que se hace es que sea el primer inicia de la aplicacion esto con el Pref.contadorAPP
  if (Pref.contadorAPP == 1) {
    final authS = Provider.of<AutS>(context);
    //Si es el primer inicio de crea la DB con los capchas para hacer la validacion en el sat
    await authS.capchat(context);
    //Esta validacion lo que hace es crear una DB con el registro del id del celular y con la fecha de descarga y fecha final de prueba
    await authS.primerInicio(context);
    Pref.contadorAPP++;
  } else {
    Pref.contadorAPP++;
  }
  //En esta validacion se comprueba si hay un archivo almacenado previamente para cargarlo con todos sus nodos/info
  if (Pref.file.isNotEmpty) {
    String cfdi = '<cfdi:Comprobante';
    cargarComprobante(Pref.file, context);
    if (Pref.file.contains(cfdi)) {
      await vSATP('cfdi\$Comprobante', 'cfdi\$Emisor', 'cfdi\$Receptor',
          'cfdi\$Complemento', 'tfd\$TimbreFiscalDigital', Pref.file);
      Pref.resSAT = await post(Pref.uuid, Pref.rfcE, Pref.rfcR, context);
    }
  }
}

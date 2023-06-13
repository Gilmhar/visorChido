import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Datos%20Peticiones/List_Cap_Providers.dart';
import 'package:visor_xml/Datos_User/List_User_Provider.dart';
import 'package:visor_xml/Moldes/DatosDe.dart';
import 'package:visor_xml/Moldes/Open_As_Default.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';
import 'package:visor_xml/Moldes/Tipo_CFDI.dart';
import 'package:visor_xml/Moldes/UiProviders.dart';
import 'package:visor_xml/pages/Estructurado.dart';
import 'package:visor_xml/pages/Page_Carga.dart';
import 'package:visor_xml/pages/home.dart';
import 'package:visor_xml/pages/pdf.dart';
import 'package:visor_xml/pages/validacionPDF.dart';
import 'package:visor_xml/utils/Aut_Service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  //qui se inisializa las preferencias almacenada previamente
  await Pref.init();

  //Aqui se obtiene el directorio local de cada dispositivo, se tiene un if por si se ejecuta en android o windows
  if (Platform.isAndroid) {
    var directorio = (await getExternalStorageDirectory())?.path;
    Pref.Directorio = directorio.toString();
  } else if (Platform.isWindows) {
    var directorio = (await getDownloadsDirectory())?.path;
    Pref.Directorio = directorio.toString();
  }

  //En el init() se corrobora que la aplicacion se abra directamnende desde otro lugar ya sea que se abra un xml desde otro plataforma.
  await init();
  
  //Aqui se inisializa la app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //TODOS LOS ChangeNotifierProvider apuntan a una clase diferente la cual ejecuta algun proceso ya sea asyncrono o no 
        ChangeNotifierProvider(create: (_) => Uiprovider()),
        ChangeNotifierProvider(create: (_) => DatosDe()),
        ChangeNotifierProvider(create: (_) => TipoCFDI()),
        ChangeNotifierProvider(create: (_) => DatosCfdi()),
        ChangeNotifierProvider(create: (_) => AutS()),
        ChangeNotifierProvider(create: (_) => PDatosListProvider()),
        ChangeNotifierProvider(create: (_) => UserListProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Visor Trifasico',
        //Aqui declaro un mapa con mis pantallas principales a las que quiero acceder 
        routes: {
          'Validacion':(_) => PageCarga(),
          'home': (_) => home(),
          'vpdf': (_) => const ValidacionPDF(),
          'estructurado': (_) => const Estructurado(),
          'pdf': (_) => const GraficoPDF()
        },
        //aqui se declara la panatlla principal
        initialRoute: 'Validacion',
      ),
    );
    
  }
}

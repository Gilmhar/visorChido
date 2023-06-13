// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:visor_xml/pages/Login_User.dart';
import 'package:visor_xml/utils/Alertas.dart';
import 'package:visor_xml/utils/Text_Form_Field.dart';

class regsitro_User extends StatelessWidget {
  const regsitro_User({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'REGISTRO',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
        toolbarHeight: 40,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Divider(),
              Text(
                'VISOR TRIFASICO de CFDI',
                style: TextStyle(fontSize: 25),
              ),
              formR(),
            ],
          ),
        ),
      )),
    );
  }
}

class formR extends StatefulWidget {
  const formR({Key? key}) : super(key: key);

  @override
  State<formR> createState() => _formRState();
}

class _formRState extends State<formR> {
  final _formKey = GlobalKey<FormState>();

  final _conName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPhone = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();

  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();

  bool _pass1 = true;
  bool _pass2 = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Transform.translate(
            offset: const Offset(0, -250),
            child: Center(
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/logo-cuadrado.png',
                          height: 80, width: 80),
                      GetTextFormfield(
                        controller: _conName,
                        hintName: 'Nombre',
                        icon: Icons.person,
                        inputType: TextInputType.name,
                        autofocus: true,
                        focus: focus1,
                        maxl: 150,
                      ),
                      GetTextFormfield(
                        controller: _conEmail,
                        hintName: 'E-mail',
                        icon: Icons.email,
                        inputType: TextInputType.emailAddress,
                        autofocus: false,
                        focusnode: focus1,
                        focus: focus2,
                        maxl: 150,
                      ),
                      GetTextFormfield(
                        controller: _conPhone,
                        hintName: 'Teléfono',
                        icon: Icons.phone,
                        inputType: TextInputType.phone,
                        autofocus: false,
                        focusnode: focus2,
                        focus: focus3,
                        maxl: 10,
                      ),
                      GetTextFormfield(
                        controller: _conPassword,
                        hintName: 'Contraseña',
                        icon: _pass1 ? Icons.visibility_off : Icons.visibility,
                        isObscureText: _pass1,
                        onp: () {
                          setState(() {
                            _pass1 = !_pass1;
                          });
                        },
                        autofocus: false,
                        focusnode: focus3,
                        focus: focus4,
                        maxl: 8,
                      ),
                      GetTextFormfield(
                        controller: _conCPassword,
                        hintName: 'Confirma tu contraseña',
                        icon: _pass2 ? Icons.visibility_off : Icons.visibility,
                        isObscureText: _pass2,
                        onp: () {
                          setState(() {
                            _pass2 = !_pass2;
                          });
                        },
                        autofocus: false,
                        focusnode: focus4,
                        maxl: 8,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.cyan,
                            padding: const EdgeInsets.all(20)),
                        onPressed: () {
                          register(
                              _conName.text,
                              _conEmail.text,
                              _conPhone.text,
                              _conPassword.text,
                              _conCPassword.text,
                              context,
                              _formKey);
                        },
                        child: const Text(
                          'Crear Usuario',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('¿Ya estás regitrado?'),
                          TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.amber[700]),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginPage()),
                                    (Route<dynamic> route) => false);
                              },
                              child: const Text('Inicia Sesión'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////
Future register(String unombre, String uemail, String uphone, String upassword,
    String ucpassword, context, _formKey) async {
  if (_formKey.currentState!.validate()) {
    if (upassword != ucpassword) {
      alertDialog(context, "Las contraseñas no coinciden");
    } else {
      _formKey.currentState?.save();
      var url = Uri.parse(
          "https://8250-189-234-128-42.ngrok-free.app/visorusers/registro.php");
      var response = await http.post(url, body: {
        "nombre": unombre,
        "correo": uemail,
        "celular": uphone,
        "contrasenia": upassword,
      });

      if (response.body.isNotEmpty) {
        var data = json.decode(response.body);

        if (data['error'] == 'Error') {
          alertDialog(context, "El usuario ya existe.");
        } else {
          alertDialog(context, "¡Usuario creado!");
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => const LoginPage()));
        }
      } else {
        alertDialog(context, "No se pudo realizar el registro");
      }
    }
  } else {
    alertDialog(context, "Hay errores en sus datos");
  }
}

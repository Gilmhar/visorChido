// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:visor_xml/utils/Alertas.dart';

class GetTextFormfield extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType;
  bool autofocus;
  FocusNode? focusnode;
  FocusNode? focus;
  int maxl;
  Function()? onp;

  GetTextFormfield(
      {Key? key,
      required this.controller,
      required this.hintName,
      required this.icon,
      this.isObscureText = false,
      this.inputType = TextInputType.text,
      required this.autofocus,
      this.focusnode,
      this.focus,
      required this.maxl,
      this.onp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingresa $hintName.';
          } else if (hintName == "E-mail" && !validateEmail(value)) {
            return 'Por favor ingresa un email válido.';
          } else if (hintName == "Contraseña" && !validateContrasenia(value)) {
            return '''Contraseña no valida. Debe contener:
              8 caracteres
              Al menos 1 mayúscula
              Al menos 1 minúscula
              Al menos un número
              Un caracter especial 
            ''';
          }
          return null;
        },

        autofocus: autofocus,
        focusNode: focusnode,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(focus);
        },
        maxLength: maxl,
        // onSaved: (newValue) => controller.text = newValue!,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.cyan),
          ),
          counter: const Offstage(),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.amber)),
          prefixIcon: IconButton(
            onPressed: onp,
            icon: Icon(icon),
            splashColor: Colors.transparent,
          ),
          hintText: hintName,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

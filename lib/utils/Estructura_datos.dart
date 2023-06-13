// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';

styleT(String t1, String t2) {
  return RichText(
    text: TextSpan(
        text: t1,
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(text: t2, style: const TextStyle(color: Colors.blue))
        ]),
  );
}

B1(BuildContext context, String t, Function() op) {
  return InkWell(
    child: Container(
      color: const Color.fromARGB(141, 255, 214, 64),
      width: MediaQuery.of(context).size.width,
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(t, style: const TextStyle(fontSize: 20)),
          const Icon(Icons.arrow_drop_down_rounded)
        ],
      ),
    ),
    onTap: op,
  );
}

B2(BuildContext context, String t, Function() op) {
  return InkWell(
    child: Container(
      color: const Color.fromARGB(255, 185, 194, 199),
      width: MediaQuery.of(context).size.width,
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(t, style: const TextStyle(fontSize: 20)),
          const Icon(Icons.arrow_drop_down_rounded)
        ],
      ),
    ),
    onTap: op,
  );
}

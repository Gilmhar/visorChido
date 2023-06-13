// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class EstructuraC extends StatelessWidget {
  double i;
  double ii;
  String imagen1;
  String text;
  Function() ontap;
  EstructuraC(
      {Key? key,
      required this.i,
      required this.ii,
      required this.imagen1,
      required this.text,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(i), topRight: Radius.circular(ii)),
            color: const Color.fromARGB(225, 191, 206, 212),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset(imagen1, width: 40, height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 0, 81, 115),
              ),
            )
          ]),
        ),
        onTap: ontap);
  }
}

class EstructuraD extends StatelessWidget {
  double i;
  double ii;
  String imagen2;
  Function() ontap;
  EstructuraD(
      {Key? key,
      required this.i,
      required this.ii,
      required this.imagen2,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(i), topRight: Radius.circular(ii)),
            color: const Color.fromARGB(225, 191, 206, 212),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset('assets/ICONONODO.png', width: 30, height: 30),
            Image.asset(imagen2, width: 200),
          ]),
        ),
        onTap: ontap);
  }
}

heads(context, String text, double L, double R) {
  return Container(
      margin: EdgeInsets.only(left: L, right: R),
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(224, 198, 232, 245),
      child: Row(
        children: [
          const Icon(
            Icons.folder,
            size: 15,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Text(text)
        ],
      ));
}

name(String s, String dato, context) {
  return dato == ''
      ? Container()
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 2, 202, 106)),
                ),
                const SizedBox(width: 5),
                Text(s)
              ],
            ),
            SingleChildScrollView(
              scrollDirection:
                  dato.length > MediaQuery.of(context).size.width / 12
                      ? Axis.horizontal
                      : Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(dato)],
              ),
            ),
            const Divider(
                height: 10, color: Color.fromARGB(225, 191, 206, 212)),
          ],
        );
}

dataC(String n, String conceptosL, context) {
  return conceptosL == ''
      ? Container()
      : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(255, 2, 202, 106)),
                    ),
                    const SizedBox(width: 5),
                    Text(n)
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection:
                      conceptosL.length > MediaQuery.of(context).size.width / 12
                          ? Axis.horizontal
                          : Axis.vertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text(conceptosL)],
                  ),
                ),
                const Divider(
                    color: Color.fromARGB(224, 198, 232, 245), height: 2),
              ],
            )
          ],
        );
}

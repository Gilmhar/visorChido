// ignore_for_file: file_names

import 'package:intl/intl.dart';

final hora = DateFormat.jms()
    .format(DateTime.now())
    .replaceAll('PM', '')
    .replaceAll('AM', '')
    .replaceAll(' ', '');

final ymd = DateFormat('yyyy-MM-dd');
final dmy = DateFormat('dd/MM/yyyy');

dateYMD() {
  final fecha = ymd.format(DateTime.now());
  return '${fecha}T$hora';
}

dateDMY() {
  final fecha = dmy.format(DateTime.now());
  return fecha;
}

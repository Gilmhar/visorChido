// ignore_for_file: file_names

class Usuario {
  //Este es un mapa con todos los datos que se esperan recibir para la DB, se declaran como requeridos para que no los omitas
  int? id;
  String idcelular;
  String nombre;
  String celular;
  String correo;
  String contra;
  String fechaDescarga;
  String fechaFinalPruena;
  String pruebaOPago;
  String fechaPago;

  Usuario(
      {required this.id,
      required this.idcelular,
      required this.nombre,
      required this.celular,
      required this.correo,
      required this.contra,
      required this.fechaDescarga,
      required this.fechaFinalPruena,
      required this.pruebaOPago,
      required this.fechaPago});

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json['id'],
      idcelular: json['idcelular'],
      nombre: json['nombre'],
      celular: json['celular'],
      correo: json['correo'],
      contra: json['contra'],
      fechaDescarga: json['fechaDescarga'],
      fechaFinalPruena: json['fechaFinalPruena'],
      pruebaOPago: json['pruebaOPago'],
      fechaPago: json['fechaPago']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'idcelular': idcelular,
        'nombre': nombre,
        'celular': celular,
        'correo': correo,
        'contra': contra,
        'fechaDescarga': fechaDescarga,
        'fechaFinalPruena': fechaFinalPruena,
        'pruebaOPago': pruebaOPago,
        'fechaPago': fechaPago
      };
}
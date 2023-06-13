
// ignore_for_file: file_names

class PaqueteDatos {
   int? id;
   String identificador;
   String cap;
   String res;

   PaqueteDatos(
      { required this.id,
      required this.identificador,
      required this.cap,
      required this.res});

  factory PaqueteDatos.fromJson(Map<String, dynamic> json) => PaqueteDatos(
      id: json['id'],
      identificador: json['identificador'],
      cap: json['cap'],
      res: json['res']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'identificador': identificador,
    'cap': cap,
    'res': res
  };    
}

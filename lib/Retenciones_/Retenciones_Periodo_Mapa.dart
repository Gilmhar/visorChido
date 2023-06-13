
// ignore_for_file: file_names

import 'dart:convert';

RetencionesPeriodo retencionesPeriodoFromJson(String str) => RetencionesPeriodo.fromJson(json.decode(str));

String retencionesPeriodoToJson(RetencionesPeriodo data) => json.encode(data.toJson());

class RetencionesPeriodo {
    RetencionesPeriodo({
        required this.retencionesPeriodo,
    });

    RetencionesPeriodoClass retencionesPeriodo;

    factory RetencionesPeriodo.fromJson(Map<String, dynamic> json) => RetencionesPeriodo(
        retencionesPeriodo: RetencionesPeriodoClass.fromJson(json["retenciones\u0024Periodo"]),
    );

    Map<String, dynamic> toJson() => {
        "retenciones\u0024Periodo": retencionesPeriodo.toJson(),
    };
}

class RetencionesPeriodoClass {
    RetencionesPeriodoClass({
        required this.mesIni,
        required this.mesFin,
        required this.ejerc,
    });

    String mesIni;
    String mesFin;
    String ejerc;

    factory RetencionesPeriodoClass.fromJson(Map<String, dynamic> json) => RetencionesPeriodoClass(
        mesIni: json["MesIni"],
        mesFin: json["MesFin"],
        ejerc: json["Ejerc"],
    );

    Map<String, dynamic> toJson() => {
        "MesIni": mesIni,
        "MesFin": mesFin,
        "Ejerc": ejerc,
    };
}

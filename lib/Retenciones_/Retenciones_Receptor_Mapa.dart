
// ignore_for_file: file_names

import 'dart:convert';

RetencionesReceptor retencionesReceptorFromJson(String str) => RetencionesReceptor.fromJson(json.decode(str));

String retencionesReceptorToJson(RetencionesReceptor data) => json.encode(data.toJson());

class RetencionesReceptor {
    RetencionesReceptor({
        required this.retencionesReceptor,
    });

    RetencionesReceptorClass retencionesReceptor;

    factory RetencionesReceptor.fromJson(Map<String, dynamic> json) => RetencionesReceptor(
        retencionesReceptor: RetencionesReceptorClass.fromJson(json["retenciones\u0024Receptor"]),
    );

    Map<String, dynamic> toJson() => {
        "retenciones\u0024Receptor": retencionesReceptor.toJson(),
    };
}

class RetencionesReceptorClass {
    RetencionesReceptorClass({
        required this.nacionalidad,
        required this.retencionesNacional,
    });

    String nacionalidad;
    RetencionesNacional retencionesNacional;

    factory RetencionesReceptorClass.fromJson(Map<String, dynamic> json) => RetencionesReceptorClass(
        nacionalidad: json["Nacionalidad"],
        retencionesNacional: RetencionesNacional.fromJson(json["retenciones\u0024Nacional"]),
    );

    Map<String, dynamic> toJson() => {
        "Nacionalidad": nacionalidad,
        "retenciones\u0024Nacional": retencionesNacional.toJson(),
    };
}

class RetencionesNacional {
    RetencionesNacional({
        required this.rfcRecep,
        required this.nomDenRazSocR,
    });

    String rfcRecep;
    String nomDenRazSocR;

    factory RetencionesNacional.fromJson(Map<String, dynamic> json) => RetencionesNacional(
        rfcRecep: json["RFCRecep"],
        nomDenRazSocR: json["NomDenRazSocR"],
    );

    Map<String, dynamic> toJson() => {
        "RFCRecep": rfcRecep,
        "NomDenRazSocR": nomDenRazSocR,
    };
}

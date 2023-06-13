
// ignore_for_file: file_names

import 'dart:convert';

RetencionesEmisor retencionesEmisorFromJson(String str) => RetencionesEmisor.fromJson(json.decode(str));

String retencionesEmisorToJson(RetencionesEmisor data) => json.encode(data.toJson());

class RetencionesEmisor {
    RetencionesEmisor({
        required this.retencionesEmisor,
    });

    RetencionesEmisorClass retencionesEmisor;

    factory RetencionesEmisor.fromJson(Map<String, dynamic> json) => RetencionesEmisor(
        retencionesEmisor: RetencionesEmisorClass.fromJson(json["retenciones\u0024Emisor"]),
    );

    Map<String, dynamic> toJson() => {
        "retenciones\u0024Emisor": retencionesEmisor.toJson(),
    };
}

class RetencionesEmisorClass {
    RetencionesEmisorClass({
        required this.rfcEmisor,
        required this.nomDenRazSocE,
    });

    String rfcEmisor;
    String nomDenRazSocE;

    factory RetencionesEmisorClass.fromJson(Map<String, dynamic> json) => RetencionesEmisorClass(
        rfcEmisor: json["RFCEmisor"],
        nomDenRazSocE: json["NomDenRazSocE"],
    );

    Map<String, dynamic> toJson() => {
        "RFCEmisor": rfcEmisor,
        "NomDenRazSocE": nomDenRazSocE,
    };
}

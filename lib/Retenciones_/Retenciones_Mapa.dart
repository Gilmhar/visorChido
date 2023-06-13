
// ignore_for_file: file_names

import 'dart:convert';

Reternciones reterncionesFromJson(String str) => Reternciones.fromJson(json.decode(str));

String reterncionesToJson(Reternciones data) => json.encode(data.toJson());

class Reternciones {
    Reternciones({
        required this.retencionesRetenciones,
    });

    RetencionesRetenciones retencionesRetenciones;

    factory Reternciones.fromJson(Map<String, dynamic> json) => Reternciones(
        retencionesRetenciones: RetencionesRetenciones.fromJson(json["retenciones\u0024Retenciones"]),
    );

    Map<String, dynamic> toJson() => {
        "retenciones\u0024Retenciones": retencionesRetenciones.toJson(),
    };
}

class RetencionesRetenciones {
    RetencionesRetenciones({
        required this.xsiSchemaLocation,
        required this.version,
        required this.folioInt,
        required this.sello,
        required this.numCert,
        required this.cert,
        required this.fechaExp,
        required this.cveRetenc,
        required this.xmlns,
        required this.xmlnsRetenciones,
        required this.xmlnsXsi,
        required this.xmlnsIntereses,
    });

    String xsiSchemaLocation;
    String version;
    String folioInt;
    String sello;
    String numCert;
    String cert;
    DateTime fechaExp;
    String cveRetenc;
    List<Xmln> xmlns;
    String xmlnsRetenciones;
    String xmlnsXsi;
    String xmlnsIntereses;

    factory RetencionesRetenciones.fromJson(Map<String, dynamic> json) => RetencionesRetenciones(
        xsiSchemaLocation: json["xsi:schemaLocation"],
        version: json["Version"],
        folioInt: json["FolioInt"],
        sello: json["Sello"],
        numCert: json["NumCert"],
        cert: json["Cert"],
        fechaExp: DateTime.parse(json["FechaExp"]),
        cveRetenc: json["CveRetenc"],
        xmlns: List<Xmln>.from(json["xmlns"].map((x) => Xmln.fromJson(x))),
        xmlnsRetenciones: json["xmlns\u0024retenciones"],
        xmlnsXsi: json["xmlns\u0024xsi"],
        xmlnsIntereses: json["xmlns\u0024intereses"],
    );

    Map<String, dynamic> toJson() => {
        "xsi:schemaLocation": xsiSchemaLocation,
        "Version": version,
        "FolioInt": folioInt,
        "Sello": sello,
        "NumCert": numCert,
        "Cert": cert,
        "FechaExp": fechaExp.toIso8601String(),
        "CveRetenc": cveRetenc,
        "xmlns": List<dynamic>.from(xmlns.map((x) => x.toJson())),
        "xmlns\u0024retenciones": xmlnsRetenciones,
        "xmlns\u0024xsi": xmlnsXsi,
        "xmlns\u0024intereses": xmlnsIntereses,
    };
}

class Xmln {
    Xmln();

    factory Xmln.fromJson(Map<String, dynamic> json) => Xmln(
    );

    Map<String, dynamic> toJson() => {
    };
}

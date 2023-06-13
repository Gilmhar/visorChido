
// ignore_for_file: file_names

import 'dart:convert';

RetencionesTotales retencionesTotalesFromJson(String str) => RetencionesTotales.fromJson(json.decode(str));

String retencionesTotalesToJson(RetencionesTotales data) => json.encode(data.toJson());

class RetencionesTotales {
    RetencionesTotales({
        required this.retencionesTotales,
    });

    RetencionesTotalesClass retencionesTotales;

    factory RetencionesTotales.fromJson(Map<String, dynamic> json) => RetencionesTotales(
        retencionesTotales: RetencionesTotalesClass.fromJson(json["retenciones\u0024Totales"]),
    );

    Map<String, dynamic> toJson() => {
        "retenciones\u0024Totales": retencionesTotales.toJson(),
    };
}

class RetencionesTotalesClass {
    RetencionesTotalesClass({
        required this.montoTotOperacion,
        required this.montoTotGrav,
        required this.montoTotExent,
        required this.montoTotRet,
        required this.retencionesImpRetenidos,
    });

    String montoTotOperacion;
    String montoTotGrav;
    String montoTotExent;
    String montoTotRet;
    List<RetencionesImpRetenido> retencionesImpRetenidos;

    factory RetencionesTotalesClass.fromJson(Map<String, dynamic> json) => RetencionesTotalesClass(
        montoTotOperacion: json["montoTotOperacion"],
        montoTotGrav: json["montoTotGrav"],
        montoTotExent: json["montoTotExent"],
        montoTotRet: json["montoTotRet"],
        retencionesImpRetenidos: List<RetencionesImpRetenido>.from(json["retenciones\u0024ImpRetenidos"].map((x) => RetencionesImpRetenido.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "montoTotOperacion": montoTotOperacion,
        "montoTotGrav": montoTotGrav,
        "montoTotExent": montoTotExent,
        "montoTotRet": montoTotRet,
        "retenciones\u0024ImpRetenidos": List<dynamic>.from(retencionesImpRetenidos.map((x) => x.toJson())),
    };
}

class RetencionesImpRetenido {
    RetencionesImpRetenido({
        required this.baseRet,
        required this.impuesto,
        required this.montoRet,
        required this.tipoPagoRet,
    });

    String baseRet;
    String impuesto;
    String montoRet;
    String tipoPagoRet;

    factory RetencionesImpRetenido.fromJson(Map<String, dynamic> json) => RetencionesImpRetenido(
        baseRet: json["BaseRet"],
        impuesto: json["Impuesto"],
        montoRet: json["montoRet"],
        tipoPagoRet: json["TipoPagoRet"],
    );

    Map<String, dynamic> toJson() => {
        "BaseRet": baseRet,
        "Impuesto": impuesto,
        "montoRet": montoRet,
        "TipoPagoRet": tipoPagoRet,
    };
}

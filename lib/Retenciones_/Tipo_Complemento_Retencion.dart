// To parse this JSON data, do
// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

CFDIR? TipoRetencionesFromJson(String str, String cualComplemento) => CFDIR.fromJson(json.decode(str),cualComplemento);

String TipoRetencionesToJson(CFDIR? data) => json.encode(data!.toJson());


class CFDIR {
    CFDIR({
        this.retencionesComplemento,
    
    });

    TipoRetencionesComplemento? retencionesComplemento;
  

    factory CFDIR.fromJson(Map<String, dynamic> json, String STR) => CFDIR(
        retencionesComplemento: TipoRetencionesComplemento.fromJson(json["retenciones\u0024Complemento"],STR),

    );

    Map<String, dynamic> toJson() => {
        "retenciones\u0024Complemento": retencionesComplemento!.toJson(),
    };
}

class TipoRetencionesComplemento {
    TipoRetencionesComplemento({

   
        this.arrendamientoenfideicomisoArrendamientoenfideicomiso,
        this.dividendosDividendos,
        this.enajenaciondeaccionesEnajenaciondeAcciones,
        this.fideicomisonoempresarialFideicomisonoempresarial,
        this.interesesIntereses,
        this.intereseshipotecariosIntereseshipotecarios,
        this.operacionesconderivadosOperacionesconderivados,
        this.pagosaextranjerosPagosaextranjeros,
        this.planesderetiroPlanesderetiro,
        this.premiosPremios,
        this.sectorfinancieroSectorFinanciero,
        this.plataformasTecnologicasServiciosPlataformasTecnologicas,
    });

    ArrendamientoenfideicomisoArrendamientoenfideicomiso? arrendamientoenfideicomisoArrendamientoenfideicomiso;
    DividendosDividendos? dividendosDividendos;
    EnajenaciondeaccionesEnajenaciondeAcciones? enajenaciondeaccionesEnajenaciondeAcciones;
    FideicomisonoempresarialFideicomisonoempresarial? fideicomisonoempresarialFideicomisonoempresarial;
    InteresesIntereses? interesesIntereses;
    IntereseshipotecariosIntereseshipotecarios? intereseshipotecariosIntereseshipotecarios;
    OperacionesconderivadosOperacionesconderivados? operacionesconderivadosOperacionesconderivados;
    PagosaextranjerosPagosaextranjeros? pagosaextranjerosPagosaextranjeros;
    PlanesderetiroPlanesderetiro? planesderetiroPlanesderetiro;
    PremiosPremios? premiosPremios;
    SectorfinancieroSectorFinanciero? sectorfinancieroSectorFinanciero;
    PlataformasTecnologicasServiciosPlataformasTecnologicas? plataformasTecnologicasServiciosPlataformasTecnologicas;
    
    
    factory TipoRetencionesComplemento.fromJson(Map<String, dynamic> json,String cual) =>
   cual == 'arrendamientoenfideicomiso' ? TipoRetencionesComplemento(arrendamientoenfideicomisoArrendamientoenfideicomiso: ArrendamientoenfideicomisoArrendamientoenfideicomiso.fromJson(json["arrendamientoenfideicomiso\u0024Arrendamientoenfideicomiso"]),) : 
   cual == 'dividendos' ? TipoRetencionesComplemento(dividendosDividendos: DividendosDividendos.fromJson(json["dividendos\u0024Dividendos"]),) :
   cual == 'enajenaciondeacciones' ? TipoRetencionesComplemento(enajenaciondeaccionesEnajenaciondeAcciones: EnajenaciondeaccionesEnajenaciondeAcciones.fromJson(json["enajenaciondeacciones\u0024EnajenaciondeAcciones"]),) : 
   cual == 'fideicomisonoempresarial' ? TipoRetencionesComplemento(fideicomisonoempresarialFideicomisonoempresarial: FideicomisonoempresarialFideicomisonoempresarial.fromJson(json["fideicomisonoempresarial\u0024Fideicomisonoempresarial"]),) : 
   cual == 'intereses:Intereses' ? TipoRetencionesComplemento(interesesIntereses: InteresesIntereses.fromJson(json["intereses\u0024Intereses"]),) : 
   cual == 'intereseshipotecarios' ? TipoRetencionesComplemento(intereseshipotecariosIntereseshipotecarios: IntereseshipotecariosIntereseshipotecarios.fromJson(json["intereseshipotecarios\u0024Intereseshipotecarios"]),) : 
   cual == 'operacionesconderivados' ? TipoRetencionesComplemento(operacionesconderivadosOperacionesconderivados: OperacionesconderivadosOperacionesconderivados.fromJson(json["operacionesconderivados\u0024Operacionesconderivados"]),) : 
   cual == 'pagosaextranjeros' ? TipoRetencionesComplemento(pagosaextranjerosPagosaextranjeros: PagosaextranjerosPagosaextranjeros.fromJson(json["pagosaextranjeros\u0024Pagosaextranjeros"]),) : 
   cual == 'planesderetiro' ? TipoRetencionesComplemento(planesderetiroPlanesderetiro: PlanesderetiroPlanesderetiro.fromJson(json["planesderetiro\u0024Planesderetiro"]),) : 
   cual == 'premios' ? TipoRetencionesComplemento(premiosPremios: PremiosPremios.fromJson(json["premios\u0024Premios"]),) : 
   cual == 'sectorfinanciero' ? TipoRetencionesComplemento(sectorfinancieroSectorFinanciero: SectorfinancieroSectorFinanciero.fromJson(json["sectorfinanciero\u0024SectorFinanciero"]),) : 
   cual == 'plataformasTecnologicas' ? TipoRetencionesComplemento(plataformasTecnologicasServiciosPlataformasTecnologicas: PlataformasTecnologicasServiciosPlataformasTecnologicas.fromJson(json["plataformasTecnologicas\u0024ServiciosPlataformasTecnologicas"]),) :
    TipoRetencionesComplemento() ;

    Map<String, dynamic> toJson() => {
        "arrendamientoenfideicomiso\u0024Arrendamientoenfideicomiso": arrendamientoenfideicomisoArrendamientoenfideicomiso!.toJson(),
        "dividendos\u0024Dividendos": dividendosDividendos!.toJson(),
        "enajenaciondeacciones\u0024EnajenaciondeAcciones": enajenaciondeaccionesEnajenaciondeAcciones!.toJson(),
        "fideicomisonoempresarial\u0024Fideicomisonoempresarial": fideicomisonoempresarialFideicomisonoempresarial!.toJson(),
        "intereses\u0024Intereses": interesesIntereses!.toJson(),
        "intereseshipotecarios\u0024Intereseshipotecarios": intereseshipotecariosIntereseshipotecarios!.toJson(),
        "operacionesconderivados\u0024Operacionesconderivados": operacionesconderivadosOperacionesconderivados!.toJson(),
        "pagosaextranjeros\u0024Pagosaextranjeros": pagosaextranjerosPagosaextranjeros!.toJson(),
        "planesderetiro\u0024Planesderetiro": planesderetiroPlanesderetiro!.toJson(),
        "premios\u0024Premios": premiosPremios!.toJson(),
        "sectorfinanciero\u0024SectorFinanciero": sectorfinancieroSectorFinanciero!.toJson(),
        "plataformasTecnologicas\u0024ServiciosPlataformasTecnologicas": plataformasTecnologicasServiciosPlataformasTecnologicas!.toJson(),
    };
}
//#Region Complemento Arrendamiento en Fideicomiso
class ArrendamientoenfideicomisoArrendamientoenfideicomiso {
   //var nueva =  c_dividendos();
    ArrendamientoenfideicomisoArrendamientoenfideicomiso({
        // nueva.version_,
        this.version,
        this.pagProvEfecPorFiduc,
        this.rendimFideicom,
        this.deduccCorresp,
        this.montTotRet,
        //this.nuevaaaaaa,
        

    });
   
    String? version;
    String? pagProvEfecPorFiduc;
    String? rendimFideicom;
    String? deduccCorresp;
    String? montTotRet;
    //c_dividendos? nuevaaaaaa;

    factory ArrendamientoenfideicomisoArrendamientoenfideicomiso.fromJson(Map<String, dynamic> json) => ArrendamientoenfideicomisoArrendamientoenfideicomiso(
       
        version : json["Version"],
        //nuevaaaaaa: json["Version"],
        pagProvEfecPorFiduc: json["PagProvEfecPorFiduc"],
        rendimFideicom: json["RendimFideicom"],
        deduccCorresp: json["DeduccCorresp"],
        montTotRet: json["MontTotRet"],
    );
 
    Map<String, dynamic> toJson() => {
     
        "Version": version,
        "PagProvEfecPorFiduc": pagProvEfecPorFiduc,
        "RendimFideicom": rendimFideicom,
        "DeduccCorresp": deduccCorresp,
        "MontTotRet": montTotRet,      
    };
}
//EndRegion

//#Region Complemento Dividendos
class DividendosDividendos {

    DividendosDividendos({  
         
        this.version,  
        this.dividendosDividOUtil,
    });

    String? version;
    DividendosDividOUtil? dividendosDividOUtil;

    factory DividendosDividendos.fromJson(Map<String, dynamic> json) => DividendosDividendos(
        version: json["Version"],
        dividendosDividOUtil: DividendosDividOUtil.fromJson(json["dividendos\u0024DividOUtil"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "dividendos\u0024DividOUtil": dividendosDividOUtil!.toJson(),
    };

    
}
class DividendosDividOUtil {
    DividendosDividOUtil({
        this.cveTipDivOUtil,
        this.montIsrAcredRetMexico,
        this.montIsrAcredRetExtranjero,
        this.tipoSocDistrDiv,    
//para versión 1.0_2
        this.montRetExtDivExt,
        this.montDivAcumExt,
//para verison 1.0
        this.montDivAcumNal,
        this.montIsrAcredNal,
    });
    
    String? cveTipDivOUtil;  
    String? montIsrAcredRetMexico;
    String? montIsrAcredRetExtranjero;
    String? tipoSocDistrDiv;
//para versión 1.0_2
    String? montRetExtDivExt;
    String? montDivAcumExt;
//para verison 1.0
    String? montDivAcumNal;
    String? montIsrAcredNal;

    factory DividendosDividOUtil.fromJson(Map<String, dynamic> json) => DividendosDividOUtil(
        cveTipDivOUtil: json["CveTipDivOUtil"],
        montIsrAcredRetMexico: json["MontISRAcredRetMexico"],
        montIsrAcredRetExtranjero: json["MontISRAcredRetExtranjero"],
        tipoSocDistrDiv: json["TipoSocDistrDiv"],
//para versión 1.0_2
        montRetExtDivExt: json["MontRetExtDivExt"],
        montDivAcumExt: json["MontDivAcumExt"],
 //para verison 1.0       
        montDivAcumNal: json["MontDivAcumNal"],
        montIsrAcredNal: json["MontISRAcredNal"],
    );

    Map<String, dynamic> toJson() => {
        "CveTipDivOUtil": cveTipDivOUtil,
        "MontISRAcredRetMexico": montIsrAcredRetMexico,
        "MontISRAcredRetExtranjero": montIsrAcredRetExtranjero,
        "TipoSocDistrDiv": tipoSocDistrDiv,
//para versión 1.0_2
        "MontRetExtDivExt": montRetExtDivExt,
        "MontDivAcumExt": montDivAcumExt,
 //para verison 1.0       
        "MontDivAcumNal": montDivAcumNal,
        "MontISRAcredNal": montIsrAcredNal,
    };
}
//#EndRegion

//#RegionComplemento Enajenacion de Acciones
class EnajenaciondeaccionesEnajenaciondeAcciones {
    EnajenaciondeaccionesEnajenaciondeAcciones({
        this.version,
        this.contratoIntermediacion,
        this.ganancia,
        this.perdida,
    });

    String? version;
    String? contratoIntermediacion;
    String? ganancia;
    String? perdida;

    factory EnajenaciondeaccionesEnajenaciondeAcciones.fromJson(Map<String, dynamic> json) => EnajenaciondeaccionesEnajenaciondeAcciones(
        version: json["Version"],
        contratoIntermediacion: json["ContratoIntermediacion"],
        ganancia: json["Ganancia"],
        perdida: json["Perdida"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "ContratoIntermediacion": contratoIntermediacion,
        "Ganancia": ganancia,
        "Perdida": perdida,
    };
}
//EndRegion

//#Region Complemento Fideicomiso no Empresarial
class FideicomisonoempresarialFideicomisonoempresarial {
    FideicomisonoempresarialFideicomisonoempresarial({
        this.version,
        this.fideicomisonoempresarialIngresosOEntradas,
        this.fideicomisonoempresarialDeduccOSalidas,
        this.fideicomisonoempresarialRetEfectFideicomiso,
    });

    String? version;
    FideicomisonoempresarialIngresosOEntradas? fideicomisonoempresarialIngresosOEntradas;
    FideicomisonoempresarialDeduccOSalidas? fideicomisonoempresarialDeduccOSalidas;
    FideicomisonoempresarialRetEfectFideicomiso? fideicomisonoempresarialRetEfectFideicomiso;

    factory FideicomisonoempresarialFideicomisonoempresarial.fromJson(Map<String, dynamic> json) => FideicomisonoempresarialFideicomisonoempresarial(
        version: json["Version"],
        fideicomisonoempresarialIngresosOEntradas: FideicomisonoempresarialIngresosOEntradas.fromJson(json["fideicomisonoempresarial\u0024IngresosOEntradas"]),
        fideicomisonoempresarialDeduccOSalidas: FideicomisonoempresarialDeduccOSalidas.fromJson(json["fideicomisonoempresarial\u0024DeduccOSalidas"]),
        fideicomisonoempresarialRetEfectFideicomiso: FideicomisonoempresarialRetEfectFideicomiso.fromJson(json["fideicomisonoempresarial\u0024RetEfectFideicomiso"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "fideicomisonoempresarial\u0024IngresosOEntradas": fideicomisonoempresarialIngresosOEntradas!.toJson(),
        "fideicomisonoempresarial\u0024DeduccOSalidas": fideicomisonoempresarialDeduccOSalidas!.toJson(),
        "fideicomisonoempresarial\u0024RetEfectFideicomiso": fideicomisonoempresarialRetEfectFideicomiso!.toJson(),
    };
}
class FideicomisonoempresarialDeduccOSalidas {
    FideicomisonoempresarialDeduccOSalidas({
        this.montTotEgresPeriodo,
        this.partPropDelFideicom,
        this.propDelMontTot,
        this.fideicomisonoempresarialIntegracEgresos,
    });

    String? montTotEgresPeriodo;
    String? partPropDelFideicom;
    String? propDelMontTot;
    FideicomisonoempresarialIntegracEgresos? fideicomisonoempresarialIntegracEgresos;

    factory FideicomisonoempresarialDeduccOSalidas.fromJson(Map<String, dynamic> json) => FideicomisonoempresarialDeduccOSalidas(
        montTotEgresPeriodo: json["MontTotEgresPeriodo"],
        partPropDelFideicom: json["PartPropDelFideicom"],
        propDelMontTot: json["PropDelMontTot"],
        fideicomisonoempresarialIntegracEgresos: FideicomisonoempresarialIntegracEgresos.fromJson(json["fideicomisonoempresarial\u0024IntegracEgresos"]),
    );

    Map<String, dynamic> toJson() => {
        "MontTotEgresPeriodo": montTotEgresPeriodo,
        "PartPropDelFideicom": partPropDelFideicom,
        "PropDelMontTot": propDelMontTot,
        "fideicomisonoempresarial\u0024IntegracEgresos": fideicomisonoempresarialIntegracEgresos!.toJson(),
    };
}
class FideicomisonoempresarialIntegracEgresos {
    FideicomisonoempresarialIntegracEgresos({
        this.conceptoS,
    });

    String? conceptoS;

    factory FideicomisonoempresarialIntegracEgresos.fromJson(Map<String, dynamic> json) => FideicomisonoempresarialIntegracEgresos(
        conceptoS: json["ConceptoS"],
    );

    Map<String, dynamic> toJson() => {
        "ConceptoS": conceptoS,
    };
}
class FideicomisonoempresarialIngresosOEntradas {
    FideicomisonoempresarialIngresosOEntradas({
        this.montTotEntradasPeriodo,
        this.partPropAcumDelFideicom,
        this.propDelMontTot,
        this.fideicomisonoempresarialIntegracIngresos,
    });

    String? montTotEntradasPeriodo;
    String? partPropAcumDelFideicom;
    String? propDelMontTot;
    FideicomisonoempresarialIntegracIngresos? fideicomisonoempresarialIntegracIngresos;

    factory FideicomisonoempresarialIngresosOEntradas.fromJson(Map<String, dynamic> json) => FideicomisonoempresarialIngresosOEntradas(
        montTotEntradasPeriodo: json["MontTotEntradasPeriodo"],
        partPropAcumDelFideicom: json["PartPropAcumDelFideicom"],
        propDelMontTot: json["PropDelMontTot"],
        fideicomisonoempresarialIntegracIngresos: FideicomisonoempresarialIntegracIngresos.fromJson(json["fideicomisonoempresarial\u0024IntegracIngresos"]),
    );

    Map<String, dynamic> toJson() => {
        "MontTotEntradasPeriodo": montTotEntradasPeriodo,
        "PartPropAcumDelFideicom": partPropAcumDelFideicom,
        "PropDelMontTot": propDelMontTot,
        "fideicomisonoempresarial\u0024IntegracIngresos": fideicomisonoempresarialIntegracIngresos!.toJson(),
    };
}
class FideicomisonoempresarialIntegracIngresos {
    FideicomisonoempresarialIntegracIngresos({
        this.concepto,
    });

    String? concepto;

    factory FideicomisonoempresarialIntegracIngresos.fromJson(Map<String, dynamic> json) => FideicomisonoempresarialIntegracIngresos(
        concepto: json["Concepto"],
    );

    Map<String, dynamic> toJson() => {
        "Concepto": concepto,
    };
}
class FideicomisonoempresarialRetEfectFideicomiso {
    FideicomisonoempresarialRetEfectFideicomiso({
        this.montRetRelPagFideic,
        this.descRetRelPagFideic,
    });

    String? montRetRelPagFideic;
    String? descRetRelPagFideic;

    factory FideicomisonoempresarialRetEfectFideicomiso.fromJson(Map<String, dynamic> json) => FideicomisonoempresarialRetEfectFideicomiso(
        montRetRelPagFideic: json["MontRetRelPagFideic"],
        descRetRelPagFideic: json["DescRetRelPagFideic"],
    );

    Map<String, dynamic> toJson() => {
        "MontRetRelPagFideic": montRetRelPagFideic,
        "DescRetRelPagFideic": descRetRelPagFideic,
    };
} 
//#EndRegion

//#Region Complemento Intereses
class InteresesIntereses {
    InteresesIntereses({
        this.version,
        this.sistFinanciero,
        this.retiroAoresRetInt,
        this.operFinancDerivad,
        this.montIntNominal,
        this.montIntReal,
        this.perdida,
    });

    String? version;
    String? sistFinanciero;
    String? retiroAoresRetInt;
    String? operFinancDerivad;
    String? montIntNominal;
    String? montIntReal;
    String? perdida;

    factory InteresesIntereses.fromJson(Map<String, dynamic> json) => InteresesIntereses(
        version: json["Version"],
        sistFinanciero: json["SistFinanciero"],
        retiroAoresRetInt: json["RetiroAORESRetInt"],
        operFinancDerivad: json["OperFinancDerivad"],
        montIntNominal: json["MontIntNominal"],
        montIntReal: json["MontIntReal"],
        perdida: json["Perdida"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "SistFinanciero": sistFinanciero,
        "RetiroAORESRetInt": retiroAoresRetInt,
        "OperFinancDerivad": operFinancDerivad,
        "MontIntNominal": montIntNominal,
        "MontIntReal": montIntReal,
        "Perdida": perdida,
    };
}
//#EndRegion

//#Region Complemento Intereses Hipotecarios
class IntereseshipotecariosIntereseshipotecarios {
    IntereseshipotecariosIntereseshipotecarios({
        this.version,
        this.creditoDeInstFinanc,
        this.saldoInsoluto,
        this.propDeducDelCredit,
        this.montTotIntNominalesDev,
        this.montTotIntNominalesDevYPag,
        this.montTotIntRealPagDeduc,
        this.numContrato,
    });

    String? version;
    String? creditoDeInstFinanc;
    String? saldoInsoluto;
    String? propDeducDelCredit;
    String? montTotIntNominalesDev;
    String? montTotIntNominalesDevYPag;
    String? montTotIntRealPagDeduc;
    String? numContrato;

    factory IntereseshipotecariosIntereseshipotecarios.fromJson(Map<String, dynamic> json) => IntereseshipotecariosIntereseshipotecarios(
        version: json["Version"],
        creditoDeInstFinanc: json["CreditoDeInstFinanc"],
        saldoInsoluto: json["SaldoInsoluto"],
        propDeducDelCredit: json["PropDeducDelCredit"],
        montTotIntNominalesDev: json["MontTotIntNominalesDev"],
        montTotIntNominalesDevYPag: json["MontTotIntNominalesDevYPag"],
        montTotIntRealPagDeduc: json["MontTotIntRealPagDeduc"],
        numContrato: json["NumContrato"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "CreditoDeInstFinanc": creditoDeInstFinanc,
        "SaldoInsoluto": saldoInsoluto,
        "PropDeducDelCredit": propDeducDelCredit,
        "MontTotIntNominalesDev": montTotIntNominalesDev,
        "MontTotIntNominalesDevYPag": montTotIntNominalesDevYPag,
        "MontTotIntRealPagDeduc": montTotIntRealPagDeduc,
        "NumContrato": numContrato,
    };
}
//#EndRegion

//#Region Complemento Operaciones con Derivados
class OperacionesconderivadosOperacionesconderivados {
    OperacionesconderivadosOperacionesconderivados({
        this.version,
        this.montGanAcum,
        this.montPerdDed,
    });

    String? version;
    String? montGanAcum;
    String? montPerdDed;

    factory OperacionesconderivadosOperacionesconderivados.fromJson(Map<String, dynamic> json) => OperacionesconderivadosOperacionesconderivados(
        version: json["Version"],
        montGanAcum: json["MontGanAcum"],
        montPerdDed: json["MontPerdDed"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "MontGanAcum": montGanAcum,
        "MontPerdDed": montPerdDed,
    };
}
//#EndRegion

//#Region Complemento Pagos a Extranjeros
class PagosaextranjerosPagosaextranjeros {
    PagosaextranjerosPagosaextranjeros({
        this.version,
        this.esBenefEfectDelCobro,
        this.pagosaextranjerosBeneficiario,
    });

    String? version;
    String? esBenefEfectDelCobro;
    PagosaextranjerosBeneficiario? pagosaextranjerosBeneficiario;

    factory PagosaextranjerosPagosaextranjeros.fromJson(Map<String, dynamic> json) => PagosaextranjerosPagosaextranjeros(
        version: json["Version"],
        esBenefEfectDelCobro: json["EsBenefEfectDelCobro"],
        pagosaextranjerosBeneficiario: PagosaextranjerosBeneficiario.fromJson(json["pagosaextranjeros\u0024Beneficiario"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "EsBenefEfectDelCobro": esBenefEfectDelCobro,
        "pagosaextranjeros\u0024Beneficiario": pagosaextranjerosBeneficiario!.toJson(),
    };
}
class PagosaextranjerosBeneficiario {
    PagosaextranjerosBeneficiario({
        this.rfc,
        this.curp,
        this.nomDenRazSocB,
        this.conceptoPago,
        this.descripcionConcepto,
    });

    String? rfc;
    String? curp;
    String? nomDenRazSocB;
    String? conceptoPago;
    String? descripcionConcepto;

    factory PagosaextranjerosBeneficiario.fromJson(Map<String, dynamic> json) => PagosaextranjerosBeneficiario(
        rfc: json["RFC"],
        curp: json["CURP"],
        nomDenRazSocB: json["NomDenRazSocB"],
        conceptoPago: json["ConceptoPago"],
        descripcionConcepto: json["DescripcionConcepto"],
    );

    Map<String, dynamic> toJson() => {
        "RFC": rfc,
        "CURP": curp,
        "NomDenRazSocB": nomDenRazSocB,
        "ConceptoPago": conceptoPago,
        "DescripcionConcepto": descripcionConcepto,
    };
}
//#EndRegion

//#Region Complemento Planes de Retiro
class PlanesderetiroPlanesderetiro {
    PlanesderetiroPlanesderetiro({
        this.version,
        this.sistemaFinanc,
        this.montTotAportAnioInmAnterior,
        this.montIntRealesDevengAniooInmAnt,
        this.huboRetirosAnioInmAntPer,
        this.montTotRetiradoAnioInmAntPer,
        this.montTotExentRetiradoAnioInmAnt,
        this.montTotExedenteAnioInmAnt,
        this.huboRetirosAnioInmAnt,
        this.montTotRetiradoAnioInmAnt,
    });

    String? version;
    String? sistemaFinanc;
    String? montTotAportAnioInmAnterior;
    String? montIntRealesDevengAniooInmAnt;
    String? huboRetirosAnioInmAntPer;
    String? montTotRetiradoAnioInmAntPer;
    String? montTotExentRetiradoAnioInmAnt;
    String? montTotExedenteAnioInmAnt;
    String? huboRetirosAnioInmAnt;
    String? montTotRetiradoAnioInmAnt;

    factory PlanesderetiroPlanesderetiro.fromJson(Map<String, dynamic> json) => PlanesderetiroPlanesderetiro(
        version: json["Version"],
        sistemaFinanc: json["SistemaFinanc"],
        montTotAportAnioInmAnterior: json["MontTotAportAnioInmAnterior"],
        montIntRealesDevengAniooInmAnt: json["MontIntRealesDevengAniooInmAnt"],
        huboRetirosAnioInmAntPer: json["HuboRetirosAnioInmAntPer"],
        montTotRetiradoAnioInmAntPer: json["MontTotRetiradoAnioInmAntPer"],
        montTotExentRetiradoAnioInmAnt: json["MontTotExentRetiradoAnioInmAnt"],
        montTotExedenteAnioInmAnt: json["MontTotExedenteAnioInmAnt"],
        huboRetirosAnioInmAnt: json["HuboRetirosAnioInmAnt"],
        montTotRetiradoAnioInmAnt: json["MontTotRetiradoAnioInmAnt"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "SistemaFinanc": sistemaFinanc,
        "MontTotAportAnioInmAnterior": montTotAportAnioInmAnterior,
        "MontIntRealesDevengAniooInmAnt": montIntRealesDevengAniooInmAnt,
        "HuboRetirosAnioInmAntPer": huboRetirosAnioInmAntPer,
        "MontTotRetiradoAnioInmAntPer": montTotRetiradoAnioInmAntPer,
        "MontTotExentRetiradoAnioInmAnt": montTotExentRetiradoAnioInmAnt,
        "MontTotExedenteAnioInmAnt": montTotExedenteAnioInmAnt,
        "HuboRetirosAnioInmAnt": huboRetirosAnioInmAnt,
        "MontTotRetiradoAnioInmAnt": montTotRetiradoAnioInmAnt,
    };
}
//#EndRegion

//#Region Complemento Premios
class PremiosPremios {
    PremiosPremios({
        this.version,
        this.entidadFederativa,
        this.montTotPago,
        this.montTotPagoGrav,
        this.montTotPagoExent,
    });

    String? version;
    String? entidadFederativa;
    String? montTotPago;
    String? montTotPagoGrav;
    String? montTotPagoExent;

    factory PremiosPremios.fromJson(Map<String, dynamic> json) => PremiosPremios(
        version: json["Version"],
        entidadFederativa: json["EntidadFederativa"],
        montTotPago: json["MontTotPago"],
        montTotPagoGrav: json["MontTotPagoGrav"],
        montTotPagoExent: json["MontTotPagoExent"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "EntidadFederativa": entidadFederativa,
        "MontTotPago": montTotPago,
        "MontTotPagoGrav": montTotPagoGrav,
        "MontTotPagoExent": montTotPagoExent,
    };
}
//#EndRegion

//#Region Complemento Sector Financiero
class SectorfinancieroSectorFinanciero {
    SectorfinancieroSectorFinanciero({
        this.version,
        this.idFideicom,
        this.nomFideicom,
        this.descripFideicom,
    });

    String? version;
    String? idFideicom;
    String? nomFideicom;
    String? descripFideicom;

    factory SectorfinancieroSectorFinanciero.fromJson(Map<String, dynamic> json) => SectorfinancieroSectorFinanciero(
        version: json["Version"],
        idFideicom: json["IdFideicom"],
        nomFideicom: json["NomFideicom"],
        descripFideicom: json["DescripFideicom"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "IdFideicom": idFideicom,
        "NomFideicom": nomFideicom,
        "DescripFideicom": descripFideicom,
    };
}
//#EndRegion

//#Region Complemento Servicios Plataformas Tecnologicas
class PlataformasTecnologicasServiciosPlataformasTecnologicas {
    PlataformasTecnologicasServiciosPlataformasTecnologicas({
        this.difIvaEntregadoPrestServ,
        this.monTotServSiva,
        this.monTotalporUsoPlataforma,
        this.numServ,
        this.periodicidad,
        this.totalIsrRetenido,
        this.totalIvaRetenido,
        this.totalIvaTrasladado,
        this.version,
        this.plataformasTecnologicasServicios,
    });

    String? difIvaEntregadoPrestServ;
    String? monTotServSiva;
    String? monTotalporUsoPlataforma;
    String? numServ;
    String? periodicidad;
    String? totalIsrRetenido;
    String? totalIvaRetenido;
    String? totalIvaTrasladado;
    String? version;
    PlataformasTecnologicasServicios? plataformasTecnologicasServicios;

    factory PlataformasTecnologicasServiciosPlataformasTecnologicas.fromJson(Map<String, dynamic> json) => PlataformasTecnologicasServiciosPlataformasTecnologicas(
        difIvaEntregadoPrestServ: json["DifIVAEntregadoPrestServ"],
        monTotServSiva: json["MonTotServSIVA"],
        monTotalporUsoPlataforma: json["MonTotalporUsoPlataforma"],
        numServ: json["NumServ"],
        periodicidad: json["Periodicidad"],
        totalIsrRetenido: json["TotalISRRetenido"],
        totalIvaRetenido: json["TotalIVARetenido"],
        totalIvaTrasladado: json["TotalIVATrasladado"],
        version: json["Version"],
        plataformasTecnologicasServicios: PlataformasTecnologicasServicios.fromJson(json["plataformasTecnologicas\u0024Servicios"]),
    );

    Map<String, dynamic> toJson() => {
        "DifIVAEntregadoPrestServ": difIvaEntregadoPrestServ,
        "MonTotServSIVA": monTotServSiva,
        "MonTotalporUsoPlataforma": monTotalporUsoPlataforma,
        "NumServ": numServ,
        "Periodicidad": periodicidad,
        "TotalISRRetenido": totalIsrRetenido,
        "TotalIVARetenido": totalIvaRetenido,
        "TotalIVATrasladado": totalIvaTrasladado,
        "Version": version,
        "plataformasTecnologicas\u0024Servicios": plataformasTecnologicasServicios!.toJson(),
    };
}
class PlataformasTecnologicasServicios {
    PlataformasTecnologicasServicios({
        this.plataformasTecnologicasDetallesDelServicio,
    });

    PlataformasTecnologicasDetallesDelServicio? plataformasTecnologicasDetallesDelServicio;

    factory PlataformasTecnologicasServicios.fromJson(Map<String, dynamic> json) => PlataformasTecnologicasServicios(
        plataformasTecnologicasDetallesDelServicio: PlataformasTecnologicasDetallesDelServicio.fromJson(json["plataformasTecnologicas\u0024DetallesDelServicio"]),
    );

    Map<String, dynamic> toJson() => {
        "plataformasTecnologicas\u0024DetallesDelServicio": plataformasTecnologicasDetallesDelServicio!.toJson(),
    };
}
class PlataformasTecnologicasDetallesDelServicio {
    PlataformasTecnologicasDetallesDelServicio({
        this.fechaServ,
        this.formaPagoServ,
        this.precioServSinIva,
        this.tipoDeServ,
        this.plataformasTecnologicasImpuestosTrasladadosdelServicio,
        this.plataformasTecnologicasComisionDelServicio,
    });

    DateTime? fechaServ;
    String? formaPagoServ;
    String? precioServSinIva;
    String? tipoDeServ;
    PlataformasTecnologicasImpuestosTrasladadosdelServicio? plataformasTecnologicasImpuestosTrasladadosdelServicio;
    PlataformasTecnologicasComisionDelServicio? plataformasTecnologicasComisionDelServicio;

    factory PlataformasTecnologicasDetallesDelServicio.fromJson(Map<String, dynamic> json) => PlataformasTecnologicasDetallesDelServicio(
        fechaServ: DateTime.parse(json["FechaServ"]),
        formaPagoServ: json["FormaPagoServ"],
        precioServSinIva: json["PrecioServSinIVA"],
        tipoDeServ: json["TipoDeServ"],
        plataformasTecnologicasImpuestosTrasladadosdelServicio: PlataformasTecnologicasImpuestosTrasladadosdelServicio.fromJson(json["plataformasTecnologicas\u0024ImpuestosTrasladadosdelServicio"]),
        plataformasTecnologicasComisionDelServicio: PlataformasTecnologicasComisionDelServicio.fromJson(json["plataformasTecnologicas\u0024ComisionDelServicio"]),
    );

    Map<String, dynamic> toJson() => {
        "FechaServ": "${fechaServ!.year.toString().padLeft(4, '0')}-${fechaServ!.month.toString().padLeft(2, '0')}-${fechaServ!.day.toString().padLeft(2, '0')}",
        "FormaPagoServ": formaPagoServ,
        "PrecioServSinIVA": precioServSinIva,
        "TipoDeServ": tipoDeServ,
        "plataformasTecnologicas\u0024ImpuestosTrasladadosdelServicio": plataformasTecnologicasImpuestosTrasladadosdelServicio!.toJson(),
        "plataformasTecnologicas\u0024ComisionDelServicio": plataformasTecnologicasComisionDelServicio!.toJson(),
    };
}
class PlataformasTecnologicasComisionDelServicio {
    PlataformasTecnologicasComisionDelServicio({
        this.base,
        this.importe,
        this.porcentaje,
    });

    String? base;
    String? importe;
    String? porcentaje;

    factory PlataformasTecnologicasComisionDelServicio.fromJson(Map<String, dynamic> json) => PlataformasTecnologicasComisionDelServicio(
        base: json["Base"],
        importe: json["Importe"],
        porcentaje: json["Porcentaje"],
    );

    Map<String, dynamic> toJson() => {
        "Base": base,
        "Importe": importe,
        "Porcentaje": porcentaje,
    };
}
class PlataformasTecnologicasImpuestosTrasladadosdelServicio {
    PlataformasTecnologicasImpuestosTrasladadosdelServicio({
        this.base,
        this.importe,
        this.impuesto,
        this.tasaCuota,
        this.tipoFactor,
    });

    String? base;
    String? importe;
    String? impuesto;
    String? tasaCuota;
    String? tipoFactor;

    factory PlataformasTecnologicasImpuestosTrasladadosdelServicio.fromJson(Map<String, dynamic> json) => PlataformasTecnologicasImpuestosTrasladadosdelServicio(
        base: json["Base"],
        importe: json["Importe"],
        impuesto: json["Impuesto"],
        tasaCuota: json["TasaCuota"],
        tipoFactor: json["TipoFactor"],
    );

    Map<String, dynamic> toJson() => {
        "Base": base,
        "Importe": importe,
        "Impuesto": impuesto,
        "TasaCuota": tasaCuota,
        "TipoFactor": tipoFactor,
    };
}
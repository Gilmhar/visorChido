
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Welcome? ComplementosFacturaFromJson(String str) => Welcome.fromJson(json.decode(str));

String ComplementosFacturaToJson(Welcome? data) => json.encode(data!.toJson());

class Welcome {
    Welcome({
       this.cfdiComplementoConcepto,
       this.cfdiComplemento,
    });

    CfdiComplementoConcepto? cfdiComplementoConcepto;
    CfdiComplemento? cfdiComplemento;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        cfdiComplementoConcepto: CfdiComplementoConcepto.fromJson(json["cfdi\u0024ComplementoConcepto"]),
        cfdiComplemento: CfdiComplemento.fromJson(json["cfdi\u0024Complemento"]),
    );

    Map<String, dynamic> toJson() => {
        "cfdi\u0024ComplementoConcepto": cfdiComplementoConcepto!.toJson(),
        "cfdi\u0024Complemento": cfdiComplemento!.toJson(),
    };
}

class CfdiComplementoConcepto {

    CfdiComplementoConcepto({
        this.aiepsAcreditamientoIeps,
        this.ieduInstEducativas,
        this.tercerosPorCuentadeTerceros,
        this.ventavehiculosVentaVehiculos,
    });

    AiepsAcreditamientoIeps? aiepsAcreditamientoIeps;
    IeduInstEducativas? ieduInstEducativas;
    TercerosPorCuentadeTerceros? tercerosPorCuentadeTerceros;
    VentavehiculosVentaVehiculos? ventavehiculosVentaVehiculos;

    factory CfdiComplementoConcepto.fromJson(Map<String, dynamic> json) => CfdiComplementoConcepto(
        aiepsAcreditamientoIeps: AiepsAcreditamientoIeps.fromJson(json["aieps\u0024acreditamientoIEPS"]),
        ieduInstEducativas: IeduInstEducativas.fromJson(json["iedu\u0024instEducativas"]),
        tercerosPorCuentadeTerceros: TercerosPorCuentadeTerceros.fromJson(json["terceros\u0024PorCuentadeTerceros"]),
        ventavehiculosVentaVehiculos: VentavehiculosVentaVehiculos.fromJson(json["ventavehiculos\u0024VentaVehiculos"]),
    );

    Map<String, dynamic> toJson() => {
        "aieps\u0024acreditamientoIEPS": aiepsAcreditamientoIeps!.toJson(),
        "iedu\u0024instEducativas": ieduInstEducativas!.toJson(),
        "terceros\u0024PorCuentadeTerceros": tercerosPorCuentadeTerceros!.toJson(),
        "ventavehiculos\u0024VentaVehiculos": ventavehiculosVentaVehiculos!.toJson(),
    };
}

//#Region Complemento Acreditamiendo IEPS
class AiepsAcreditamientoIeps {
    AiepsAcreditamientoIeps({
        this.version,
        this.tar,
    });

    String? version;
    String? tar;

    factory AiepsAcreditamientoIeps.fromJson(Map<String, dynamic> json) => AiepsAcreditamientoIeps(
        version: json["Version"],
        tar: json["TAR"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "TAR": tar,
    };
}
//EndRegion

//#Region Complemento Instituciones Educativas Privadas
class IeduInstEducativas {
    IeduInstEducativas({
        this.version,
        this.nombreAlumno,
        this.curp,
        this.nivelEducativo,
        this.autRvoe,
        this.rfcPago,
    });

    String? version;
    String? nombreAlumno;
    String? curp;
    String? nivelEducativo;
    String? autRvoe;
    String? rfcPago;

    factory IeduInstEducativas.fromJson(Map<String, dynamic> json) => IeduInstEducativas(
        version: json["version"],
        nombreAlumno: json["nombreAlumno"],
        curp: json["CURP"],
        nivelEducativo: json["nivelEducativo"],
        autRvoe: json["autRVOE"],
        rfcPago: json["rfcPago"],
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "nombreAlumno": nombreAlumno,
        "CURP": curp,
        "nivelEducativo": nivelEducativo,
        "autRVOE": autRvoe,
        "rfcPago": rfcPago,
    };
}
//EndRegion

//#Region Complemento Terceros
class TercerosPorCuentadeTerceros {
    TercerosPorCuentadeTerceros({
        this.version,
        this.rfc,
        this.nombre,
        this.xmlns,
        this.xmlnsTerceros,
        this.tercerosInformacionFiscalTercero,
        this.tercerosParte,
        this.tercerosImpuestos,
    });

    String? version;
    String? rfc;
    String? nombre;
    List<Xmln>? xmlns;
    String? xmlnsTerceros;
    TercerosInformacionFiscalTercero? tercerosInformacionFiscalTercero;
    List<TercerosParte>? tercerosParte;
    TercerosImpuestos? tercerosImpuestos;

    factory TercerosPorCuentadeTerceros.fromJson(Map<String, dynamic> json) => TercerosPorCuentadeTerceros(
        version: json["version"],
        rfc: json["rfc"],
        nombre: json["nombre"],
        xmlns: List<Xmln>.from(json["xmlns"].map((x) => Xmln.fromJson(x))),
        xmlnsTerceros: json["xmlns\u0024terceros"],
        tercerosInformacionFiscalTercero: TercerosInformacionFiscalTercero.fromJson(json["terceros\u0024InformacionFiscalTercero"]),
        tercerosParte: List<TercerosParte>.from(json["terceros\u0024Parte"].map((x) => TercerosParte.fromJson(x))),
        tercerosImpuestos: TercerosImpuestos.fromJson(json["terceros\u0024Impuestos"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "rfc": rfc,
        "nombre": nombre,
        "xmlns": List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "xmlns\u0024terceros": xmlnsTerceros,
        "terceros\u0024InformacionFiscalTercero": tercerosInformacionFiscalTercero!.toJson(),
        "terceros\u0024Parte": List<dynamic>.from(tercerosParte!.map((x) => x.toJson())),
        "terceros\u0024Impuestos": tercerosImpuestos!.toJson(),
    };
}
class TercerosImpuestos {
    TercerosImpuestos({
        this.tercerosTraslados,
    });

    TercerosTraslados? tercerosTraslados;

    factory TercerosImpuestos.fromJson(Map<String, dynamic> json) => TercerosImpuestos(
        tercerosTraslados: TercerosTraslados.fromJson(json["terceros\u0024Traslados"]),
    );

    Map<String, dynamic> toJson() => {
        "terceros\u0024Traslados": tercerosTraslados!.toJson(),
    };
}
class TercerosTraslados {
    TercerosTraslados({
        this.tercerosTraslado,
    });

    List<TercerosTraslado>? tercerosTraslado;

    factory TercerosTraslados.fromJson(Map<String, dynamic> json) => TercerosTraslados(
        tercerosTraslado: List<TercerosTraslado>.from(json["terceros\u0024Traslado"].map((x) => TercerosTraslado.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "terceros\u0024Traslado": List<dynamic>.from(tercerosTraslado!.map((x) => x.toJson())),
    };
}
class TercerosTraslado {
    TercerosTraslado({
        this.impuesto,
        this.tasa,
        this.importe,
    });

    String? impuesto;
    String? tasa;
    String? importe;

    factory TercerosTraslado.fromJson(Map<String, dynamic> json) => TercerosTraslado(
        impuesto: json["impuesto"],
        tasa: json["tasa"],
        importe: json["importe"],
    );

    Map<String, dynamic> toJson() => {
        "impuesto": impuesto,
        "tasa": tasa,
        "importe": importe,
    };
}
class TercerosInformacionFiscalTercero {
    TercerosInformacionFiscalTercero({
        this.calle,
        this.noExterior,
        this.municipio,
        this.estado,
        this.pais,
        this.codigoPostal,
    });

    String? calle;
    String? noExterior;
    String? municipio;
    String? estado;
    String? pais;
    String? codigoPostal;

    factory TercerosInformacionFiscalTercero.fromJson(Map<String, dynamic> json) => TercerosInformacionFiscalTercero(
        calle: json["calle"],
        noExterior: json["noExterior"],
        municipio: json["municipio"],
        estado: json["estado"],
        pais: json["pais"],
        codigoPostal: json["codigoPostal"],
    );

    Map<String, dynamic> toJson() => {
        "calle": calle,
        "noExterior": noExterior,
        "municipio": municipio,
        "estado": estado,
        "pais": pais,
        "codigoPostal": codigoPostal,
    };
}
class TercerosParte {
    TercerosParte({
        this.cantidad,
        this.unidad,
        this.descripcion,
        this.valorUnitario,
        this.importe,
    });

    String? cantidad;
    String? unidad;
    String? descripcion;
    String? valorUnitario;
    String? importe;

    factory TercerosParte.fromJson(Map<String, dynamic> json) => TercerosParte(
        cantidad: json["cantidad"],
        unidad: json["unidad"],
        descripcion: json["descripcion"],
        valorUnitario: json["valorUnitario"],
        importe: json["importe"],
    );

    Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "unidad": unidad,
        "descripcion": descripcion,
        "valorUnitario": valorUnitario,
        "importe": importe,
    };
}
//EndRegion

//#Region Complemento Venta de Vehiculo
class VentavehiculosVentaVehiculos {
    VentavehiculosVentaVehiculos({
        this.version,
        this.claveVehicular,
        this.niv,
        this.ventavehiculosParte,
    });

    String? version;
    String? claveVehicular;
    String? niv;
    VentavehiculosParte? ventavehiculosParte;

    factory VentavehiculosVentaVehiculos.fromJson(Map<String, dynamic> json) => VentavehiculosVentaVehiculos(
        version: json["version"],
        claveVehicular: json["ClaveVehicular"],
        niv: json["Niv"],
        ventavehiculosParte: VentavehiculosParte.fromJson(json["ventavehiculos\u0024Parte"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "ClaveVehicular": claveVehicular,
        "Niv": niv,
        "ventavehiculos\u0024Parte": ventavehiculosParte!.toJson(),
    };
}
class VentavehiculosParte {
    VentavehiculosParte({
        this.cantidad,
        this.unidad,
        this.noIdentificacion,
        this.descripcion,
        this.valorUnitario,
        this.importe,
        this.ventavehiculosInformacionAduanera,
    });

    String? cantidad;
    String? unidad;
    String? noIdentificacion;
    String? descripcion;
    String? valorUnitario;
    String? importe;
    VentavehiculosInformacionAduanera? ventavehiculosInformacionAduanera;

    factory VentavehiculosParte.fromJson(Map<String, dynamic> json) => VentavehiculosParte(
        cantidad: json["cantidad"],
        unidad: json["unidad"],
        noIdentificacion: json["noIdentificacion"],
        descripcion: json["descripcion"],
        valorUnitario: json["valorUnitario"],
        importe: json["importe"],
        ventavehiculosInformacionAduanera: VentavehiculosInformacionAduanera.fromJson(json["ventavehiculos\u0024InformacionAduanera"]),
    );

    Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "unidad": unidad,
        "noIdentificacion": noIdentificacion,
        "descripcion": descripcion,
        "valorUnitario": valorUnitario,
        "importe": importe,
        "ventavehiculos\u0024InformacionAduanera": ventavehiculosInformacionAduanera!.toJson(),
    };
}
class VentavehiculosInformacionAduanera {
    VentavehiculosInformacionAduanera({
        this.numero,
        this.fecha,
        this.aduana,
    });

    String? numero;
    DateTime? fecha;
    String? aduana;

    factory VentavehiculosInformacionAduanera.fromJson(Map<String, dynamic> json) => VentavehiculosInformacionAduanera(
        numero: json["numero"],
        fecha: DateTime.parse(json["fecha"]),
        aduana: json["aduana"],
    );

    Map<String, dynamic> toJson() => {
        "numero": numero,
        "fecha": "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "aduana": aduana,
    };
}
//EndRegion

class CfdiComplemento {
    CfdiComplemento({
      this.aerolineasAerolineas,
      this.destruccionCertificadodedestruccion,
      this.cceComercioExterior,
      this.divisasDivisas,
      this.consumodecombustiblesConsumoDeCombustibles,
      this.consumodecombustibles11ConsumoDeCombustibles,
      this.donatDonatarias,
      this.ecc12EstadoDeCuentaCombustible,
      this.gcehGastosHidrocarburos,
      this.ieehIngresosHidrocarburos,
      this.ineIne,
      this.leyendasFiscLeyendasFiscales,
      this.notariospublicosNotariosPublicos,
      this.obrasarteObrasarteantiguedades,
      this.implocalImpuestosLocales,
      this.pagoenespeciePagoEnEspecie,
      this.pficPFintegranteCoordinado,
      this.servicioparcialParcialesconstruccion,
      this.speiComplementoSpei,
      this.tpeTuristaPasajeroExtranjero,
      this.valesdedespensaValesDeDespensa,
      this.vehiculousadoVehiculoUsado,
      this.ecc11EstadoDeCuentaCombustible,
      this.ieduInstEducativas,
      this.decretoRenovacionysustitucionvehiculos,
      this.detallistaDetallista,
        
    });

    AerolineasAerolineas? aerolineasAerolineas;
    DestruccionCertificadodedestruccion? destruccionCertificadodedestruccion;
    CceComercioExterior? cceComercioExterior;
    DivisasDivisas? divisasDivisas;
    ConsumodecombustiblesConsumoDeCombustibles? consumodecombustiblesConsumoDeCombustibles;
    Consumodecombustibles11ConsumoDeCombustibles? consumodecombustibles11ConsumoDeCombustibles;
    DonatDonatarias? donatDonatarias;
    Ecc12EstadoDeCuentaCombustible? ecc12EstadoDeCuentaCombustible;
    GcehGastosHidrocarburos? gcehGastosHidrocarburos;
    IeehIngresosHidrocarburos? ieehIngresosHidrocarburos;
    IneIne? ineIne;
    LeyendasFiscLeyendasFiscales? leyendasFiscLeyendasFiscales;
    NotariospublicosNotariosPublicos? notariospublicosNotariosPublicos;
    ObrasarteObrasarteantiguedades? obrasarteObrasarteantiguedades;
    ImplocalImpuestosLocales? implocalImpuestosLocales;
    PagoenespeciePagoEnEspecie? pagoenespeciePagoEnEspecie;
    PficPFintegranteCoordinado? pficPFintegranteCoordinado;
    ServicioparcialParcialesconstruccion? servicioparcialParcialesconstruccion;
    SpeiComplementoSpei? speiComplementoSpei;
    TpeTuristaPasajeroExtranjero? tpeTuristaPasajeroExtranjero;
    ValesdedespensaValesDeDespensa? valesdedespensaValesDeDespensa;
    VehiculousadoVehiculoUsado? vehiculousadoVehiculoUsado;
    Ecc11EstadoDeCuentaCombustible? ecc11EstadoDeCuentaCombustible;
    IeduInstEducativas? ieduInstEducativas;
    DecretoRenovacionysustitucionvehiculos? decretoRenovacionysustitucionvehiculos;
    DetallistaDetallista? detallistaDetallista;

    factory CfdiComplemento.fromJson(Map<String, dynamic> json) => CfdiComplemento(
        aerolineasAerolineas: AerolineasAerolineas.fromJson(json["aerolineas\u0024Aerolineas"]),
        destruccionCertificadodedestruccion: DestruccionCertificadodedestruccion.fromJson(json["destruccion\u0024certificadodedestruccion"]),
        cceComercioExterior: CceComercioExterior.fromJson(json["cce\u0024ComercioExterior"]),
        divisasDivisas: DivisasDivisas.fromJson(json["divisas\u0024Divisas"]),
        consumodecombustiblesConsumoDeCombustibles: ConsumodecombustiblesConsumoDeCombustibles.fromJson(json["consumodecombustibles\u0024ConsumoDeCombustibles"]),
        consumodecombustibles11ConsumoDeCombustibles: Consumodecombustibles11ConsumoDeCombustibles.fromJson(json["consumodecombustibles11\u0024ConsumoDeCombustibles"]),
        donatDonatarias: DonatDonatarias.fromJson(json["donat\u0024Donatarias"]),
        ecc12EstadoDeCuentaCombustible: Ecc12EstadoDeCuentaCombustible.fromJson(json["ecc12\u0024EstadoDeCuentaCombustible"]),
        gcehGastosHidrocarburos: GcehGastosHidrocarburos.fromJson(json["gceh\u0024GastosHidrocarburos"]),
        ieehIngresosHidrocarburos: IeehIngresosHidrocarburos.fromJson(json["ieeh\u0024IngresosHidrocarburos"]),
        ineIne: IneIne.fromJson(json["ine\u0024INE"]),
        leyendasFiscLeyendasFiscales: LeyendasFiscLeyendasFiscales.fromJson(json["leyendasFisc\u0024LeyendasFiscales"]),
        notariospublicosNotariosPublicos: NotariospublicosNotariosPublicos.fromJson(json["notariospublicos\u0024NotariosPublicos"]),
        obrasarteObrasarteantiguedades: ObrasarteObrasarteantiguedades.fromJson(json["obrasarte\u0024obrasarteantiguedades"]),
        implocalImpuestosLocales: ImplocalImpuestosLocales.fromJson(json["implocal\u0024ImpuestosLocales"]),
        pagoenespeciePagoEnEspecie: PagoenespeciePagoEnEspecie.fromJson(json["pagoenespecie\u0024PagoEnEspecie"]),
        pficPFintegranteCoordinado: PficPFintegranteCoordinado.fromJson(json["pfic\u0024PFintegranteCoordinado"]),
        servicioparcialParcialesconstruccion: ServicioparcialParcialesconstruccion.fromJson(json["servicioparcial\u0024parcialesconstruccion"]),
        speiComplementoSpei: SpeiComplementoSpei.fromJson(json["spei\u0024Complemento_SPEI"]),
        tpeTuristaPasajeroExtranjero: TpeTuristaPasajeroExtranjero.fromJson(json["tpe\u0024TuristaPasajeroExtranjero"]),
        valesdedespensaValesDeDespensa: ValesdedespensaValesDeDespensa.fromJson(json["valesdedespensa\u0024ValesDeDespensa"]),
        vehiculousadoVehiculoUsado: VehiculousadoVehiculoUsado.fromJson(json["vehiculousado\u0024VehiculoUsado"]), 
        ecc11EstadoDeCuentaCombustible: Ecc11EstadoDeCuentaCombustible.fromJson(json["ecc11\u0024EstadoDeCuentaCombustible"]),
        ieduInstEducativas: IeduInstEducativas.fromJson(json["iedu\u0024instEducativas"]),
        decretoRenovacionysustitucionvehiculos: DecretoRenovacionysustitucionvehiculos.fromJson(json["decreto\u0024renovacionysustitucionvehiculos"]),
        detallistaDetallista: DetallistaDetallista.fromJson(json["detallista\u0024detallista"]),      
    );

    Map<String, dynamic> toJson() => {
        "aerolineas\u0024Aerolineas": aerolineasAerolineas!.toJson(),
        "destruccion\u0024certificadodedestruccion": destruccionCertificadodedestruccion!.toJson(),
        "cce\u0024ComercioExterior": cceComercioExterior!.toJson(),
        "divisas\u0024Divisas": divisasDivisas!.toJson(),
        "consumodecombustibles\u0024ConsumoDeCombustibles": consumodecombustiblesConsumoDeCombustibles!.toJson(),
        "consumodecombustibles11\u0024ConsumoDeCombustibles": consumodecombustibles11ConsumoDeCombustibles!.toJson(),
        "donat\u0024Donatarias": donatDonatarias!.toJson(),
        "ecc12\u0024EstadoDeCuentaCombustible": ecc12EstadoDeCuentaCombustible!.toJson(),
        "gceh\u0024GastosHidrocarburos": gcehGastosHidrocarburos!.toJson(),
        "ieeh\u0024IngresosHidrocarburos": ieehIngresosHidrocarburos!.toJson(),
        "ine\u0024INE": ineIne!.toJson(),
        "leyendasFisc\u0024LeyendasFiscales": leyendasFiscLeyendasFiscales!.toJson(),
        "notariospublicos\u0024NotariosPublicos": notariospublicosNotariosPublicos!.toJson(),
        "obrasarte\u0024obrasarteantiguedades": obrasarteObrasarteantiguedades!.toJson(),
        "implocal\u0024ImpuestosLocales": implocalImpuestosLocales!.toJson(),
        "pagoenespecie\u0024PagoEnEspecie": pagoenespeciePagoEnEspecie!.toJson(),
        "pfic\u0024PFintegranteCoordinado": pficPFintegranteCoordinado!.toJson(),
        "servicioparcial\u0024parcialesconstruccion": servicioparcialParcialesconstruccion!.toJson(),
        "spei\u0024Complemento_SPEI": speiComplementoSpei!.toJson(),
        "tpe\u0024TuristaPasajeroExtranjero": tpeTuristaPasajeroExtranjero!.toJson(),
        "valesdedespensa\u0024ValesDeDespensa": valesdedespensaValesDeDespensa!.toJson(),
        "vehiculousado\u0024VehiculoUsado": vehiculousadoVehiculoUsado!.toJson(),
        "ecc11\u0024EstadoDeCuentaCombustible": ecc11EstadoDeCuentaCombustible!.toJson(),
        "iedu\u0024instEducativas": ieduInstEducativas!.toJson(),
        "decreto\u0024renovacionysustitucionvehiculos": decretoRenovacionysustitucionvehiculos!.toJson(),
        "detallista\u0024detallista": detallistaDetallista!.toJson(),      
    };
}

//#Region Complemento Aerolineas
class AerolineasAerolineas {
    AerolineasAerolineas({
      this.version,
      this.tua,
      this.aerolineasOtrosCargos,
    });

    String? version;
    String? tua;
    AerolineasOtrosCargos? aerolineasOtrosCargos;

    factory AerolineasAerolineas.fromJson(Map<String, dynamic> json) => AerolineasAerolineas(
        version: json["Version"],
        tua: json["TUA"],
        aerolineasOtrosCargos: AerolineasOtrosCargos.fromJson(json["aerolineas\u0024OtrosCargos"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "TUA": tua,
        "aerolineas\u0024OtrosCargos": aerolineasOtrosCargos!.toJson(),
    };
}
class AerolineasOtrosCargos {
    AerolineasOtrosCargos({
      this.totalCargos,
      this.aerolineasCargo,
    });

    String? totalCargos;
    AerolineasCargo? aerolineasCargo;

    factory AerolineasOtrosCargos.fromJson(Map<String, dynamic> json) => AerolineasOtrosCargos(
        totalCargos: json["TotalCargos"],
        aerolineasCargo: AerolineasCargo.fromJson(json["aerolineas\u0024Cargo"]),
    );

    Map<String, dynamic> toJson() => {
        "TotalCargos": totalCargos,
        "aerolineas\u0024Cargo": aerolineasCargo!.toJson(),
    };
}
class AerolineasCargo {
    AerolineasCargo({
      this.codigoCargo,
      this.importe,
    });

    String? codigoCargo;
    String? importe;

    factory AerolineasCargo.fromJson(Map<String, dynamic> json) => AerolineasCargo(
        codigoCargo: json["CodigoCargo"],
        importe: json["Importe"],
    );

    Map<String, dynamic> toJson() => {
        "CodigoCargo": codigoCargo,
        "Importe": importe,
    };
}
//EndRegion

//#Region Complemento Certificado de Destrucción
class DestruccionCertificadodedestruccion {
    DestruccionCertificadodedestruccion({
      this.version,
      this.serie,
      this.numFolDesVeh,
      this.destruccionVehiculoDestruido,
      this.destruccionInformacionAduanera,
    });

    String? version;
    String? serie;
    String? numFolDesVeh;
    DestruccionVehiculoDestruido? destruccionVehiculoDestruido;
    DestruccionInformacionAduanera? destruccionInformacionAduanera;

    factory DestruccionCertificadodedestruccion.fromJson(Map<String, dynamic> json) => DestruccionCertificadodedestruccion(
        version: json["Version"],
        serie: json["Serie"],
        numFolDesVeh: json["NumFolDesVeh"],
        destruccionVehiculoDestruido: DestruccionVehiculoDestruido.fromJson(json["destruccion\u0024VehiculoDestruido"]),
        destruccionInformacionAduanera: DestruccionInformacionAduanera.fromJson(json["destruccion\u0024InformacionAduanera"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "Serie": serie,
        "NumFolDesVeh": numFolDesVeh,
        "destruccion\u0024VehiculoDestruido": destruccionVehiculoDestruido!.toJson(),
        "destruccion\u0024InformacionAduanera": destruccionInformacionAduanera!.toJson(),
    };
}
class DestruccionInformacionAduanera {
    DestruccionInformacionAduanera({
        this.numPedImp,
        this.fecha,
        this.aduana,
    });

    String? numPedImp;
    DateTime? fecha;
    String? aduana;

    factory DestruccionInformacionAduanera.fromJson(Map<String, dynamic> json) => DestruccionInformacionAduanera(
        numPedImp: json["NumPedImp"],
        fecha: DateTime.parse(json["Fecha"]),
        aduana: json["Aduana"],
    );

    Map<String, dynamic> toJson() => {
        "NumPedImp": numPedImp,
        "Fecha": "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "Aduana": aduana,
    };
}
class DestruccionVehiculoDestruido {
    DestruccionVehiculoDestruido({
      this.marca,
      this.tipooClase,
      this.ao,
      this.modelo,
      this.niv,
      this.numSerie,
      this.numPlacas,
      this.numMotor,
      this.numFolTarjCir,
    });

    String? marca;
    String? tipooClase;
    String? ao;
    String? modelo;
    String? niv;
    String? numSerie;
    String? numPlacas;
    String? numMotor;
    String? numFolTarjCir;

    factory DestruccionVehiculoDestruido.fromJson(Map<String, dynamic> json) => DestruccionVehiculoDestruido(
        marca: json["Marca"],
        tipooClase: json["TipooClase"],
        ao: json["Año"],
        modelo: json["Modelo"],
        niv: json["NIV"],
        numSerie: json["NumSerie"],
        numPlacas: json["NumPlacas"],
        numMotor: json["NumMotor"],
        numFolTarjCir: json["NumFolTarjCir"],
    );

    Map<String, dynamic> toJson() => {
        "Marca": marca,
        "TipooClase": tipooClase,
        "Año": ao,
        "Modelo": modelo,
        "NIV": niv,
        "NumSerie": numSerie,
        "NumPlacas": numPlacas,
        "NumMotor": numMotor,
        "NumFolTarjCir": numFolTarjCir,
    };
}
//EndRegion

//#Region Complemento Comercio Exterior
class CceComercioExterior {
    CceComercioExterior({
      this.version,
      this.tipoOperacion,
      this.claveDePedimento,
      this.certificadoOrigen,
      this.numeroExportadorConfiable,
      this.incoterm,
      this.subdivision,
      this.observaciones,
      this.tipoCambioUsd,
      this.totalUsd,
      this.cceReceptor,
      this.cceDestinatario,
      this.cceMercancias,
    });

    String? version;
    String? tipoOperacion;
    String? claveDePedimento;
    String? certificadoOrigen;
    String? numeroExportadorConfiable;
    String? incoterm;
    String? subdivision;
    String? observaciones;
    String? tipoCambioUsd;
    String? totalUsd;
    CceReceptor? cceReceptor;
    CceDestinatario? cceDestinatario;
    CceMercancias? cceMercancias;

    factory CceComercioExterior.fromJson(Map<String, dynamic> json) => CceComercioExterior(
        version: json["Version"],
        tipoOperacion: json["TipoOperacion"],
        claveDePedimento: json["ClaveDePedimento"],
        certificadoOrigen: json["CertificadoOrigen"],
        numeroExportadorConfiable: json["NumeroExportadorConfiable"],
        incoterm: json["Incoterm"],
        subdivision: json["Subdivision"],
        observaciones: json["Observaciones"],
        tipoCambioUsd: json["TipoCambioUSD"],
        totalUsd: json["TotalUSD"],
        cceReceptor: CceReceptor.fromJson(json["cce\u0024Receptor"]),
        cceDestinatario: CceDestinatario.fromJson(json["cce\u0024Destinatario"]),
        cceMercancias: CceMercancias.fromJson(json["cce\u0024Mercancias"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "TipoOperacion": tipoOperacion,
        "ClaveDePedimento": claveDePedimento,
        "CertificadoOrigen": certificadoOrigen,
        "NumeroExportadorConfiable": numeroExportadorConfiable,
        "Incoterm": incoterm,
        "Subdivision": subdivision,
        "Observaciones": observaciones,
        "TipoCambioUSD": tipoCambioUsd,
        "TotalUSD": totalUsd,
        "cce\u0024Receptor": cceReceptor!.toJson(),
        "cce\u0024Destinatario": cceDestinatario!.toJson(),
        "cce\u0024Mercancias": cceMercancias!.toJson(),
    };
}
class CceDestinatario {
    CceDestinatario({
      this.numRegIdTrib,
      this.cceDomicilio,
    });

    String? numRegIdTrib;
    CceDomicilio? cceDomicilio;

    factory CceDestinatario.fromJson(Map<String, dynamic> json) => CceDestinatario(
        numRegIdTrib: json["NumRegIdTrib"],
        cceDomicilio: CceDomicilio.fromJson(json["cce\u0024Domicilio"]),
    );

    Map<String, dynamic> toJson() => {
        "NumRegIdTrib": numRegIdTrib,
        "cce\u0024Domicilio": cceDomicilio!.toJson(),
    };
}
class CceDomicilio {
    CceDomicilio({
        this.calle,
        this.estado,
        this.pais,
        this.codigoPostal,
    });

    String? calle;
    String? estado;
    String? pais;
    String? codigoPostal;

    factory CceDomicilio.fromJson(Map<String, dynamic> json) => CceDomicilio(
        calle: json["Calle"],
        estado: json["Estado"],
        pais: json["Pais"],
        codigoPostal: json["CodigoPostal"],
    );

    Map<String, dynamic> toJson() => {
        "Calle": calle,
        "Estado": estado,
        "Pais": pais,
        "CodigoPostal": codigoPostal,
    };
}
class CceMercancias {
    CceMercancias({
      this.cceMercancia,
    });

    List<CceMercancia>? cceMercancia;

    factory CceMercancias.fromJson(Map<String, dynamic> json) => CceMercancias(
        cceMercancia: List<CceMercancia>.from(json["cce\u0024Mercancia"].map((x) => CceMercancia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cce\u0024Mercancia": List<dynamic>.from(cceMercancia!.map((x) => x.toJson())),
    };
}
class CceMercancia {
    CceMercancia({
      this.noIdentificacion,
      this.fraccionArancelaria,
      this.valorDolares,
    });

    String? noIdentificacion;
    String? fraccionArancelaria;
    String? valorDolares;

    factory CceMercancia.fromJson(Map<String, dynamic> json) => CceMercancia(
        noIdentificacion: json["NoIdentificacion"],
        fraccionArancelaria: json["FraccionArancelaria"],
        valorDolares: json["ValorDolares"],
    );

    Map<String, dynamic> toJson() => {
        "NoIdentificacion": noIdentificacion,
        "FraccionArancelaria": fraccionArancelaria,
        "ValorDolares": valorDolares,
    };
}
class CceReceptor {
    CceReceptor({
        required this.numRegIdTrib,
    });

    String numRegIdTrib;

    factory CceReceptor.fromJson(Map<String, dynamic> json) => CceReceptor(
        numRegIdTrib: json["NumRegIdTrib"],
    );

    Map<String, dynamic> toJson() => {
        "NumRegIdTrib": numRegIdTrib,
    };
}
//EndRegion

//#Region Complemento Compra Venta Divisas
class DivisasDivisas {
    DivisasDivisas({
      this.version,
      this.tipoOperacion,
      this.xmlns,
      this.xmlnsDivisas,
    });

    String? version;
    String? tipoOperacion;
    List<Xmln>? xmlns;
    String? xmlnsDivisas;

    factory DivisasDivisas.fromJson(Map<String, dynamic> json) => DivisasDivisas(
        version: json["version"],
        tipoOperacion: json["tipoOperacion"],
        xmlns: List<Xmln>.from(json["xmlns"].map((x) => Xmln.fromJson(x))),
        xmlnsDivisas: json["xmlns\u0024divisas"],
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "tipoOperacion": tipoOperacion,
        "xmlns": List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "xmlns\u0024divisas": xmlnsDivisas,
    };
}
//EndRegion

//#Region Complemento Consumo de Combustibles 10
class ConsumodecombustiblesConsumoDeCombustibles {
    ConsumodecombustiblesConsumoDeCombustibles({
      this.version,
      this.tipoOperacion,
      this.numeroDeCuenta,
      this.subTotal,
      this.total,
      this.consumodecombustiblesConceptos,
    });

    String? version;
    String? tipoOperacion;
    String? numeroDeCuenta;
    String? subTotal;
    String? total;
    ConsumodecombustiblesConceptos? consumodecombustiblesConceptos;

    factory ConsumodecombustiblesConsumoDeCombustibles.fromJson(Map<String, dynamic> json) => ConsumodecombustiblesConsumoDeCombustibles(
        version: json["version"],
        tipoOperacion: json["tipoOperacion"],
        numeroDeCuenta: json["numeroDeCuenta"],
        subTotal: json["subTotal"],
        total: json["total"],
        consumodecombustiblesConceptos: ConsumodecombustiblesConceptos.fromJson(json["consumodecombustibles\u0024Conceptos"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "tipoOperacion": tipoOperacion,
        "numeroDeCuenta": numeroDeCuenta,
        "subTotal": subTotal,
        "total": total,
        "consumodecombustibles\u0024Conceptos": consumodecombustiblesConceptos!.toJson(),
    };
}
class ConsumodecombustiblesConceptos {
    ConsumodecombustiblesConceptos({
         this.consumodecombustiblesConceptoConsumoDeCombustibles,
    });

    ConsumodecombustiblesConceptoConsumoDeCombustibles? consumodecombustiblesConceptoConsumoDeCombustibles;

    factory ConsumodecombustiblesConceptos.fromJson(Map<String, dynamic> json) => ConsumodecombustiblesConceptos(
        consumodecombustiblesConceptoConsumoDeCombustibles: ConsumodecombustiblesConceptoConsumoDeCombustibles.fromJson(json["consumodecombustibles\u0024ConceptoConsumoDeCombustibles"]),
    );

    Map<String, dynamic> toJson() => {
        "consumodecombustibles\u0024ConceptoConsumoDeCombustibles": consumodecombustiblesConceptoConsumoDeCombustibles!.toJson(),
    };
}
class ConsumodecombustiblesConceptoConsumoDeCombustibles {
    ConsumodecombustiblesConceptoConsumoDeCombustibles({
      this.identificador,
      this.fecha,
      this.rfc,
      this.claveEstacion,
      this.cantidad,
      this.nombreCombustible,
      this.folioOperacion,
      this.valorUnitario,
      this.importe,
      this.consumodecombustiblesDeterminados,
    });

    String? identificador;
    DateTime? fecha;
    String? rfc;
    String? claveEstacion;
    String? cantidad;
    String? nombreCombustible;
    String? folioOperacion;
    String? valorUnitario;
    String? importe;
    ConsumodecombustiblesDeterminados? consumodecombustiblesDeterminados;

    factory ConsumodecombustiblesConceptoConsumoDeCombustibles.fromJson(Map<String, dynamic> json) => ConsumodecombustiblesConceptoConsumoDeCombustibles(
        identificador: json["identificador"],
        fecha: DateTime.parse(json["fecha"]),
        rfc: json["rfc"],
        claveEstacion: json["claveEstacion"],
        cantidad: json["cantidad"],
        nombreCombustible: json["nombreCombustible"],
        folioOperacion: json["folioOperacion"],
        valorUnitario: json["valorUnitario"],
        importe: json["importe"],
        consumodecombustiblesDeterminados: ConsumodecombustiblesDeterminados.fromJson(json["consumodecombustibles\u0024Determinados"]),
    );

    Map<String, dynamic> toJson() => {
        "identificador": identificador,
        "fecha": fecha!.toIso8601String(),
        "rfc": rfc,
        "claveEstacion": claveEstacion,
        "cantidad": cantidad,
        "nombreCombustible": nombreCombustible,
        "folioOperacion": folioOperacion,
        "valorUnitario": valorUnitario,
        "importe": importe,
        "consumodecombustibles\u0024Determinados": consumodecombustiblesDeterminados!.toJson(),
    };
}
class ConsumodecombustiblesDeterminados {
    ConsumodecombustiblesDeterminados({
      this.consumodecombustiblesDeterminado,
    });

    ConsumodecombustiblesDeterminado? consumodecombustiblesDeterminado;

    factory ConsumodecombustiblesDeterminados.fromJson(Map<String, dynamic> json) => ConsumodecombustiblesDeterminados(
        consumodecombustiblesDeterminado: ConsumodecombustiblesDeterminado.fromJson(json["consumodecombustibles\u0024Determinado"]),
    );

    Map<String, dynamic> toJson() => {
        "consumodecombustibles\u0024Determinado": consumodecombustiblesDeterminado!.toJson(),
    };
}
class ConsumodecombustiblesDeterminado {
    ConsumodecombustiblesDeterminado({
        this.impuesto,
        this.tasa,
        this.importe,
    });

    String? impuesto;
    String? tasa;
    String? importe;

    factory ConsumodecombustiblesDeterminado.fromJson(Map<String, dynamic> json) => ConsumodecombustiblesDeterminado(
        impuesto: json["impuesto"],
        tasa: json["tasa"],
        importe: json["importe"],
    );

    Map<String, dynamic> toJson() => {
        "impuesto": impuesto,
        "tasa": tasa,
        "importe": importe,
    };
}
//EndRegion

//#Region Complemento Consumo de Combustibles 11
class Consumodecombustibles11ConsumoDeCombustibles {
    Consumodecombustibles11ConsumoDeCombustibles({
      this.version,
      this.numeroDeCuenta,
      this.tipoOperacion,
      this.subTotal,
      this.total,
      this.consumodecombustibles11Conceptos,
    });

    String? version;
    String? numeroDeCuenta;
    String? tipoOperacion;
    String? subTotal;
    String? total;
    Consumodecombustibles11Conceptos? consumodecombustibles11Conceptos;

    factory Consumodecombustibles11ConsumoDeCombustibles.fromJson(Map<String, dynamic> json) => Consumodecombustibles11ConsumoDeCombustibles(
        version: json["version"],
        numeroDeCuenta: json["numeroDeCuenta"],
        tipoOperacion: json["tipoOperacion"],
        subTotal: json["subTotal"],
        total: json["total"],
        consumodecombustibles11Conceptos: Consumodecombustibles11Conceptos.fromJson(json["consumodecombustibles11\u0024Conceptos"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "numeroDeCuenta": numeroDeCuenta,
        "tipoOperacion": tipoOperacion,
        "subTotal": subTotal,
        "total": total,
        "consumodecombustibles11\u0024Conceptos": consumodecombustibles11Conceptos!.toJson(),
    };
}
class Consumodecombustibles11Conceptos {
    Consumodecombustibles11Conceptos({
      this.consumodecombustibles11ConceptoConsumoDeCombustibles,
    });

    Consumodecombustibles11ConceptoConsumoDeCombustibles? consumodecombustibles11ConceptoConsumoDeCombustibles;

    factory Consumodecombustibles11Conceptos.fromJson(Map<String, dynamic> json) => Consumodecombustibles11Conceptos(
        consumodecombustibles11ConceptoConsumoDeCombustibles: Consumodecombustibles11ConceptoConsumoDeCombustibles.fromJson(json["consumodecombustibles11\u0024ConceptoConsumoDeCombustibles"]),
    );

    Map<String, dynamic> toJson() => {
        "consumodecombustibles11\u0024ConceptoConsumoDeCombustibles": consumodecombustibles11ConceptoConsumoDeCombustibles!.toJson(),
    };
}
class Consumodecombustibles11ConceptoConsumoDeCombustibles {
    Consumodecombustibles11ConceptoConsumoDeCombustibles({
        this.identificador,
        this.fecha,
        this.rfc,
        this.claveEstacion,
        this.tipoCombustible,
        this.cantidad,
        this.nombreCombustible,
        this.folioOperacion,
        this.valorUnitario,
        this.importe,
        this.consumodecombustibles11Determinados,
    });

    String? identificador;
    DateTime? fecha;
    String? rfc;
    String? claveEstacion;
    String? tipoCombustible;
    String? cantidad;
    String? nombreCombustible;
    String? folioOperacion;
    String? valorUnitario;
    String? importe;
    Consumodecombustibles11Determinados? consumodecombustibles11Determinados;

    factory Consumodecombustibles11ConceptoConsumoDeCombustibles.fromJson(Map<String, dynamic> json) => Consumodecombustibles11ConceptoConsumoDeCombustibles(
        identificador: json["identificador"],
        fecha: DateTime.parse(json["fecha"]),
        rfc: json["rfc"],
        claveEstacion: json["claveEstacion"],
        tipoCombustible: json["tipoCombustible"],
        cantidad: json["cantidad"],
        nombreCombustible: json["nombreCombustible"],
        folioOperacion: json["folioOperacion"],
        valorUnitario: json["valorUnitario"],
        importe: json["importe"],
        consumodecombustibles11Determinados: Consumodecombustibles11Determinados.fromJson(json["consumodecombustibles11\u0024Determinados"]),
    );

    Map<String, dynamic> toJson() => {
        "identificador": identificador,
        "fecha": fecha!.toIso8601String(),
        "rfc": rfc,
        "claveEstacion": claveEstacion,
        "tipoCombustible": tipoCombustible,
        "cantidad": cantidad,
        "nombreCombustible": nombreCombustible,
        "folioOperacion": folioOperacion,
        "valorUnitario": valorUnitario,
        "importe": importe,
        "consumodecombustibles11\u0024Determinados": consumodecombustibles11Determinados!.toJson(),
    };
}
class Consumodecombustibles11Determinados {
    Consumodecombustibles11Determinados({
        this.consumodecombustibles11Determinado,
    });

    Consumodecombustibles11Determinado? consumodecombustibles11Determinado;

    factory Consumodecombustibles11Determinados.fromJson(Map<String, dynamic> json) => Consumodecombustibles11Determinados(
        consumodecombustibles11Determinado: Consumodecombustibles11Determinado.fromJson(json["consumodecombustibles11\u0024Determinado"]),
    );

    Map<String, dynamic> toJson() => {
        "consumodecombustibles11\u0024Determinado": consumodecombustibles11Determinado!.toJson(),
    };
}
class Consumodecombustibles11Determinado {
    Consumodecombustibles11Determinado({
      this.impuesto,
      this.tasaOCuota,
      this.importe,
    });

    String? impuesto;
    String? tasaOCuota;
    String? importe;

    factory Consumodecombustibles11Determinado.fromJson(Map<String, dynamic> json) => Consumodecombustibles11Determinado(
        impuesto: json["impuesto"],
        tasaOCuota: json["tasaOCuota"],
        importe: json["importe"],
    );

    Map<String, dynamic> toJson() => {
        "impuesto": impuesto,
        "tasaOCuota": tasaOCuota,
        "importe": importe,
    };
}
//EndRegion

//#Region Complemento Donatarias
class DonatDonatarias {
    DonatDonatarias({
      this.version,
      this.noAutorizacion,
      this.fechaAutorizacion,
      this.leyenda,
    });

    String? version;
    String? noAutorizacion;
    DateTime? fechaAutorizacion;
    String? leyenda;

    factory DonatDonatarias.fromJson(Map<String, dynamic> json) => DonatDonatarias(
        version: json["version"],
        noAutorizacion: json["noAutorizacion"],
        fechaAutorizacion: DateTime.parse(json["fechaAutorizacion"]),
        leyenda: json["leyenda"],
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "noAutorizacion": noAutorizacion,
        "fechaAutorizacion": "${fechaAutorizacion!.year.toString().padLeft(4, '0')}-${fechaAutorizacion!.month.toString().padLeft(2, '0')}-${fechaAutorizacion!.day.toString().padLeft(2, '0')}",
        "leyenda": leyenda,
    };
}
//EndRegion

//#Region Complemento Consumo de Combustibles 12
class Ecc12EstadoDeCuentaCombustible {
    Ecc12EstadoDeCuentaCombustible({
        this.numeroDeCuenta,
        this.subTotal,
        this.tipoOperacion,
        this.total,
        this.version,
        this.ecc12Conceptos,
    });

    String? numeroDeCuenta;
    String? subTotal;
    String? tipoOperacion;
    String? total;
    String? version;
    Ecc12Conceptos? ecc12Conceptos;

    factory Ecc12EstadoDeCuentaCombustible.fromJson(Map<String, dynamic> json) => Ecc12EstadoDeCuentaCombustible(
        numeroDeCuenta: json["NumeroDeCuenta"],
        subTotal: json["SubTotal"],
        tipoOperacion: json["TipoOperacion"],
        total: json["Total"],
        version: json["Version"],
        ecc12Conceptos: Ecc12Conceptos.fromJson(json["ecc12\u0024Conceptos"]),
    );

    Map<String, dynamic> toJson() => {
        "NumeroDeCuenta": numeroDeCuenta,
        "SubTotal": subTotal,
        "TipoOperacion": tipoOperacion,
        "Total": total,
        "Version": version,
        "ecc12\u0024Conceptos": ecc12Conceptos!.toJson(),
    };
}
class Ecc12Conceptos {
    Ecc12Conceptos({
        this.ecc12ConceptoEstadoDeCuentaCombustible,
    });

    List<Ecc12ConceptoEstadoDeCuentaCombustible>? ecc12ConceptoEstadoDeCuentaCombustible;

    factory Ecc12Conceptos.fromJson(Map<String, dynamic> json) => Ecc12Conceptos(
        ecc12ConceptoEstadoDeCuentaCombustible: List<Ecc12ConceptoEstadoDeCuentaCombustible>.from(json["ecc12\u0024ConceptoEstadoDeCuentaCombustible"].map((x) => Ecc12ConceptoEstadoDeCuentaCombustible.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ecc12\u0024ConceptoEstadoDeCuentaCombustible": List<dynamic>.from(ecc12ConceptoEstadoDeCuentaCombustible!.map((x) => x.toJson())),
    };
}
class Ecc12ConceptoEstadoDeCuentaCombustible {
    Ecc12ConceptoEstadoDeCuentaCombustible({
        this.cantidad,
        this.claveEstacion,
        this.fecha,
        this.folioOperacion,
        this.identificador,
        this.importe,
        this.nombreCombustible,
        this.rfc,
        this.tipoCombustible,
        this.unidad,
        this.valorUnitario,
        this.ecc12Traslados,
    });

    String? cantidad;
    String? claveEstacion;
    DateTime? fecha;
    String? folioOperacion;
    String? identificador;
    String? importe;
    String? nombreCombustible;
    String? rfc;
    String? tipoCombustible;
    String? unidad;
    String? valorUnitario;
    Ecc12Traslados? ecc12Traslados;

    factory Ecc12ConceptoEstadoDeCuentaCombustible.fromJson(Map<String, dynamic> json) => Ecc12ConceptoEstadoDeCuentaCombustible(
        cantidad: json["Cantidad"],
        claveEstacion: json["ClaveEstacion"],
        fecha: DateTime.parse(json["Fecha"]),
        folioOperacion: json["FolioOperacion"],
        identificador: json["Identificador"],
        importe: json["Importe"],
        nombreCombustible: json["NombreCombustible"],
        rfc: json["Rfc"],
        tipoCombustible: json["TipoCombustible"],
        unidad: json["Unidad"],
        valorUnitario: json["ValorUnitario"],
        ecc12Traslados: Ecc12Traslados.fromJson(json["ecc12\u0024Traslados"]),
    );

    Map<String, dynamic> toJson() => {
        "Cantidad": cantidad,
        "ClaveEstacion": claveEstacion,
        "Fecha": fecha!.toIso8601String(),
        "FolioOperacion": folioOperacion,
        "Identificador": identificador,
        "Importe": importe,
        "NombreCombustible": nombreCombustible,
        "Rfc": rfc,
        "TipoCombustible": tipoCombustible,
        "Unidad": unidad,
        "ValorUnitario": valorUnitario,
        "ecc12\u0024Traslados": ecc12Traslados!.toJson(),
    };
}
class Ecc12Traslados {
    Ecc12Traslados({
        this.ecc12Traslado,
    });

    List<Ecc12Traslado>? ecc12Traslado;

    factory Ecc12Traslados.fromJson(Map<String, dynamic> json) => Ecc12Traslados(
        ecc12Traslado: List<Ecc12Traslado>.from(json["ecc12\u0024Traslado"].map((x) => Ecc12Traslado.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ecc12\u0024Traslado": List<dynamic>.from(ecc12Traslado!.map((x) => x.toJson())),
    };
}
class Ecc12Traslado {
    Ecc12Traslado({
        this.importe,
        this.impuesto,
        this.tasaOCuota,
    });

    String? importe;
    String? impuesto;
    String? tasaOCuota;

    factory Ecc12Traslado.fromJson(Map<String, dynamic> json) => Ecc12Traslado(
        importe: json["Importe"],
        impuesto: json["Impuesto"],
        tasaOCuota: json["TasaOCuota"],
    );

    Map<String, dynamic> toJson() => {
        "Importe": importe,
        "Impuesto": impuesto,
        "TasaOCuota": tasaOCuota,
    };
}
//EndRegion

//#Region Complemento Hidrocarburos Gastos
class GcehGastosHidrocarburos {
    GcehGastosHidrocarburos({
        this.version,
        this.areaContractual,
        this.numeroContrato,
        this.gcehErogacion,
    });

    String? version;
    String? areaContractual;
    String? numeroContrato;
    List<GcehErogacion>? gcehErogacion;

    factory GcehGastosHidrocarburos.fromJson(Map<String, dynamic> json) => GcehGastosHidrocarburos(
        version: json["Version"],
        areaContractual: json["AreaContractual"],
        numeroContrato: json["NumeroContrato"],
        gcehErogacion: List<GcehErogacion>.from(json["gceh\u0024Erogacion"].map((x) => GcehErogacion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "AreaContractual": areaContractual,
        "NumeroContrato": numeroContrato,
        "gceh\u0024Erogacion": List<dynamic>.from(gcehErogacion!.map((x) => x.toJson())),
    };
}
class GcehErogacion {
    GcehErogacion({
        this.montocuErogacion,
        this.porcentaje,
        this.tipoErogacion,
        this.gcehDocumentoRelacionado,
        this.gcehActividades,
        this.gcehCentroCostos,
    });

    String? montocuErogacion;
    String? porcentaje;
    String? tipoErogacion;
    List<GcehDocumentoRelacionado>? gcehDocumentoRelacionado;
    List<GcehActividade>? gcehActividades;
    List<GcehCentroCosto>? gcehCentroCostos;

    factory GcehErogacion.fromJson(Map<String, dynamic> json) => GcehErogacion(
        montocuErogacion: json["MontocuErogacion"],
        porcentaje: json["Porcentaje"],
        tipoErogacion: json["TipoErogacion"],
        gcehDocumentoRelacionado: json["gceh\u0024DocumentoRelacionado"] == null ? [] : List<GcehDocumentoRelacionado>.from(json["gceh\u0024DocumentoRelacionado"]!.map((x) => GcehDocumentoRelacionado.fromJson(x))),
        gcehActividades: json["gceh\u0024Actividades"] == null ? [] : List<GcehActividade>.from(json["gceh\u0024Actividades"]!.map((x) => GcehActividade.fromJson(x))),
        gcehCentroCostos: json["gceh\u0024CentroCostos"] == null ? [] : List<GcehCentroCosto>.from(json["gceh\u0024CentroCostos"]!.map((x) => GcehCentroCosto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "MontocuErogacion": montocuErogacion,
        "Porcentaje": porcentaje,
        "TipoErogacion": tipoErogacion,
        "gceh\u0024DocumentoRelacionado": gcehDocumentoRelacionado == null ? [] : List<dynamic>.from(gcehDocumentoRelacionado!.map((x) => x.toJson())),
        "gceh\u0024Actividades": gcehActividades == null ? [] : List<dynamic>.from(gcehActividades!.map((x) => x.toJson())),
        "gceh\u0024CentroCostos": gcehCentroCostos == null ? [] : List<dynamic>.from(gcehCentroCostos!.map((x) => x.toJson())),
    };
}
class GcehActividade {
    GcehActividade({
        this.actividadRelacionada,
        this.gcehSubActividades,
    });

    String? actividadRelacionada;
    List<GcehSubActividade>? gcehSubActividades;

    factory GcehActividade.fromJson(Map<String, dynamic> json) => GcehActividade(
        actividadRelacionada: json["ActividadRelacionada"],
        gcehSubActividades: json["gceh\u0024SubActividades"] == null ? [] : List<GcehSubActividade>.from(json["gceh\u0024SubActividades"]!.map((x) => GcehSubActividade.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ActividadRelacionada": actividadRelacionada,
        "gceh\u0024SubActividades": gcehSubActividades == null ? [] : List<dynamic>.from(gcehSubActividades!.map((x) => x.toJson())),
    };
}
class GcehSubActividade {
    GcehSubActividade({
        this.subActividadRelacionada,
        this.gcehTareas,
    });

    String? subActividadRelacionada;
    List<GcehTarea>? gcehTareas;

    factory GcehSubActividade.fromJson(Map<String, dynamic> json) => GcehSubActividade(
        subActividadRelacionada: json["SubActividadRelacionada"],
        gcehTareas: List<GcehTarea>.from(json["gceh\u0024Tareas"].map((x) => GcehTarea.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "SubActividadRelacionada": subActividadRelacionada,
        "gceh\u0024Tareas": List<dynamic>.from(gcehTareas!.map((x) => x.toJson())),
    };
}
class GcehTarea {
    GcehTarea({
        this.tareaRelacionada,
    });

    String? tareaRelacionada;

    factory GcehTarea.fromJson(Map<String, dynamic> json) => GcehTarea(
        tareaRelacionada: json["TareaRelacionada"],
    );

    Map<String, dynamic> toJson() => {
        "TareaRelacionada": tareaRelacionada,
    };
}
class GcehCentroCosto {
    GcehCentroCosto({
        this.campo,
        this.gcehYacimientos,
    });

    String? campo;
    List<GcehYacimiento>? gcehYacimientos;

    factory GcehCentroCosto.fromJson(Map<String, dynamic> json) => GcehCentroCosto(
        campo: json["Campo"],
        gcehYacimientos: json["gceh\u0024Yacimientos"] == null ? [] : List<GcehYacimiento>.from(json["gceh\u0024Yacimientos"]!.map((x) => GcehYacimiento.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Campo": campo,
        "gceh\u0024Yacimientos": gcehYacimientos == null ? [] : List<dynamic>.from(gcehYacimientos!.map((x) => x.toJson())),
    };
}
class GcehYacimiento {
    GcehYacimiento({
        this.yacimiento,
        this.gcehPozos,
    });

    String? yacimiento;
    List<GcehPozo>? gcehPozos;

    factory GcehYacimiento.fromJson(Map<String, dynamic> json) => GcehYacimiento(
        yacimiento: json["Yacimiento"],
        gcehPozos: List<GcehPozo>.from(json["gceh\u0024Pozos"].map((x) => GcehPozo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Yacimiento": yacimiento,
        "gceh\u0024Pozos": List<dynamic>.from(gcehPozos!.map((x) => x.toJson())),
    };
}
class GcehPozo {
    GcehPozo({
        this.pozo,
    });

    String? pozo;

    factory GcehPozo.fromJson(Map<String, dynamic> json) => GcehPozo(
        pozo: json["Pozo"],
    );

    Map<String, dynamic> toJson() => {
        "Pozo": pozo,
    };
}
class GcehDocumentoRelacionado {
    GcehDocumentoRelacionado({
        this.clavePagoPedimentoVinculado,
        this.fechaFolioFiscalVinculado,
        this.mes,
        this.montoTotalErogaciones,
        this.montoTotalIva,
        this.origenErogacion,
    });

    String? clavePagoPedimentoVinculado;
    String? fechaFolioFiscalVinculado;
    String? mes;
    String? montoTotalErogaciones;
    String? montoTotalIva;
    String? origenErogacion;

    factory GcehDocumentoRelacionado.fromJson(Map<String, dynamic> json) => GcehDocumentoRelacionado(
        clavePagoPedimentoVinculado: json["ClavePagoPedimentoVinculado"],
        fechaFolioFiscalVinculado: json["FechaFolioFiscalVinculado"],
        mes: json["Mes"],
        montoTotalErogaciones: json["MontoTotalErogaciones"],
        montoTotalIva: json["MontoTotalIVA"],
        origenErogacion: json["OrigenErogacion"],
    );

    Map<String, dynamic> toJson() => {
        "ClavePagoPedimentoVinculado": clavePagoPedimentoVinculado,
        "FechaFolioFiscalVinculado": fechaFolioFiscalVinculado,
        "Mes": mes,
        "MontoTotalErogaciones": montoTotalErogaciones,
        "MontoTotalIVA": montoTotalIva,
        "OrigenErogacion": origenErogacion,
    };
}
//EndRegion

//#Region Complemento Hidrocarburos Ingresos
class IeehIngresosHidrocarburos {
    IeehIngresosHidrocarburos({
        this.version,
        this.porcentaje,
        this.contraprestacionPagadaOperador,
        this.numeroContrato,
        this.ieehDocumentoRelacionado,
    });

    String? version;
    String? porcentaje;
    String? contraprestacionPagadaOperador;
    String? numeroContrato;
    IeehDocumentoRelacionado? ieehDocumentoRelacionado;

    factory IeehIngresosHidrocarburos.fromJson(Map<String, dynamic> json) => IeehIngresosHidrocarburos(
        version: json["Version"],
        porcentaje: json["Porcentaje"],
        contraprestacionPagadaOperador: json["ContraprestacionPagadaOperador"],
        numeroContrato: json["NumeroContrato"],
        ieehDocumentoRelacionado: IeehDocumentoRelacionado.fromJson(json["ieeh\u0024DocumentoRelacionado"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "Porcentaje": porcentaje,
        "ContraprestacionPagadaOperador": contraprestacionPagadaOperador,
        "NumeroContrato": numeroContrato,
        "ieeh\u0024DocumentoRelacionado": ieehDocumentoRelacionado!.toJson(),
    };
}
class IeehDocumentoRelacionado {
    IeehDocumentoRelacionado({
        this.fechaFolioFiscalVinculado,
        this.folioFiscalVinculado,
        this.mes,
    });

    DateTime? fechaFolioFiscalVinculado;
    String? folioFiscalVinculado;
    String? mes;

    factory IeehDocumentoRelacionado.fromJson(Map<String, dynamic> json) => IeehDocumentoRelacionado(
        fechaFolioFiscalVinculado: DateTime.parse(json["FechaFolioFiscalVinculado"]),
        folioFiscalVinculado: json["FolioFiscalVinculado"],
        mes: json["Mes"],
    );

    Map<String, dynamic> toJson() => {
        "FechaFolioFiscalVinculado": "${fechaFolioFiscalVinculado!.year.toString().padLeft(4, '0')}-${fechaFolioFiscalVinculado!.month.toString().padLeft(2, '0')}-${fechaFolioFiscalVinculado!.day.toString().padLeft(2, '0')}",
        "FolioFiscalVinculado": folioFiscalVinculado,
        "Mes": mes,
    };
}
//EndRegion

//#Region Complemento INE
class IneIne {
    IneIne({
        this.version,
        this.tipoProceso,
        this.ineEntidad,
    });

    String? version;
    String? tipoProceso;
    List<IneEntidad>? ineEntidad;

    factory IneIne.fromJson(Map<String, dynamic> json) => IneIne(
        version: json["Version"],
        tipoProceso: json["TipoProceso"],
        ineEntidad: List<IneEntidad>.from(json["ine\u0024Entidad"].map((x) => IneEntidad.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "TipoProceso": tipoProceso,
        "ine\u0024Entidad": List<dynamic>.from(ineEntidad!.map((x) => x.toJson())),
    };
}
class IneEntidad {
    IneEntidad({
        this.claveEntidad,
        this.ambito,
    });

    String? claveEntidad;
    String? ambito;

    factory IneEntidad.fromJson(Map<String, dynamic> json) => IneEntidad(
        claveEntidad: json["ClaveEntidad"],
        ambito: json["Ambito"],
    );

    Map<String, dynamic> toJson() => {
        "ClaveEntidad": claveEntidad,
        "Ambito": ambito,
    };
}
//EndRegion

//#Region Complemento Leyendas Fiscales
class LeyendasFiscLeyendasFiscales {
    LeyendasFiscLeyendasFiscales({
        this.version,
        this.xmlns,
        this.xmlnsLeyendasFisc,
        this.leyendasFiscLeyenda,
    });

    String? version;
    List<Xmln>? xmlns;
    String? xmlnsLeyendasFisc;
    List<LeyendasFiscLeyenda>? leyendasFiscLeyenda;

    factory LeyendasFiscLeyendasFiscales.fromJson(Map<String, dynamic> json) => LeyendasFiscLeyendasFiscales(
        version: json["version"],
        xmlns: List<Xmln>.from(json["xmlns"].map((x) => Xmln.fromJson(x))),
        xmlnsLeyendasFisc: json["xmlns\u0024leyendasFisc"],
        leyendasFiscLeyenda: List<LeyendasFiscLeyenda>.from(json["leyendasFisc\u0024Leyenda"].map((x) => LeyendasFiscLeyenda.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "xmlns": List<dynamic>.from(xmlns!.map((x) => x.toJson())),
        "xmlns\u0024leyendasFisc": xmlnsLeyendasFisc,
        "leyendasFisc\u0024Leyenda": List<dynamic>.from(leyendasFiscLeyenda!.map((x) => x.toJson())),
    };
}
class LeyendasFiscLeyenda {
    LeyendasFiscLeyenda({
        this.disposicionFiscal,
        this.norma,
        this.textoLeyenda,
    });

    String? disposicionFiscal;
    String? norma;
    String? textoLeyenda;

    factory LeyendasFiscLeyenda.fromJson(Map<String, dynamic> json) => LeyendasFiscLeyenda(
        disposicionFiscal: json["disposicionFiscal"],
        norma: json["norma"],
        textoLeyenda: json["textoLeyenda"],
    );

    Map<String, dynamic> toJson() => {
        "disposicionFiscal": disposicionFiscal,
        "norma": norma,
        "textoLeyenda": textoLeyenda,
    };
}
//EndRegion

//#Region Complemento Notarios Públicos
class NotariospublicosNotariosPublicos {
    NotariospublicosNotariosPublicos({
        this.version,
        this.notariospublicosDescInmuebles,
        this.notariospublicosDatosOperacion,
        this.notariospublicosDatosNotario,
        this.notariospublicosDatosEnajenante,
        this.notariospublicosDatosAdquiriente,
    });

    String? version;
    NotariospublicosDescInmuebles? notariospublicosDescInmuebles;
    NotariospublicosDatosOperacion? notariospublicosDatosOperacion;
    NotariospublicosDatosNotario? notariospublicosDatosNotario;
    NotariospublicosDatosEnajenante? notariospublicosDatosEnajenante;
    NotariospublicosDatosAdquiriente? notariospublicosDatosAdquiriente;

    factory NotariospublicosNotariosPublicos.fromJson(Map<String, dynamic> json) => NotariospublicosNotariosPublicos(
        version: json["Version"],
        notariospublicosDescInmuebles: NotariospublicosDescInmuebles.fromJson(json["notariospublicos\u0024DescInmuebles"]),
        notariospublicosDatosOperacion: NotariospublicosDatosOperacion.fromJson(json["notariospublicos\u0024DatosOperacion"]),
        notariospublicosDatosNotario: NotariospublicosDatosNotario.fromJson(json["notariospublicos\u0024DatosNotario"]),
        notariospublicosDatosEnajenante: NotariospublicosDatosEnajenante.fromJson(json["notariospublicos\u0024DatosEnajenante"]),
        notariospublicosDatosAdquiriente: NotariospublicosDatosAdquiriente.fromJson(json["notariospublicos\u0024DatosAdquiriente"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "notariospublicos\u0024DescInmuebles": notariospublicosDescInmuebles!.toJson(),
        "notariospublicos\u0024DatosOperacion": notariospublicosDatosOperacion!.toJson(),
        "notariospublicos\u0024DatosNotario": notariospublicosDatosNotario!.toJson(),
        "notariospublicos\u0024DatosEnajenante": notariospublicosDatosEnajenante!.toJson(),
        "notariospublicos\u0024DatosAdquiriente": notariospublicosDatosAdquiriente!.toJson(),
    };
}
class NotariospublicosDatosAdquiriente {
    NotariospublicosDatosAdquiriente({
        this.coproSocConyugalE,
        this.notariospublicosDatosAdquirientesCopSc,
    });

    String? coproSocConyugalE;
    NotariospublicosDatosAdquirientesCopSc? notariospublicosDatosAdquirientesCopSc;

    factory NotariospublicosDatosAdquiriente.fromJson(Map<String, dynamic> json) => NotariospublicosDatosAdquiriente(
        coproSocConyugalE: json["CoproSocConyugalE"],
        notariospublicosDatosAdquirientesCopSc: NotariospublicosDatosAdquirientesCopSc.fromJson(json["notariospublicos\u0024DatosAdquirientesCopSC"]),
    );

    Map<String, dynamic> toJson() => {
        "CoproSocConyugalE": coproSocConyugalE,
        "notariospublicos\u0024DatosAdquirientesCopSC": notariospublicosDatosAdquirientesCopSc!.toJson(),
    };
}
class NotariospublicosDatosAdquirientesCopSc {
    NotariospublicosDatosAdquirientesCopSc({
        this.notariospublicosDatosAdquirienteCopSc,
    });

    List<NotariospublicosDatosAdquirienteCopSc>? notariospublicosDatosAdquirienteCopSc;

    factory NotariospublicosDatosAdquirientesCopSc.fromJson(Map<String, dynamic> json) => NotariospublicosDatosAdquirientesCopSc(
        notariospublicosDatosAdquirienteCopSc: List<NotariospublicosDatosAdquirienteCopSc>.from(json["notariospublicos\u0024DatosAdquirienteCopSC"].map((x) => NotariospublicosDatosAdquirienteCopSc.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "notariospublicos\u0024DatosAdquirienteCopSC": List<dynamic>.from(notariospublicosDatosAdquirienteCopSc!.map((x) => x.toJson())),
    };
}
class NotariospublicosDatosAdquirienteCopSc {
    NotariospublicosDatosAdquirienteCopSc({
        this.nombre,
        this.rfc,
        this.porcentaje,
    });

    String? nombre;
    String? rfc;
    String? porcentaje;

    factory NotariospublicosDatosAdquirienteCopSc.fromJson(Map<String, dynamic> json) => NotariospublicosDatosAdquirienteCopSc(
        nombre: json["Nombre"],
        rfc: json["RFC"],
        porcentaje: json["Porcentaje"],
    );

    Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "RFC": rfc,
        "Porcentaje": porcentaje,
    };
}
class NotariospublicosDatosEnajenante {
    NotariospublicosDatosEnajenante({
        this.coproSocConyugalE,
        this.notariospublicosDatosUnEnajenante,
    });

    String? coproSocConyugalE;
    NotariospublicosDatosUnEnajenante? notariospublicosDatosUnEnajenante;

    factory NotariospublicosDatosEnajenante.fromJson(Map<String, dynamic> json) => NotariospublicosDatosEnajenante(
        coproSocConyugalE: json["CoproSocConyugalE"],
        notariospublicosDatosUnEnajenante: NotariospublicosDatosUnEnajenante.fromJson(json["notariospublicos\u0024DatosUnEnajenante"]),
    );

    Map<String, dynamic> toJson() => {
        "CoproSocConyugalE": coproSocConyugalE,
        "notariospublicos\u0024DatosUnEnajenante": notariospublicosDatosUnEnajenante!.toJson(),
    };
}
class NotariospublicosDatosUnEnajenante {
    NotariospublicosDatosUnEnajenante({
        this.nombre,
        this.apellidoPaterno,
        this.rfc,
        this.curp,
    });

    String? nombre;
    String? apellidoPaterno;
    String? rfc;
    String? curp;

    factory NotariospublicosDatosUnEnajenante.fromJson(Map<String, dynamic> json) => NotariospublicosDatosUnEnajenante(
        nombre: json["Nombre"],
        apellidoPaterno: json["ApellidoPaterno"],
        rfc: json["RFC"],
        curp: json["CURP"],
    );

    Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "ApellidoPaterno": apellidoPaterno,
        "RFC": rfc,
        "CURP": curp,
    };
}
class NotariospublicosDatosNotario {
    NotariospublicosDatosNotario({
        this.curp,
        this.numNotaria,
        this.entidadFederativa,
    });

    String? curp;
    String? numNotaria;
    String? entidadFederativa;

    factory NotariospublicosDatosNotario.fromJson(Map<String, dynamic> json) => NotariospublicosDatosNotario(
        curp: json["CURP"],
        numNotaria: json["NumNotaria"],
        entidadFederativa: json["EntidadFederativa"],
    );

    Map<String, dynamic> toJson() => {
        "CURP": curp,
        "NumNotaria": numNotaria,
        "EntidadFederativa": entidadFederativa,
    };
}
class NotariospublicosDatosOperacion {
    NotariospublicosDatosOperacion({
        this.numInstrumentoNotarial,
        this.fechaInstNotarial,
        this.montoOperacion,
        this.subtotal,
        this.iva,
    });

    String? numInstrumentoNotarial;
    DateTime? fechaInstNotarial;
    String? montoOperacion;
    String? subtotal;
    String? iva;

    factory NotariospublicosDatosOperacion.fromJson(Map<String, dynamic> json) => NotariospublicosDatosOperacion(
        numInstrumentoNotarial: json["NumInstrumentoNotarial"],
        fechaInstNotarial: DateTime.parse(json["FechaInstNotarial"]),
        montoOperacion: json["MontoOperacion"],
        subtotal: json["Subtotal"],
        iva: json["IVA"],
    );

    Map<String, dynamic> toJson() => {
        "NumInstrumentoNotarial": numInstrumentoNotarial,
        "FechaInstNotarial": "${fechaInstNotarial!.year.toString().padLeft(4, '0')}-${fechaInstNotarial!.month.toString().padLeft(2, '0')}-${fechaInstNotarial!.day.toString().padLeft(2, '0')}",
        "MontoOperacion": montoOperacion,
        "Subtotal": subtotal,
        "IVA": iva,
    };
}
class NotariospublicosDescInmuebles {
    NotariospublicosDescInmuebles({
        this.notariospublicosDescInmueble,
    });

    NotariospublicosDescInmueble? notariospublicosDescInmueble;

    factory NotariospublicosDescInmuebles.fromJson(Map<String, dynamic> json) => NotariospublicosDescInmuebles(
        notariospublicosDescInmueble: NotariospublicosDescInmueble.fromJson(json["notariospublicos\u0024DescInmueble"]),
    );

    Map<String, dynamic> toJson() => {
        "notariospublicos\u0024DescInmueble": notariospublicosDescInmueble!.toJson(),
    };
}
class NotariospublicosDescInmueble {
    NotariospublicosDescInmueble({
        this.tipoInmueble,
        this.calle,
        this.municipio,
        this.estado,
        this.pais,
        this.codigoPostal,
    });

    String? tipoInmueble;
    String? calle;
    String? municipio;
    String? estado;
    String? pais;
    String? codigoPostal;

    factory NotariospublicosDescInmueble.fromJson(Map<String, dynamic> json) => NotariospublicosDescInmueble(
        tipoInmueble: json["TipoInmueble"],
        calle: json["Calle"],
        municipio: json["Municipio"],
        estado: json["Estado"],
        pais: json["Pais"],
        codigoPostal: json["CodigoPostal"],
    );

    Map<String, dynamic> toJson() => {
        "TipoInmueble": tipoInmueble,
        "Calle": calle,
        "Municipio": municipio,
        "Estado": estado,
        "Pais": pais,
        "CodigoPostal": codigoPostal,
    };
}
//EndRegion

//#Region Complemento Obras de Arte Pláscitas y Antiguedades
class ObrasarteObrasarteantiguedades {
    ObrasarteObrasarteantiguedades({
        this.version,
        this.tipoBien,
        this.tituloAdquirido,
        this.subtotal,
        this.iva,
        this.fechaAdquisicion,
        this.caractersticasDeObraoPieza,
    });

    String? version;
    String? tipoBien;
    String? tituloAdquirido;
    String? subtotal;
    String? iva;
    DateTime? fechaAdquisicion;
    String? caractersticasDeObraoPieza;

    factory ObrasarteObrasarteantiguedades.fromJson(Map<String, dynamic> json) => ObrasarteObrasarteantiguedades(
        version: json["Version"],
        tipoBien: json["TipoBien"],
        tituloAdquirido: json["TituloAdquirido"],
        subtotal: json["Subtotal"],
        iva: json["IVA"],
        fechaAdquisicion: DateTime.parse(json["FechaAdquisicion"]),
        caractersticasDeObraoPieza: json["CaracterísticasDeObraoPieza"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "TipoBien": tipoBien,
        "TituloAdquirido": tituloAdquirido,
        "Subtotal": subtotal,
        "IVA": iva,
        "FechaAdquisicion": "${fechaAdquisicion!.year.toString().padLeft(4, '0')}-${fechaAdquisicion!.month.toString().padLeft(2, '0')}-${fechaAdquisicion!.day.toString().padLeft(2, '0')}",
        "CaracterísticasDeObraoPieza": caractersticasDeObraoPieza,
    };
}
//EndRegion

//#Region Complemento Otros Derechos e Impuestos
class ImplocalImpuestosLocales {
    ImplocalImpuestosLocales({
        this.version,
        this.totaldeRetenciones,
        this.totaldeTraslados,
        this.implocalRetencionesLocales,
    });

    String? version;
    String? totaldeRetenciones;
    String? totaldeTraslados;
    List<ImplocalRetencionesLocale>? implocalRetencionesLocales;

    factory ImplocalImpuestosLocales.fromJson(Map<String, dynamic> json) => ImplocalImpuestosLocales(
        version: json["version"],
        totaldeRetenciones: json["TotaldeRetenciones"],
        totaldeTraslados: json["TotaldeTraslados"],
        implocalRetencionesLocales: List<ImplocalRetencionesLocale>.from(json["implocal\u0024RetencionesLocales"].map((x) => ImplocalRetencionesLocale.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "TotaldeRetenciones": totaldeRetenciones,
        "TotaldeTraslados": totaldeTraslados,
        "implocal\u0024RetencionesLocales": List<dynamic>.from(implocalRetencionesLocales!.map((x) => x.toJson())),
    };
}
class ImplocalRetencionesLocale {
    ImplocalRetencionesLocale({
        this.impLocRetenido,
        this.tasadeRetencion,
        this.importe,
    });

    String? impLocRetenido;
    String? tasadeRetencion;
    String? importe;

    factory ImplocalRetencionesLocale.fromJson(Map<String, dynamic> json) => ImplocalRetencionesLocale(
        impLocRetenido: json["ImpLocRetenido"],
        tasadeRetencion: json["TasadeRetencion"],
        importe: json["Importe"],
    );

    Map<String, dynamic> toJson() => {
        "ImpLocRetenido": impLocRetenido,
        "TasadeRetencion": tasadeRetencion,
        "Importe": importe,
    };
}
//EndRegion

//#Region Complemento Pago en Especie
class PagoenespeciePagoEnEspecie {
    PagoenespeciePagoEnEspecie({
        this.version,
        this.cvePic,
        this.folioSolDon,
        this.pzaArtNombre,
        this.pzaArtTecn,
        this.pzaArtAProd,
        this.pzaArtDim,
    });

    String? version;
    String? cvePic;
    String? folioSolDon;
    String? pzaArtNombre;
    String? pzaArtTecn;
    String? pzaArtAProd;
    String? pzaArtDim;

    factory PagoenespeciePagoEnEspecie.fromJson(Map<String, dynamic> json) => PagoenespeciePagoEnEspecie(
        version: json["Version"],
        cvePic: json["CvePIC"],
        folioSolDon: json["FolioSolDon"],
        pzaArtNombre: json["PzaArtNombre"],
        pzaArtTecn: json["PzaArtTecn"],
        pzaArtAProd: json["PzaArtAProd"],
        pzaArtDim: json["PzaArtDim"],
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "CvePIC": cvePic,
        "FolioSolDon": folioSolDon,
        "PzaArtNombre": pzaArtNombre,
        "PzaArtTecn": pzaArtTecn,
        "PzaArtAProd": pzaArtAProd,
        "PzaArtDim": pzaArtDim,
    };
}
//EndRegion

//#Region Complemento Persona Física Integrante de Coordinado
class PficPFintegranteCoordinado {
    PficPFintegranteCoordinado({
        this.version,
        this.claveVehicular,
        this.placa,
        this.rfcpf,
    });

    String? version;
    String? claveVehicular;
    String? placa;
    String? rfcpf;

    factory PficPFintegranteCoordinado.fromJson(Map<String, dynamic> json) => PficPFintegranteCoordinado(
        version: json["version"],
        claveVehicular: json["ClaveVehicular"],
        placa: json["Placa"],
        rfcpf: json["RFCPF"],
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "ClaveVehicular": claveVehicular,
        "Placa": placa,
        "RFCPF": rfcpf,
    };
}
//EndRegion

//#Region Complemento Servicios Parciales de Construcción
class ServicioparcialParcialesconstruccion {
    ServicioparcialParcialesconstruccion({
        this.version,
        this.numPerLicoAut,
        this.servicioparcialInmueble,
    });

    String? version;
    String? numPerLicoAut;
    ServicioparcialInmueble? servicioparcialInmueble;

    factory ServicioparcialParcialesconstruccion.fromJson(Map<String, dynamic> json) => ServicioparcialParcialesconstruccion(
        version: json["Version"],
        numPerLicoAut: json["NumPerLicoAut"],
        servicioparcialInmueble: ServicioparcialInmueble.fromJson(json["servicioparcial\u0024Inmueble"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "NumPerLicoAut": numPerLicoAut,
        "servicioparcial\u0024Inmueble": servicioparcialInmueble!.toJson(),
    };
}
class ServicioparcialInmueble {
    ServicioparcialInmueble({
        this.calle,
        this.codigoPostal,
        this.estado,
        this.municipio,
    });

    String? calle;
    String? codigoPostal;
    String? estado;
    String? municipio;

    factory ServicioparcialInmueble.fromJson(Map<String, dynamic> json) => ServicioparcialInmueble(
        calle: json["Calle"],
        codigoPostal: json["CodigoPostal"],
        estado: json["Estado"],
        municipio: json["Municipio"],
    );

    Map<String, dynamic> toJson() => {
        "Calle": calle,
        "CodigoPostal": codigoPostal,
        "Estado": estado,
        "Municipio": municipio,
    };
}
//EndRegion

//#Region Complemento SPEI Tercero a Tercero
class SpeiComplementoSpei {
    SpeiComplementoSpei({
        this.speiSpeiTercero,
    });

    SpeiSpeiTercero? speiSpeiTercero;

    factory SpeiComplementoSpei.fromJson(Map<String, dynamic> json) => SpeiComplementoSpei(
        speiSpeiTercero: SpeiSpeiTercero.fromJson(json["spei\u0024SPEI_Tercero"]),
    );

    Map<String, dynamic> toJson() => {
        "spei\u0024SPEI_Tercero": speiSpeiTercero!.toJson(),
    };
}
class SpeiSpeiTercero {
    SpeiSpeiTercero({
        this.claveSpei,
        this.fechaOperacion,
        this.hora,
        this.cadenaCda,
        this.numeroCertificado,
        this.sello,
        this.speiOrdenante,
        this.speiBeneficiario,
    });

    String? claveSpei;
    DateTime? fechaOperacion;
    String? hora;
    String? cadenaCda;
    String? numeroCertificado;
    String? sello;
    SpeiOrdenante? speiOrdenante;
    SpeiBeneficiario? speiBeneficiario;

    factory SpeiSpeiTercero.fromJson(Map<String, dynamic> json) => SpeiSpeiTercero(
        claveSpei: json["ClaveSPEI"],
        fechaOperacion: DateTime.parse(json["FechaOperacion"]),
        hora: json["Hora"],
        cadenaCda: json["cadenaCDA"],
        numeroCertificado: json["numeroCertificado"],
        sello: json["sello"],
        speiOrdenante: SpeiOrdenante.fromJson(json["spei\u0024Ordenante"]),
        speiBeneficiario: SpeiBeneficiario.fromJson(json["spei\u0024Beneficiario"]),
    );

    Map<String, dynamic> toJson() => {
        "ClaveSPEI": claveSpei,
        "FechaOperacion": "${fechaOperacion!.year.toString().padLeft(4, '0')}-${fechaOperacion!.month.toString().padLeft(2, '0')}-${fechaOperacion!.day.toString().padLeft(2, '0')}",
        "Hora": hora,
        "cadenaCDA": cadenaCda,
        "numeroCertificado": numeroCertificado,
        "sello": sello,
        "spei\u0024Ordenante": speiOrdenante!.toJson(),
        "spei\u0024Beneficiario": speiBeneficiario!.toJson(),
    };
}
class SpeiBeneficiario {
    SpeiBeneficiario({
        this.bancoReceptor,
        this.nombre,
        this.tipoCuenta,
        this.cuenta,
        this.rfc,
        this.concepto,
        this.iva,
        this.montoPago,
    });

    String? bancoReceptor;
    String? nombre;
    String? tipoCuenta;
    String? cuenta;
    String? rfc;
    String? concepto;
    String? iva;
    String? montoPago;

    factory SpeiBeneficiario.fromJson(Map<String, dynamic> json) => SpeiBeneficiario(
        bancoReceptor: json["BancoReceptor"],
        nombre: json["Nombre"],
        tipoCuenta: json["TipoCuenta"],
        cuenta: json["Cuenta"],
        rfc: json["RFC"],
        concepto: json["Concepto"],
        iva: json["IVA"],
        montoPago: json["MontoPago"],
    );

    Map<String, dynamic> toJson() => {
        "BancoReceptor": bancoReceptor,
        "Nombre": nombre,
        "TipoCuenta": tipoCuenta,
        "Cuenta": cuenta,
        "RFC": rfc,
        "Concepto": concepto,
        "IVA": iva,
        "MontoPago": montoPago,
    };
}
class SpeiOrdenante {
    SpeiOrdenante({
        this.bancoEmisor,
        this.nombre,
        this.cuenta,
        this.rfc,
        this.tipoCuenta,
    });

    String? bancoEmisor;
    String? nombre;
    String? cuenta;
    String? rfc;
    String? tipoCuenta;

    factory SpeiOrdenante.fromJson(Map<String, dynamic> json) => SpeiOrdenante(
        bancoEmisor: json["BancoEmisor"],
        nombre: json["Nombre"],
        cuenta: json["Cuenta"],
        rfc: json["RFC"],
        tipoCuenta: json["TipoCuenta"],
    );

    Map<String, dynamic> toJson() => {
        "BancoEmisor": bancoEmisor,
        "Nombre": nombre,
        "Cuenta": cuenta,
        "RFC": rfc,
        "TipoCuenta": tipoCuenta,
    };
}
//EndRegion

//#Region Complemento Turista Pasajero Extranjero
class TpeTuristaPasajeroExtranjero {
    TpeTuristaPasajeroExtranjero({
        this.version,
        this.fechadeTransito,
        this.tipoTransito,
        this.tpeDatosTransito,
    });

    String? version;
    DateTime? fechadeTransito;
    String? tipoTransito;
    TpeDatosTransito? tpeDatosTransito;

    factory TpeTuristaPasajeroExtranjero.fromJson(Map<String, dynamic> json) => TpeTuristaPasajeroExtranjero(
        version: json["version"],
        fechadeTransito: DateTime.parse(json["fechadeTransito"]),
        tipoTransito: json["tipoTransito"],
        tpeDatosTransito: TpeDatosTransito.fromJson(json["tpe\u0024datosTransito"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "fechadeTransito": fechadeTransito!.toIso8601String(),
        "tipoTransito": tipoTransito,
        "tpe\u0024datosTransito": tpeDatosTransito!.toJson(),
    };
}
class TpeDatosTransito {
    TpeDatosTransito({
        this.via,
        this.tipoId,
        this.numeroId,
        this.nacionalidad,
        this.empresaTransporte,
        this.idTransporte,
    });

    String? via;
    String? tipoId;
    String? numeroId;
    String? nacionalidad;
    String? empresaTransporte;
    String? idTransporte;

    factory TpeDatosTransito.fromJson(Map<String, dynamic> json) => TpeDatosTransito(
        via: json["Via"],
        tipoId: json["TipoId"],
        numeroId: json["NumeroId"],
        nacionalidad: json["Nacionalidad"],
        empresaTransporte: json["EmpresaTransporte"],
        idTransporte: json["IdTransporte"],
    );

    Map<String, dynamic> toJson() => {
        "Via": via,
        "TipoId": tipoId,
        "NumeroId": numeroId,
        "Nacionalidad": nacionalidad,
        "EmpresaTransporte": empresaTransporte,
        "IdTransporte": idTransporte,
    };
}
//EndRegion

//#Region Complemento Vales de Despensa
class ValesdedespensaValesDeDespensa {
    ValesdedespensaValesDeDespensa({
        this.version,
        this.tipoOperacion,
        this.registroPatronal,
        this.numeroDeCuenta,
        this.total,
        this.valesdedespensaConceptos,
    });

    String? version;
    String? tipoOperacion;
    String? registroPatronal;
    String? numeroDeCuenta;
    String? total;
    ValesdedespensaConceptos? valesdedespensaConceptos;

    factory ValesdedespensaValesDeDespensa.fromJson(Map<String, dynamic> json) => ValesdedespensaValesDeDespensa(
        version: json["version"],
        tipoOperacion: json["tipoOperacion"],
        registroPatronal: json["registroPatronal"],
        numeroDeCuenta: json["numeroDeCuenta"],
        total: json["total"],
        valesdedespensaConceptos: ValesdedespensaConceptos.fromJson(json["valesdedespensa\u0024Conceptos"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "tipoOperacion": tipoOperacion,
        "registroPatronal": registroPatronal,
        "numeroDeCuenta": numeroDeCuenta,
        "total": total,
        "valesdedespensa\u0024Conceptos": valesdedespensaConceptos!.toJson(),
    };
}
class ValesdedespensaConceptos {
    ValesdedespensaConceptos({
        this.valesdedespensaConcepto,
    });

    List<ValesdedespensaConcepto>? valesdedespensaConcepto;

    factory ValesdedespensaConceptos.fromJson(Map<String, dynamic> json) => ValesdedespensaConceptos(
        valesdedespensaConcepto: List<ValesdedespensaConcepto>.from(json["valesdedespensa\u0024Concepto"].map((x) => ValesdedespensaConcepto.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "valesdedespensa\u0024Concepto": List<dynamic>.from(valesdedespensaConcepto!.map((x) => x.toJson())),
    };
}
class ValesdedespensaConcepto {
    ValesdedespensaConcepto({
        this.identificador,
        this.fecha,
        this.rfc,
        this.curp,
        this.nombre,
        this.numSeguridadSocial,
        this.importe,
    });

    String? identificador;
    DateTime? fecha;
    String? rfc;
    String? curp;
    String? nombre;
    String? numSeguridadSocial;
    String? importe;

    factory ValesdedespensaConcepto.fromJson(Map<String, dynamic> json) => ValesdedespensaConcepto(
        identificador: json["identificador"],
        fecha: DateTime.parse(json["fecha"]),
        rfc: json["rfc"],
        curp: json["curp"],
        nombre: json["nombre"],
        numSeguridadSocial: json["numSeguridadSocial"],
        importe: json["importe"],
    );

    Map<String, dynamic> toJson() => {
        "identificador": identificador,
        "fecha": fecha!.toIso8601String(),
        "rfc": rfc,
        "curp": curp,
        "nombre": nombre,
        "numSeguridadSocial": numSeguridadSocial,
        "importe": importe,
    };
}
//EndRegion

//#Region Complemento Venta de Vehiculo Usado
class VehiculousadoVehiculoUsado {
    VehiculousadoVehiculoUsado({
        this.version,
        this.montoAdquisicion,
        this.montoEnajenacion,
        this.claveVehicular,
        this.marca,
        this.tipo,
        this.modelo,
        this.numeroMotor,
        this.numeroSerie,
        this.niv,
        this.valor,
        this.vehiculousadoInformacionAduanera,
    });

    String? version;
    String? montoAdquisicion;
    String? montoEnajenacion;
    String? claveVehicular;
    String? marca;
    String? tipo;
    String? modelo;
    String? numeroMotor;
    String? numeroSerie;
    String? niv;
    String? valor;
    VehiculousadoInformacionAduanera? vehiculousadoInformacionAduanera;

    factory VehiculousadoVehiculoUsado.fromJson(Map<String, dynamic> json) => VehiculousadoVehiculoUsado(
        version: json["Version"],
        montoAdquisicion: json["montoAdquisicion"],
        montoEnajenacion: json["montoEnajenacion"],
        claveVehicular: json["claveVehicular"],
        marca: json["marca"],
        tipo: json["tipo"],
        modelo: json["modelo"],
        numeroMotor: json["numeroMotor"],
        numeroSerie: json["numeroSerie"],
        niv: json["NIV"],
        valor: json["valor"],
        vehiculousadoInformacionAduanera: VehiculousadoInformacionAduanera.fromJson(json["vehiculousado\u0024InformacionAduanera"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "montoAdquisicion": montoAdquisicion,
        "montoEnajenacion": montoEnajenacion,
        "claveVehicular": claveVehicular,
        "marca": marca,
        "tipo": tipo,
        "modelo": modelo,
        "numeroMotor": numeroMotor,
        "numeroSerie": numeroSerie,
        "NIV": niv,
        "valor": valor,
        "vehiculousado\u0024InformacionAduanera": vehiculousadoInformacionAduanera!.toJson(),
    };
}
class VehiculousadoInformacionAduanera {
    VehiculousadoInformacionAduanera({
        this.numero,
        this.fecha,
        this.aduana,
    });

    String? numero;
    DateTime? fecha;
    String? aduana;

    factory VehiculousadoInformacionAduanera.fromJson(Map<String, dynamic> json) => VehiculousadoInformacionAduanera(
        numero: json["numero"],
        fecha: DateTime.parse(json["fecha"]),
        aduana: json["aduana"],
    );

    Map<String, dynamic> toJson() => {
        "numero": numero,
        "fecha": "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "aduana": aduana,
    };
}
//EndRegion

//#Region Complemento Estado de Cuenta Combustible 11
class Ecc11EstadoDeCuentaCombustible {
    Ecc11EstadoDeCuentaCombustible({
        this.version,
        this.tipoOperacion,
        this.numeroDeCuenta,
        this.subTotal,
        this.total,
        this.ecc11Conceptos,
    });

    String? version;
    String? tipoOperacion;
    String? numeroDeCuenta;
    String? subTotal;
    String? total;
    Ecc11Conceptos? ecc11Conceptos;

    factory Ecc11EstadoDeCuentaCombustible.fromJson(Map<String, dynamic> json) => Ecc11EstadoDeCuentaCombustible(
        version: json["Version"],
        tipoOperacion: json["TipoOperacion"],
        numeroDeCuenta: json["NumeroDeCuenta"],
        subTotal: json["SubTotal"],
        total: json["Total"],
        ecc11Conceptos: Ecc11Conceptos.fromJson(json["ecc11\u0024Conceptos"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "TipoOperacion": tipoOperacion,
        "NumeroDeCuenta": numeroDeCuenta,
        "SubTotal": subTotal,
        "Total": total,
        "ecc11\u0024Conceptos": ecc11Conceptos!.toJson(),
    };
}
class Ecc11Conceptos {
    Ecc11Conceptos({
        this.ecc11ConceptoEstadoDeCuentaCombustible,
    });

    Ecc11ConceptoEstadoDeCuentaCombustible? ecc11ConceptoEstadoDeCuentaCombustible;

    factory Ecc11Conceptos.fromJson(Map<String, dynamic> json) => Ecc11Conceptos(
        ecc11ConceptoEstadoDeCuentaCombustible: Ecc11ConceptoEstadoDeCuentaCombustible.fromJson(json["ecc11\u0024ConceptoEstadoDeCuentaCombustible"]),
    );

    Map<String, dynamic> toJson() => {
        "ecc11\u0024ConceptoEstadoDeCuentaCombustible": ecc11ConceptoEstadoDeCuentaCombustible!.toJson(),
    };
}
class Ecc11ConceptoEstadoDeCuentaCombustible {
    Ecc11ConceptoEstadoDeCuentaCombustible({
        this.identificador,
        this.fecha,
        this.rfc,
        this.claveEstacion,
        this.tar,
        this.cantidad,
        this.noIdentificacion,
        this.unidad,
        this.nombreCombustible,
        this.folioOperacion,
        this.valorUnitario,
        this.importe,
        this.ecc11Traslados,
    });

    String? identificador;
    DateTime? fecha;
    String? rfc;
    String? claveEstacion;
    String? tar;
    String? cantidad;
    String? noIdentificacion;
    String? unidad;
    String? nombreCombustible;
    String? folioOperacion;
    String? valorUnitario;
    String? importe;
    Ecc11Traslados? ecc11Traslados;

    factory Ecc11ConceptoEstadoDeCuentaCombustible.fromJson(Map<String, dynamic> json) => Ecc11ConceptoEstadoDeCuentaCombustible(
        identificador: json["Identificador"],
        fecha: DateTime.parse(json["Fecha"]),
        rfc: json["Rfc"],
        claveEstacion: json["ClaveEstacion"],
        tar: json["TAR"],
        cantidad: json["Cantidad"],
        noIdentificacion: json["NoIdentificacion"],
        unidad: json["Unidad"],
        nombreCombustible: json["NombreCombustible"],
        folioOperacion: json["FolioOperacion"],
        valorUnitario: json["ValorUnitario"],
        importe: json["Importe"],
        ecc11Traslados: Ecc11Traslados.fromJson(json["ecc11\u0024Traslados"]),
    );

    Map<String, dynamic> toJson() => {
        "Identificador": identificador,
        "Fecha": fecha!.toIso8601String(),
        "Rfc": rfc,
        "ClaveEstacion": claveEstacion,
        "TAR": tar,
        "Cantidad": cantidad,
        "NoIdentificacion": noIdentificacion,
        "Unidad": unidad,
        "NombreCombustible": nombreCombustible,
        "FolioOperacion": folioOperacion,
        "ValorUnitario": valorUnitario,
        "Importe": importe,
        "ecc11\u0024Traslados": ecc11Traslados!.toJson(),
    };
}
class Ecc11Traslados {
    Ecc11Traslados({
        this.ecc11Traslado,
    });

    List<Ecc11Traslado>? ecc11Traslado;

    factory Ecc11Traslados.fromJson(Map<String, dynamic> json) => Ecc11Traslados(
        ecc11Traslado: List<Ecc11Traslado>.from(json["ecc11\u0024Traslado"].map((x) => Ecc11Traslado.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ecc11\u0024Traslado": List<dynamic>.from(ecc11Traslado!.map((x) => x.toJson())),
    };
}
class Ecc11Traslado {
    Ecc11Traslado({
        this.impuesto,
        this.tasaoCuota,
        this.importe,
    });

    String? impuesto;
    String? tasaoCuota;
    String? importe;

    factory Ecc11Traslado.fromJson(Map<String, dynamic> json) => Ecc11Traslado(
        impuesto: json["Impuesto"],
        tasaoCuota: json["TasaoCuota"],
        importe: json["Importe"],
    );

    Map<String, dynamic> toJson() => {
        "Impuesto": impuesto,
        "TasaoCuota": tasaoCuota,
        "Importe": importe,
    };
}
//EndRegion

//#Region Complemento renovacion y sustitucion de vehiculos
class DecretoRenovacionysustitucionvehiculos {
    DecretoRenovacionysustitucionvehiculos({
        this.version,
        this.tipoDeDecreto,
        this.decretoDecretoRenovVehicular,
        this.decretoDecretoSustitVehicular,
    });

    String? version;
    String? tipoDeDecreto;
    DecretoDecretoRenovVehicular? decretoDecretoRenovVehicular;
    DecretoDecretoSustitVehicular? decretoDecretoSustitVehicular;

    factory DecretoRenovacionysustitucionvehiculos.fromJson(Map<String, dynamic> json) => DecretoRenovacionysustitucionvehiculos(
        version: json["Version"],
        tipoDeDecreto: json["TipoDeDecreto"],
        decretoDecretoRenovVehicular: DecretoDecretoRenovVehicular.fromJson(json["decreto\u0024DecretoRenovVehicular"]),
        decretoDecretoSustitVehicular: DecretoDecretoSustitVehicular.fromJson(json["decreto\u0024DecretoSustitVehicular"]),
    );

    Map<String, dynamic> toJson() => {
        "Version": version,
        "TipoDeDecreto": tipoDeDecreto,
        "decreto\u0024DecretoRenovVehicular": decretoDecretoRenovVehicular!.toJson(),
        "decreto\u0024DecretoSustitVehicular": decretoDecretoSustitVehicular!.toJson(),
    };
}
class DecretoDecretoRenovVehicular {
    DecretoDecretoRenovVehicular({
        this.vehEnaj,
        this.decretoVehiculosUsadosEnajenadoPermAlFab,
        this.decretoVehiculoNuvoSemEnajenadoFabAlPerm,
    });

    String? vehEnaj;
    DecretoVehiculoEnajenadoPermAlFab? decretoVehiculosUsadosEnajenadoPermAlFab;
    DecretoVehiculoNuvoSemEnajenadoFabAlPerm? decretoVehiculoNuvoSemEnajenadoFabAlPerm;

    factory DecretoDecretoRenovVehicular.fromJson(Map<String, dynamic> json) => DecretoDecretoRenovVehicular(
        vehEnaj: json["VehEnaj"],
        decretoVehiculosUsadosEnajenadoPermAlFab: DecretoVehiculoEnajenadoPermAlFab.fromJson(json["decreto\u0024VehiculosUsadosEnajenadoPermAlFab"]),
        decretoVehiculoNuvoSemEnajenadoFabAlPerm: DecretoVehiculoNuvoSemEnajenadoFabAlPerm.fromJson(json["decreto\u0024VehiculoNuvoSemEnajenadoFabAlPerm"]),
    );

    Map<String, dynamic> toJson() => {
        "VehEnaj": vehEnaj,
        "decreto\u0024VehiculosUsadosEnajenadoPermAlFab": decretoVehiculosUsadosEnajenadoPermAlFab!.toJson(),
        "decreto\u0024VehiculoNuvoSemEnajenadoFabAlPerm": decretoVehiculoNuvoSemEnajenadoFabAlPerm!.toJson(),
    };
}
class DecretoVehiculoNuvoSemEnajenadoFabAlPerm {
    DecretoVehiculoNuvoSemEnajenadoFabAlPerm({
        this.ao,
        this.modelo,
        this.numPlacas,
    });

    String? ao;
    String? modelo;
    String? numPlacas;

    factory DecretoVehiculoNuvoSemEnajenadoFabAlPerm.fromJson(Map<String, dynamic> json) => DecretoVehiculoNuvoSemEnajenadoFabAlPerm(
        ao: json["Año"],
        modelo: json["Modelo"],
        numPlacas: json["NumPlacas"],
    );

    Map<String, dynamic> toJson() => {
        "Año": ao,
        "Modelo": modelo,
        "NumPlacas": numPlacas,
    };
}
class DecretoVehiculoEnajenadoPermAlFab {
    DecretoVehiculoEnajenadoPermAlFab({
        this.precioVehUsado,
        this.tipoVeh,
        this.marca,
        this.tipooClase,
        this.ao,
        this.modelo,
        this.niv,
        this.numSerie,
        this.numPlacas,
        this.numMotor,
        this.numFolTarjCir,
        this.foliofiscal,
        this.numFolAvisoint,
        this.numPedIm,
        this.aduana,
        this.fechaRegulVeh,
    });

    String? precioVehUsado;
    String? tipoVeh;
    String? marca;
    String? tipooClase;
    String? ao;
    String? modelo;
    String? niv;
    String? numSerie;
    String? numPlacas;
    String? numMotor;
    String? numFolTarjCir;
    String? foliofiscal;
    String? numFolAvisoint;
    String? numPedIm;
    String? aduana;
    DateTime? fechaRegulVeh;

    factory DecretoVehiculoEnajenadoPermAlFab.fromJson(Map<String, dynamic> json) => DecretoVehiculoEnajenadoPermAlFab(
        precioVehUsado: json["PrecioVehUsado"],
        tipoVeh: json["TipoVeh"],
        marca: json["Marca"],
        tipooClase: json["TipooClase"],
        ao: json["Año"],
        modelo: json["Modelo"],
        niv: json["NIV"],
        numSerie: json["NumSerie"],
        numPlacas: json["NumPlacas"],
        numMotor: json["NumMotor"],
        numFolTarjCir: json["NumFolTarjCir"],
        foliofiscal: json["Foliofiscal"],
        numFolAvisoint: json["NumFolAvisoint"],
        numPedIm: json["NumPedIm"],
        aduana: json["Aduana"],
        fechaRegulVeh: json["FechaRegulVeh"] == null ? null : DateTime.parse(json["FechaRegulVeh"]),
    );

    Map<String, dynamic> toJson() => {
        "PrecioVehUsado": precioVehUsado,
        "TipoVeh": tipoVeh,
        "Marca": marca,
        "TipooClase": tipooClase,
        "Año": ao,
        "Modelo": modelo,
        "NIV": niv,
        "NumSerie": numSerie,
        "NumPlacas": numPlacas,
        "NumMotor": numMotor,
        "NumFolTarjCir": numFolTarjCir,
        "Foliofiscal": foliofiscal,
        "NumFolAvisoint": numFolAvisoint,
        "NumPedIm": numPedIm,
        "Aduana": aduana,
        "FechaRegulVeh": "${fechaRegulVeh!.year.toString().padLeft(4, '0')}-${fechaRegulVeh!.month.toString().padLeft(2, '0')}-${fechaRegulVeh!.day.toString().padLeft(2, '0')}",
    };
}
class DecretoDecretoSustitVehicular {
    DecretoDecretoSustitVehicular({
        this.vehEnaj_dos,
        this.decretoVehiculoUsadoEnajenadoPermAlFab_dos,
        this.decretoVehiculoNuvoSemEnajenadoFabAlPerm_dos,
    });

    String? vehEnaj_dos;
    DecretoVehiculoEnajenadoPermAlFab? decretoVehiculoUsadoEnajenadoPermAlFab_dos;
    DecretoVehiculoNuvoSemEnajenadoFabAlPerm? decretoVehiculoNuvoSemEnajenadoFabAlPerm_dos;

    factory DecretoDecretoSustitVehicular.fromJson(Map<String, dynamic> json) => DecretoDecretoSustitVehicular(
        vehEnaj_dos: json["VehEnaj"],
        decretoVehiculoUsadoEnajenadoPermAlFab_dos: DecretoVehiculoEnajenadoPermAlFab.fromJson(json["decreto\u0024VehiculoUsadoEnajenadoPermAlFab"]),
        decretoVehiculoNuvoSemEnajenadoFabAlPerm_dos: DecretoVehiculoNuvoSemEnajenadoFabAlPerm.fromJson(json["decreto\u0024VehiculoNuvoSemEnajenadoFabAlPerm"]),
    );

    Map<String, dynamic> toJson() => {
        "VehEnaj": vehEnaj_dos,
        "decreto\u0024VehiculoUsadoEnajenadoPermAlFab": decretoVehiculoUsadoEnajenadoPermAlFab_dos!.toJson(),
        "decreto\u0024VehiculoNuvoSemEnajenadoFabAlPerm": decretoVehiculoNuvoSemEnajenadoFabAlPerm_dos!.toJson(),
    };
}
//EndRegion

//#Region Complemento Sector Ventas Detalle
class DetallistaDetallista {
    DetallistaDetallista({
      this.documentStructureVersion,
      this.documentStatus,
      this.type,
      this.contentVersion,
      this.detallistaRequestForPaymentIdentification,
      this.detallistaSpecialInstruction,
      this.detallistaOrderIdentification,
      this.detallistaAdditionalInformation,
      this.detallistaDeliveryNote,
      this.detallistaBuyer,
      this.detallistaSeller,
      this.detallistaShipTo,
      this.detallistaInvoiceCreator,
      this.detallistaCustoms,
      this.detallistaCurrency,
      this.detallistaPaymentTerms,
      this.detallistaShipmentDetail,
      this.detallistaAllowanceCharge,
      this.detallistaLineItem,
      this.detallistaTotalAmount,
      this.detallistaTotalAllowanceCharge,
    });

    String? documentStructureVersion;
    String? documentStatus;
    String? type;
    String? contentVersion;
    DetallistaRequestForPaymentIdentification? detallistaRequestForPaymentIdentification;
    DetallistaSpecialInstruction? detallistaSpecialInstruction;
    DetallistaOrderIdentification? detallistaOrderIdentification;
    DetallistaAdditionalInformation? detallistaAdditionalInformation;
    DetallistaDeliveryNote? detallistaDeliveryNote;
    DetallistaBuyer? detallistaBuyer;
    DetallistaSeller? detallistaSeller;
    DetallistaShipTo? detallistaShipTo;
    DetallistaInvoiceCreator? detallistaInvoiceCreator;
    DetallistaDetallistaDetallistaCustoms? detallistaCustoms;
    DetallistaCurrency? detallistaCurrency;
    DetallistaPaymentTerms? detallistaPaymentTerms;
    DetallistaShipmentDetail? detallistaShipmentDetail;
    DetallistaDetallistaDetallistaAllowanceCharge? detallistaAllowanceCharge;
    DetallistaLineItem? detallistaLineItem;
    DetallistaTotalAmountClass? detallistaTotalAmount;
    DetallistaTotalAllowanceCharge? detallistaTotalAllowanceCharge;

    factory DetallistaDetallista.fromJson(Map<String, dynamic> json) => DetallistaDetallista(
        documentStructureVersion: json["documentStructureVersion"],
        documentStatus: json["documentStatus"],
        type: json["type"],
        contentVersion: json["contentVersion"],
        detallistaRequestForPaymentIdentification: DetallistaRequestForPaymentIdentification.fromJson(json["detallista\u0024requestForPaymentIdentification"]),
        detallistaSpecialInstruction: DetallistaSpecialInstruction.fromJson(json["detallista\u0024specialInstruction"]),
        detallistaOrderIdentification: DetallistaOrderIdentification.fromJson(json["detallista\u0024orderIdentification"]),
        detallistaAdditionalInformation: DetallistaAdditionalInformation.fromJson(json["detallista\u0024AdditionalInformation"]),
        detallistaDeliveryNote: DetallistaDeliveryNote.fromJson(json["detallista\u0024DeliveryNote"]),
        detallistaBuyer: DetallistaBuyer.fromJson(json["detallista\u0024buyer"]),
        detallistaSeller: DetallistaSeller.fromJson(json["detallista\u0024seller"]),
        detallistaShipTo: DetallistaShipTo.fromJson(json["detallista\u0024shipTo"]),
        detallistaInvoiceCreator: DetallistaInvoiceCreator.fromJson(json["detallista\u0024InvoiceCreator"]),
        detallistaCustoms: DetallistaDetallistaDetallistaCustoms.fromJson(json["detallista\u0024Customs"]),
        detallistaCurrency: DetallistaCurrency.fromJson(json["detallista\u0024currency"]),
        detallistaPaymentTerms: DetallistaPaymentTerms.fromJson(json["detallista\u0024paymentTerms"]),
        detallistaShipmentDetail: DetallistaShipmentDetail.fromJson(json["detallista\u0024shipmentDetail"]),
        detallistaAllowanceCharge: DetallistaDetallistaDetallistaAllowanceCharge.fromJson(json["detallista\u0024allowanceCharge"]),
        detallistaLineItem: DetallistaLineItem.fromJson(json["detallista\u0024lineItem"]),
        detallistaTotalAmount: DetallistaTotalAmountClass.fromJson(json["detallista\u0024totalAmount"]),
        detallistaTotalAllowanceCharge: DetallistaTotalAllowanceCharge.fromJson(json["detallista\u0024TotalAllowanceCharge"]),
    );

    Map<String, dynamic> toJson() => {
        "documentStructureVersion": documentStructureVersion,
        "documentStatus": documentStatus,
        "type": type,
        "contentVersion": contentVersion,
        "detallista\u0024requestForPaymentIdentification": detallistaRequestForPaymentIdentification!.toJson(),
        "detallista\u0024specialInstruction": detallistaSpecialInstruction!.toJson(),
        "detallista\u0024orderIdentification": detallistaOrderIdentification!.toJson(),
        "detallista\u0024AdditionalInformation": detallistaAdditionalInformation!.toJson(),
        "detallista\u0024DeliveryNote": detallistaDeliveryNote!.toJson(),
        "detallista\u0024buyer": detallistaBuyer!.toJson(),
        "detallista\u0024seller": detallistaSeller!.toJson(),
        "detallista\u0024shipTo": detallistaShipTo!.toJson(),
        "detallista\u0024InvoiceCreator": detallistaInvoiceCreator!.toJson(),
        "detallista\u0024Customs": detallistaCustoms!.toJson(),
        "detallista\u0024currency": detallistaCurrency!.toJson(),
        "detallista\u0024paymentTerms": detallistaPaymentTerms!.toJson(),
        "detallista\u0024shipmentDetail": detallistaShipmentDetail!.toJson(),
        "detallista\u0024allowanceCharge": detallistaAllowanceCharge!.toJson(),
        "detallista\u0024lineItem": detallistaLineItem!.toJson(),
        "detallista\u0024totalAmount": detallistaTotalAmount!.toJson(),
        "detallista\u0024TotalAllowanceCharge": detallistaTotalAllowanceCharge!.toJson(),
    };
}
class DetallistaAdditionalInformation {
    DetallistaAdditionalInformation({
        this.detallistaReferenceIdentification,
    });

    DetallistaAlternatePartyIdentificationClass? detallistaReferenceIdentification;

    factory DetallistaAdditionalInformation.fromJson(Map<String, dynamic> json) => DetallistaAdditionalInformation(
        detallistaReferenceIdentification: DetallistaAlternatePartyIdentificationClass.fromJson(json["detallista\u0024referenceIdentification"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024referenceIdentification": detallistaReferenceIdentification!.toJson(),
    };
}
class DetallistaAlternatePartyIdentificationClass {
    DetallistaAlternatePartyIdentificationClass({
        this.type,
        this.t,
    });

    String? type;
    String? t;

    factory DetallistaAlternatePartyIdentificationClass.fromJson(Map<String, dynamic> json) => DetallistaAlternatePartyIdentificationClass(
        type: json["type"],
        t: json["\u0024t"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "\u0024t": t,
    };
}
class DetallistaDetallistaDetallistaAllowanceCharge {
    DetallistaDetallistaDetallistaAllowanceCharge({
        this.allowanceChargeType,
        this.settlementType,
        this.sequenceNumber,
        this.detallistaMonetaryAmountOrPercentage,
    });

    String? allowanceChargeType;
    String? settlementType;
    String? sequenceNumber;
    PurpleDetallistaMonetaryAmountOrPercentage? detallistaMonetaryAmountOrPercentage;

    factory DetallistaDetallistaDetallistaAllowanceCharge.fromJson(Map<String, dynamic> json) => DetallistaDetallistaDetallistaAllowanceCharge(
        allowanceChargeType: json["allowanceChargeType"],
        settlementType: json["settlementType"],
        sequenceNumber: json["sequenceNumber"],
        detallistaMonetaryAmountOrPercentage: PurpleDetallistaMonetaryAmountOrPercentage.fromJson(json["detallista\u0024monetaryAmountOrPercentage"]),
    );

    Map<String, dynamic> toJson() => {
        "allowanceChargeType": allowanceChargeType,
        "settlementType": settlementType,
        "sequenceNumber": sequenceNumber,
        "detallista\u0024monetaryAmountOrPercentage": detallistaMonetaryAmountOrPercentage!.toJson(),
    };
}
class PurpleDetallistaMonetaryAmountOrPercentage {
    PurpleDetallistaMonetaryAmountOrPercentage({
        this.detallistaRate,
    });

    DetallistaRate? detallistaRate;

    factory PurpleDetallistaMonetaryAmountOrPercentage.fromJson(Map<String, dynamic> json) => PurpleDetallistaMonetaryAmountOrPercentage(
        detallistaRate: DetallistaRate.fromJson(json["detallista\u0024rate"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024rate": detallistaRate!.toJson(),
    };
}
class DetallistaRate {
    DetallistaRate({
        this.base,
        this.detallistaPercentage,
    });

    String? base;
    DetallistaGlnClass? detallistaPercentage;

    factory DetallistaRate.fromJson(Map<String, dynamic> json) => DetallistaRate(
        base: json["base"],
        detallistaPercentage: DetallistaGlnClass.fromJson(json["detallista\u0024percentage"]),
    );

    Map<String, dynamic> toJson() => {
        "base": base,
        "detallista\u0024percentage": detallistaPercentage!.toJson(),
    };
}
class DetallistaGlnClass {
    DetallistaGlnClass({
        this.t,
    });

    String? t;

    factory DetallistaGlnClass.fromJson(Map<String, dynamic> json) => DetallistaGlnClass(
        t: json["\u0024t"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024t": t,
    };
}
class DetallistaBuyer {
    DetallistaBuyer({
        this.detallistaGln,
        this.detallistaContactInformation,
    });

    DetallistaGlnClass? detallistaGln;
    DetallistaContactInformation? detallistaContactInformation;

    factory DetallistaBuyer.fromJson(Map<String, dynamic> json) => DetallistaBuyer(
        detallistaGln: DetallistaGlnClass.fromJson(json["detallista\u0024gln"]),
        detallistaContactInformation: DetallistaContactInformation.fromJson(json["detallista\u0024contactInformation"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024gln": detallistaGln!.toJson(),
        "detallista\u0024contactInformation": detallistaContactInformation!.toJson(),
    };
}
class DetallistaContactInformation {
    DetallistaContactInformation({
        this.detallistaPersonOrDepartmentName,
    });

    DetallistaPersonOrDepartmentName? detallistaPersonOrDepartmentName;

    factory DetallistaContactInformation.fromJson(Map<String, dynamic> json) => DetallistaContactInformation(
        detallistaPersonOrDepartmentName: DetallistaPersonOrDepartmentName.fromJson(json["detallista\u0024personOrDepartmentName"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024personOrDepartmentName": detallistaPersonOrDepartmentName!.toJson(),
    };
}
class DetallistaPersonOrDepartmentName {
    DetallistaPersonOrDepartmentName({
        this.detallistaText,
    });

    DetallistaGlnClass? detallistaText;

    factory DetallistaPersonOrDepartmentName.fromJson(Map<String, dynamic> json) => DetallistaPersonOrDepartmentName(
        detallistaText: DetallistaGlnClass.fromJson(json["detallista\u0024text"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024text": detallistaText!.toJson(),
    };
}
class DetallistaCurrency {
    DetallistaCurrency({
        this.currencyIsoCode,
        this.detallistaCurrencyFunction,
        this.detallistaRateOfChange,
    });

    String? currencyIsoCode;
    DetallistaGlnClass? detallistaCurrencyFunction;
    DetallistaGlnClass? detallistaRateOfChange;

    factory DetallistaCurrency.fromJson(Map<String, dynamic> json) => DetallistaCurrency(
        currencyIsoCode: json["currencyISOCode"],
        detallistaCurrencyFunction: DetallistaGlnClass.fromJson(json["detallista\u0024currencyFunction"]),
        detallistaRateOfChange: DetallistaGlnClass.fromJson(json["detallista\u0024rateOfChange"]),
    );

    Map<String, dynamic> toJson() => {
        "currencyISOCode": currencyIsoCode,
        "detallista\u0024currencyFunction": detallistaCurrencyFunction!.toJson(),
        "detallista\u0024rateOfChange": detallistaRateOfChange!.toJson(),
    };
}
class DetallistaDetallistaDetallistaCustoms {
    DetallistaDetallistaDetallistaCustoms({
        this.detallistaGln,
    });

    DetallistaGlnClass? detallistaGln;

    factory DetallistaDetallistaDetallistaCustoms.fromJson(Map<String, dynamic> json) => DetallistaDetallistaDetallistaCustoms(
        detallistaGln: DetallistaGlnClass.fromJson(json["detallista\u0024gln"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024gln": detallistaGln!.toJson(),
    };
}
class DetallistaDeliveryNote {
    DetallistaDeliveryNote({
        this.detallistaReferenceIdentification,
        this.detallistaReferenceDate,
    });

    DetallistaGlnClass? detallistaReferenceIdentification;
    DetallistaGlnClass? detallistaReferenceDate;

    factory DetallistaDeliveryNote.fromJson(Map<String, dynamic> json) => DetallistaDeliveryNote(
        detallistaReferenceIdentification: DetallistaGlnClass.fromJson(json["detallista\u0024referenceIdentification"]),
        detallistaReferenceDate: DetallistaGlnClass.fromJson(json["detallista\u0024ReferenceDate"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024referenceIdentification": detallistaReferenceIdentification!.toJson(),
        "detallista\u0024ReferenceDate": detallistaReferenceDate!.toJson(),
    };
}
class DetallistaInvoiceCreator {
    DetallistaInvoiceCreator({
        this.detallistaGln,
        this.detallistaAlternatePartyIdentification,
        this.detallistaNameAndAddress,
    });

    DetallistaGlnClass? detallistaGln;
    DetallistaAlternatePartyIdentificationClass? detallistaAlternatePartyIdentification;
    DetallistaInvoiceCreatorDetallistaNameAndAddress? detallistaNameAndAddress;

    factory DetallistaInvoiceCreator.fromJson(Map<String, dynamic> json) => DetallistaInvoiceCreator(
        detallistaGln: DetallistaGlnClass.fromJson(json["detallista\u0024gln"]),
        detallistaAlternatePartyIdentification: DetallistaAlternatePartyIdentificationClass.fromJson(json["detallista\u0024alternatePartyIdentification"]),
        detallistaNameAndAddress: DetallistaInvoiceCreatorDetallistaNameAndAddress.fromJson(json["detallista\u0024nameAndAddress"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024gln": detallistaGln!.toJson(),
        "detallista\u0024alternatePartyIdentification": detallistaAlternatePartyIdentification!.toJson(),
        "detallista\u0024nameAndAddress": detallistaNameAndAddress!.toJson(),
    };
}
class DetallistaInvoiceCreatorDetallistaNameAndAddress {
    DetallistaInvoiceCreatorDetallistaNameAndAddress({
        this.detallistaName,
        this.detallistaStreetAddressOne,
        this.detallistaCity,
        this.detallistaPostalCode,
    });

    DetallistaGlnClass? detallistaName;
    DetallistaGlnClass? detallistaStreetAddressOne;
    DetallistaGlnClass? detallistaCity;
    DetallistaGlnClass? detallistaPostalCode;

    factory DetallistaInvoiceCreatorDetallistaNameAndAddress.fromJson(Map<String, dynamic> json) => DetallistaInvoiceCreatorDetallistaNameAndAddress(
        detallistaName: DetallistaGlnClass.fromJson(json["detallista\u0024name"]),
        detallistaStreetAddressOne: DetallistaGlnClass.fromJson(json["detallista\u0024streetAddressOne"]),
        detallistaCity: DetallistaGlnClass.fromJson(json["detallista\u0024city"]),
        detallistaPostalCode: DetallistaGlnClass.fromJson(json["detallista\u0024postalCode"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024name": detallistaName!.toJson(),
        "detallista\u0024streetAddressOne": detallistaStreetAddressOne!.toJson(),
        "detallista\u0024city": detallistaCity!.toJson(),
        "detallista\u0024postalCode": detallistaPostalCode!.toJson(),
    };
}
class DetallistaLineItem {
    DetallistaLineItem({
        this.type,
        this.number,
        this.detallistaTradeItemIdentification,
        this.detallistaAlternateTradeItemIdentification,
        this.detallistaTradeItemDescriptionInformation,
        this.detallistaInvoicedQuantity,
        this.detallistaAditionalQuantity,
        this.detallistaGrossPrice,
        this.detallistaNetPrice,
        this.detallistaAdditionalInformation,
        this.detallistaCustoms,
        this.detallistaLogisticUnits,
        this.detallistaPalletInformation,
        this.detallistaExtendedAttributes,
        this.detallistaAllowanceCharge,
        this.detallistaTradeItemTaxInformation,
        this.detallistaTotalLineAmount,
    });

    String? type;
    String? number;
    DetallistaTradeItemIdentification? detallistaTradeItemIdentification;
    DetallistaAlternatePartyIdentificationClass? detallistaAlternateTradeItemIdentification;
    DetallistaTradeItemDescriptionInformation? detallistaTradeItemDescriptionInformation;
    DetallistaInvoicedQuantity? detallistaInvoicedQuantity;
    DetallistaAditionalQuantity? detallistaAditionalQuantity;
    DetallistaTotalAmountClass? detallistaGrossPrice;
    DetallistaTotalAmountClass? detallistaNetPrice;
    DetallistaAdditionalInformation? detallistaAdditionalInformation;
    DetallistaLineItemDetallistaCustoms? detallistaCustoms;
    DetallistaLogisticUnits? detallistaLogisticUnits;
    DetallistaPalletInformation? detallistaPalletInformation;
    DetallistaExtendedAttributes? detallistaExtendedAttributes;
    DetallistaLineItemDetallistaAllowanceCharge? detallistaAllowanceCharge;
    DetallistaTradeItemTaxInformation? detallistaTradeItemTaxInformation;
    DetallistaTotalLineAmount? detallistaTotalLineAmount;

    factory DetallistaLineItem.fromJson(Map<String, dynamic> json) => DetallistaLineItem(
        type: json["type"],
        number: json["number"],
        detallistaTradeItemIdentification: DetallistaTradeItemIdentification.fromJson(json["detallista\u0024tradeItemIdentification"]),
        detallistaAlternateTradeItemIdentification: DetallistaAlternatePartyIdentificationClass.fromJson(json["detallista\u0024alternateTradeItemIdentification"]),
        detallistaTradeItemDescriptionInformation: DetallistaTradeItemDescriptionInformation.fromJson(json["detallista\u0024tradeItemDescriptionInformation"]),
        detallistaInvoicedQuantity: DetallistaInvoicedQuantity.fromJson(json["detallista\u0024invoicedQuantity"]),
        detallistaAditionalQuantity: DetallistaAditionalQuantity.fromJson(json["detallista\u0024aditionalQuantity"]),
        detallistaGrossPrice: DetallistaTotalAmountClass.fromJson(json["detallista\u0024grossPrice"]),
        detallistaNetPrice: DetallistaTotalAmountClass.fromJson(json["detallista\u0024netPrice"]),
        detallistaAdditionalInformation: DetallistaAdditionalInformation.fromJson(json["detallista\u0024AdditionalInformation"]),
        detallistaCustoms: DetallistaLineItemDetallistaCustoms.fromJson(json["detallista\u0024Customs"]),
        detallistaLogisticUnits: DetallistaLogisticUnits.fromJson(json["detallista\u0024LogisticUnits"]),
        detallistaPalletInformation: DetallistaPalletInformation.fromJson(json["detallista\u0024palletInformation"]),
        detallistaExtendedAttributes: DetallistaExtendedAttributes.fromJson(json["detallista\u0024extendedAttributes"]),
        detallistaAllowanceCharge: DetallistaLineItemDetallistaAllowanceCharge.fromJson(json["detallista\u0024allowanceCharge"]),
        detallistaTradeItemTaxInformation: DetallistaTradeItemTaxInformation.fromJson(json["detallista\u0024tradeItemTaxInformation"]),
        detallistaTotalLineAmount: DetallistaTotalLineAmount.fromJson(json["detallista\u0024totalLineAmount"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "number": number,
        "detallista\u0024tradeItemIdentification": detallistaTradeItemIdentification!.toJson(),
        "detallista\u0024alternateTradeItemIdentification": detallistaAlternateTradeItemIdentification!.toJson(),
        "detallista\u0024tradeItemDescriptionInformation": detallistaTradeItemDescriptionInformation!.toJson(),
        "detallista\u0024invoicedQuantity": detallistaInvoicedQuantity!.toJson(),
        "detallista\u0024aditionalQuantity": detallistaAditionalQuantity!.toJson(),
        "detallista\u0024grossPrice": detallistaGrossPrice!.toJson(),
        "detallista\u0024netPrice": detallistaNetPrice!.toJson(),
        "detallista\u0024AdditionalInformation": detallistaAdditionalInformation!.toJson(),
        "detallista\u0024Customs": detallistaCustoms!.toJson(),
        "detallista\u0024LogisticUnits": detallistaLogisticUnits!.toJson(),
        "detallista\u0024palletInformation": detallistaPalletInformation!.toJson(),
        "detallista\u0024extendedAttributes": detallistaExtendedAttributes!.toJson(),
        "detallista\u0024allowanceCharge": detallistaAllowanceCharge!.toJson(),
        "detallista\u0024tradeItemTaxInformation": detallistaTradeItemTaxInformation!.toJson(),
        "detallista\u0024totalLineAmount": detallistaTotalLineAmount!.toJson(),
    };
}
class DetallistaAditionalQuantity {
    DetallistaAditionalQuantity({
        this.quantityType,
        this.t,
    });

    String? quantityType;
    String? t;

    factory DetallistaAditionalQuantity.fromJson(Map<String, dynamic> json) => DetallistaAditionalQuantity(
        quantityType: json["QuantityType"],
        t: json["\u0024t"],
    );

    Map<String, dynamic> toJson() => {
        "QuantityType": quantityType,
        "\u0024t": t,
    };
}
class DetallistaLineItemDetallistaAllowanceCharge {
    DetallistaLineItemDetallistaAllowanceCharge({
        this.allowanceChargeType,
        this.settlementType,
        this.sequenceNumber,
        this.detallistaSpecialServicesType,
        this.detallistaMonetaryAmountOrPercentage,
    });

    String? allowanceChargeType;
    String? settlementType;
    String? sequenceNumber;
    DetallistaGlnClass? detallistaSpecialServicesType;
    FluffyDetallistaMonetaryAmountOrPercentage? detallistaMonetaryAmountOrPercentage;

    factory DetallistaLineItemDetallistaAllowanceCharge.fromJson(Map<String, dynamic> json) => DetallistaLineItemDetallistaAllowanceCharge(
        allowanceChargeType: json["allowanceChargeType"],
        settlementType: json["settlementType"],
        sequenceNumber: json["sequenceNumber"],
        detallistaSpecialServicesType: DetallistaGlnClass.fromJson(json["detallista\u0024specialServicesType"]),
        detallistaMonetaryAmountOrPercentage: FluffyDetallistaMonetaryAmountOrPercentage.fromJson(json["detallista\u0024monetaryAmountOrPercentage"]),
    );

    Map<String, dynamic> toJson() => {
        "allowanceChargeType": allowanceChargeType,
        "settlementType": settlementType,
        "sequenceNumber": sequenceNumber,
        "detallista\u0024specialServicesType": detallistaSpecialServicesType!.toJson(),
        "detallista\u0024monetaryAmountOrPercentage": detallistaMonetaryAmountOrPercentage!.toJson(),
    };
}
class FluffyDetallistaMonetaryAmountOrPercentage {
    FluffyDetallistaMonetaryAmountOrPercentage({
        this.detallistaPercentagePerUnit,
        this.detallistaRatePerUnit,
    });

    DetallistaGlnClass? detallistaPercentagePerUnit;
    DetallistaRatePerUnit? detallistaRatePerUnit;

    factory FluffyDetallistaMonetaryAmountOrPercentage.fromJson(Map<String, dynamic> json) => FluffyDetallistaMonetaryAmountOrPercentage(
        detallistaPercentagePerUnit: DetallistaGlnClass.fromJson(json["detallista\u0024percentagePerUnit"]),
        detallistaRatePerUnit: DetallistaRatePerUnit.fromJson(json["detallista\u0024ratePerUnit"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024percentagePerUnit": detallistaPercentagePerUnit!.toJson(),
        "detallista\u0024ratePerUnit": detallistaRatePerUnit!.toJson(),
    };
}
class DetallistaRatePerUnit {
    DetallistaRatePerUnit({
        this.detallistaAmountPerUnit,
    });

    DetallistaGlnClass? detallistaAmountPerUnit;

    factory DetallistaRatePerUnit.fromJson(Map<String, dynamic> json) => DetallistaRatePerUnit(
        detallistaAmountPerUnit: DetallistaGlnClass.fromJson(json["detallista\u0024amountPerUnit"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024amountPerUnit": detallistaAmountPerUnit!.toJson(),
    };
}
class DetallistaLineItemDetallistaCustoms {
    DetallistaLineItemDetallistaCustoms({
        this.detallistaGln,
        this.detallistaAlternatePartyIdentification,
        this.detallistaReferenceDate,
        this.detallistaNameAndAddress,
    });

    DetallistaGlnClass? detallistaGln;
    DetallistaAlternatePartyIdentificationClass? detallistaAlternatePartyIdentification;
    DetallistaGlnClass? detallistaReferenceDate;
    DetallistaCustomsDetallistaNameAndAddress? detallistaNameAndAddress;

    factory DetallistaLineItemDetallistaCustoms.fromJson(Map<String, dynamic> json) => DetallistaLineItemDetallistaCustoms(
        detallistaGln: DetallistaGlnClass.fromJson(json["detallista\u0024gln"]),
        detallistaAlternatePartyIdentification: DetallistaAlternatePartyIdentificationClass.fromJson(json["detallista\u0024alternatePartyIdentification"]),
        detallistaReferenceDate: DetallistaGlnClass.fromJson(json["detallista\u0024ReferenceDate"]),
        detallistaNameAndAddress: DetallistaCustomsDetallistaNameAndAddress.fromJson(json["detallista\u0024nameAndAddress"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024gln": detallistaGln!.toJson(),
        "detallista\u0024alternatePartyIdentification": detallistaAlternatePartyIdentification!.toJson(),
        "detallista\u0024ReferenceDate": detallistaReferenceDate!.toJson(),
        "detallista\u0024nameAndAddress": detallistaNameAndAddress!.toJson(),
    };
}
class DetallistaCustomsDetallistaNameAndAddress {
    DetallistaCustomsDetallistaNameAndAddress({
        this.detallistaName,
    });

    DetallistaGlnClass? detallistaName;

    factory DetallistaCustomsDetallistaNameAndAddress.fromJson(Map<String, dynamic> json) => DetallistaCustomsDetallistaNameAndAddress(
        detallistaName: DetallistaGlnClass.fromJson(json["detallista\u0024name"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024name": detallistaName!.toJson(),
    };
}
class DetallistaExtendedAttributes {
    DetallistaExtendedAttributes({
        this.detallistaLotNumber,
    });

    DetallistaLotNumber? detallistaLotNumber;

    factory DetallistaExtendedAttributes.fromJson(Map<String, dynamic> json) => DetallistaExtendedAttributes(
        detallistaLotNumber: DetallistaLotNumber.fromJson(json["detallista\u0024lotNumber"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024lotNumber": detallistaLotNumber!.toJson(),
    };
}
class DetallistaLotNumber {
    DetallistaLotNumber({
        this.productionDate,
        this.t,
    });

    DateTime? productionDate;
    String? t;

    factory DetallistaLotNumber.fromJson(Map<String, dynamic> json) => DetallistaLotNumber(
        productionDate: DateTime.parse(json["productionDate"]),
        t: json["\u0024t"],
    );

    Map<String, dynamic> toJson() => {
        "productionDate": "${productionDate!.year.toString().padLeft(4, '0')}-${productionDate!.month.toString().padLeft(2, '0')}-${productionDate!.day.toString().padLeft(2, '0')}",
        "\u0024t": t,
    };
}
class DetallistaTotalAmountClass {
    DetallistaTotalAmountClass({
        this.detallistaAmount,
    });

    DetallistaGlnClass? detallistaAmount;

    factory DetallistaTotalAmountClass.fromJson(Map<String, dynamic> json) => DetallistaTotalAmountClass(
        detallistaAmount: DetallistaGlnClass.fromJson(json["detallista\u0024Amount"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024Amount": detallistaAmount!.toJson(),
    };
}
class DetallistaInvoicedQuantity {
    DetallistaInvoicedQuantity({
        this.unitOfMeasure,
        this.t,
    });

    String? unitOfMeasure;
    String? t;

    factory DetallistaInvoicedQuantity.fromJson(Map<String, dynamic> json) => DetallistaInvoicedQuantity(
        unitOfMeasure: json["unitOfMeasure"],
        t: json["\u0024t"],
    );

    Map<String, dynamic> toJson() => {
        "unitOfMeasure": unitOfMeasure,
        "\u0024t": t,
    };
}
class DetallistaLogisticUnits {
    DetallistaLogisticUnits({
        this.detallistaSerialShippingContainerCode,
    });

    DetallistaAlternatePartyIdentificationClass? detallistaSerialShippingContainerCode;

    factory DetallistaLogisticUnits.fromJson(Map<String, dynamic> json) => DetallistaLogisticUnits(
        detallistaSerialShippingContainerCode: DetallistaAlternatePartyIdentificationClass.fromJson(json["detallista\u0024serialShippingContainerCode"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024serialShippingContainerCode": detallistaSerialShippingContainerCode!.toJson(),
    };
}
class DetallistaPalletInformation {
    DetallistaPalletInformation({
        this.detallistaPalletQuantity,
        this.detallistaDescription,
        this.detallistaTransport,
    });

    DetallistaGlnClass? detallistaPalletQuantity;
    DetallistaAlternatePartyIdentificationClass? detallistaDescription;
    DetallistaTransport? detallistaTransport;

    factory DetallistaPalletInformation.fromJson(Map<String, dynamic> json) => DetallistaPalletInformation(
        detallistaPalletQuantity: DetallistaGlnClass.fromJson(json["detallista\u0024palletQuantity"]),
        detallistaDescription: DetallistaAlternatePartyIdentificationClass.fromJson(json["detallista\u0024description"]),
        detallistaTransport: DetallistaTransport.fromJson(json["detallista\u0024transport"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024palletQuantity": detallistaPalletQuantity!.toJson(),
        "detallista\u0024description": detallistaDescription!.toJson(),
        "detallista\u0024transport": detallistaTransport!.toJson(),
    };
}
class DetallistaTransport {
    DetallistaTransport({
        this.detallistaMethodOfPayment,
    });

    DetallistaGlnClass? detallistaMethodOfPayment;

    factory DetallistaTransport.fromJson(Map<String, dynamic> json) => DetallistaTransport(
        detallistaMethodOfPayment: DetallistaGlnClass.fromJson(json["detallista\u0024methodOfPayment"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024methodOfPayment": detallistaMethodOfPayment!.toJson(),
    };
}
class DetallistaTotalLineAmount {
    DetallistaTotalLineAmount({
        this.detallistaGrossAmount,
        this.detallistaNetAmount,
    });

    DetallistaTotalAmountClass? detallistaGrossAmount;
    DetallistaTotalAmountClass? detallistaNetAmount;

    factory DetallistaTotalLineAmount.fromJson(Map<String, dynamic> json) => DetallistaTotalLineAmount(
        detallistaGrossAmount: DetallistaTotalAmountClass.fromJson(json["detallista\u0024grossAmount"]),
        detallistaNetAmount: DetallistaTotalAmountClass.fromJson(json["detallista\u0024netAmount"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024grossAmount": detallistaGrossAmount!.toJson(),
        "detallista\u0024netAmount": detallistaNetAmount!.toJson(),
    };
}
class DetallistaTradeItemDescriptionInformation {
    DetallistaTradeItemDescriptionInformation({
        this.language,
        this.detallistaLongText,
    });

    String? language;
    DetallistaGlnClass? detallistaLongText;

    factory DetallistaTradeItemDescriptionInformation.fromJson(Map<String, dynamic> json) => DetallistaTradeItemDescriptionInformation(
        language: json["language"],
        detallistaLongText: DetallistaGlnClass.fromJson(json["detallista\u0024longText"]),
    );

    Map<String, dynamic> toJson() => {
        "language": language,
        "detallista\u0024longText": detallistaLongText!.toJson(),
    };
}
class DetallistaTradeItemIdentification {
    DetallistaTradeItemIdentification({
        this.detallistaGtin,
    });

    DetallistaGlnClass? detallistaGtin;

    factory DetallistaTradeItemIdentification.fromJson(Map<String, dynamic> json) => DetallistaTradeItemIdentification(
        detallistaGtin: DetallistaGlnClass.fromJson(json["detallista\u0024gtin"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024gtin": detallistaGtin!.toJson(),
    };
}
class DetallistaTradeItemTaxInformation {
    DetallistaTradeItemTaxInformation({
        this.detallistaTaxTypeDescription,
        this.detallistaReferenceNumber,
        this.detallistaTaxCategory,
        this.detallistaTradeItemTaxAmount,
    });

    DetallistaGlnClass? detallistaTaxTypeDescription;
    DetallistaGlnClass? detallistaReferenceNumber;
    DetallistaGlnClass? detallistaTaxCategory;
    DetallistaTradeItemTaxAmount? detallistaTradeItemTaxAmount;

    factory DetallistaTradeItemTaxInformation.fromJson(Map<String, dynamic> json) => DetallistaTradeItemTaxInformation(
        detallistaTaxTypeDescription: DetallistaGlnClass.fromJson(json["detallista\u0024taxTypeDescription"]),
        detallistaReferenceNumber: DetallistaGlnClass.fromJson(json["detallista\u0024referenceNumber"]),
        detallistaTaxCategory: DetallistaGlnClass.fromJson(json["detallista\u0024taxCategory"]),
        detallistaTradeItemTaxAmount: DetallistaTradeItemTaxAmount.fromJson(json["detallista\u0024tradeItemTaxAmount"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024taxTypeDescription": detallistaTaxTypeDescription!.toJson(),
        "detallista\u0024referenceNumber": detallistaReferenceNumber!.toJson(),
        "detallista\u0024taxCategory": detallistaTaxCategory!.toJson(),
        "detallista\u0024tradeItemTaxAmount": detallistaTradeItemTaxAmount!.toJson(),
    };
}
class DetallistaTradeItemTaxAmount {
    DetallistaTradeItemTaxAmount({
        this.detallistaTaxPercentage,
        this.detallistaTaxAmount,
    });

    DetallistaGlnClass? detallistaTaxPercentage;
    DetallistaGlnClass? detallistaTaxAmount;

    factory DetallistaTradeItemTaxAmount.fromJson(Map<String, dynamic> json) => DetallistaTradeItemTaxAmount(
        detallistaTaxPercentage: DetallistaGlnClass.fromJson(json["detallista\u0024taxPercentage"]),
        detallistaTaxAmount: DetallistaGlnClass.fromJson(json["detallista\u0024taxAmount"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024taxPercentage": detallistaTaxPercentage!.toJson(),
        "detallista\u0024taxAmount": detallistaTaxAmount!.toJson(),
    };
}
class DetallistaOrderIdentification {
    DetallistaOrderIdentification({
        this.detallistaReferenceIdentification,
        this.detallistaReferenceDate,
    });

    DetallistaAlternatePartyIdentificationClass? detallistaReferenceIdentification;
    DetallistaGlnClass? detallistaReferenceDate;

    factory DetallistaOrderIdentification.fromJson(Map<String, dynamic> json) => DetallistaOrderIdentification(
        detallistaReferenceIdentification: DetallistaAlternatePartyIdentificationClass.fromJson(json["detallista\u0024referenceIdentification"]),
        detallistaReferenceDate: DetallistaGlnClass.fromJson(json["detallista\u0024ReferenceDate"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024referenceIdentification": detallistaReferenceIdentification!.toJson(),
        "detallista\u0024ReferenceDate": detallistaReferenceDate!.toJson(),
    };
}
class DetallistaPaymentTerms {
    DetallistaPaymentTerms({
        this.paymentTermsEvent,
        this.paymentTermsRelationTime,
        this.detallistaNetPayment,
        this.detallistaDiscountPayment,
    });

    String? paymentTermsEvent;
    String? paymentTermsRelationTime;
    DetallistaNetPayment? detallistaNetPayment;
    DetallistaDiscountPayment? detallistaDiscountPayment;

    factory DetallistaPaymentTerms.fromJson(Map<String, dynamic> json) => DetallistaPaymentTerms(
        paymentTermsEvent: json["paymentTermsEvent"],
        paymentTermsRelationTime: json["PaymentTermsRelationTime"],
        detallistaNetPayment: DetallistaNetPayment.fromJson(json["detallista\u0024netPayment"]),
        detallistaDiscountPayment: DetallistaDiscountPayment.fromJson(json["detallista\u0024discountPayment"]),
    );

    Map<String, dynamic> toJson() => {
        "paymentTermsEvent": paymentTermsEvent,
        "PaymentTermsRelationTime": paymentTermsRelationTime,
        "detallista\u0024netPayment": detallistaNetPayment!.toJson(),
        "detallista\u0024discountPayment": detallistaDiscountPayment!.toJson(),
    };
}
class DetallistaDiscountPayment {
    DetallistaDiscountPayment({
        this.discountType,
        this.detallistaPercentage,
    });

    String? discountType;
    DetallistaGlnClass? detallistaPercentage;

    factory DetallistaDiscountPayment.fromJson(Map<String, dynamic> json) => DetallistaDiscountPayment(
        discountType: json["discountType"],
        detallistaPercentage: DetallistaGlnClass.fromJson(json["detallista\u0024percentage"]),
    );

    Map<String, dynamic> toJson() => {
        "discountType": discountType,
        "detallista\u0024percentage": detallistaPercentage!.toJson(),
    };
}
class DetallistaNetPayment {
    DetallistaNetPayment({
        this.netPaymentTermsType,
        this.detallistaPaymentTimePeriod,
    });

    String? netPaymentTermsType;
    DetallistaPaymentTimePeriod? detallistaPaymentTimePeriod;

    factory DetallistaNetPayment.fromJson(Map<String, dynamic> json) => DetallistaNetPayment(
        netPaymentTermsType: json["netPaymentTermsType"],
        detallistaPaymentTimePeriod: DetallistaPaymentTimePeriod.fromJson(json["detallista\u0024paymentTimePeriod"]),
    );

    Map<String, dynamic> toJson() => {
        "netPaymentTermsType": netPaymentTermsType,
        "detallista\u0024paymentTimePeriod": detallistaPaymentTimePeriod!.toJson(),
    };
}
class DetallistaPaymentTimePeriod {
    DetallistaPaymentTimePeriod({
        this.detallistaTimePeriodDue,
    });

    DetallistaTimePeriodDue? detallistaTimePeriodDue;

    factory DetallistaPaymentTimePeriod.fromJson(Map<String, dynamic> json) => DetallistaPaymentTimePeriod(
        detallistaTimePeriodDue: DetallistaTimePeriodDue.fromJson(json["detallista\u0024timePeriodDue"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024timePeriodDue": detallistaTimePeriodDue!.toJson(),
    };
}
class DetallistaTimePeriodDue {
    DetallistaTimePeriodDue({
        this.timePeriod,
        this.detallistaValue,
    });

    String? timePeriod;
    DetallistaGlnClass? detallistaValue;

    factory DetallistaTimePeriodDue.fromJson(Map<String, dynamic> json) => DetallistaTimePeriodDue(
        timePeriod: json["timePeriod"],
        detallistaValue: DetallistaGlnClass.fromJson(json["detallista\u0024value"]),
    );

    Map<String, dynamic> toJson() => {
        "timePeriod": timePeriod,
        "detallista\u0024value": detallistaValue!.toJson(),
    };
}
class DetallistaRequestForPaymentIdentification {
    DetallistaRequestForPaymentIdentification({
        this.detallistaEntityType,
    });

    DetallistaGlnClass? detallistaEntityType;

    factory DetallistaRequestForPaymentIdentification.fromJson(Map<String, dynamic> json) => DetallistaRequestForPaymentIdentification(
        detallistaEntityType: DetallistaGlnClass.fromJson(json["detallista\u0024entityType"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024entityType": detallistaEntityType!.toJson(),
    };
}
class DetallistaSeller {
    DetallistaSeller({
        this.detallistaGln,
        this.detallistaAlternatePartyIdentification,
    });

    DetallistaGlnClass? detallistaGln;
    DetallistaAlternatePartyIdentificationClass? detallistaAlternatePartyIdentification;

    factory DetallistaSeller.fromJson(Map<String, dynamic> json) => DetallistaSeller(
        detallistaGln: DetallistaGlnClass.fromJson(json["detallista\u0024gln"]),
        detallistaAlternatePartyIdentification: DetallistaAlternatePartyIdentificationClass.fromJson(json["detallista\u0024alternatePartyIdentification"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024gln": detallistaGln!.toJson(),
        "detallista\u0024alternatePartyIdentification": detallistaAlternatePartyIdentification!.toJson(),
    };
}
class DetallistaShipTo {
    DetallistaShipTo({
        this.detallistaGln,
        this.detallistaNameAndAddress,
    });

    DetallistaGlnClass? detallistaGln;
    DetallistaInvoiceCreatorDetallistaNameAndAddress? detallistaNameAndAddress;

    factory DetallistaShipTo.fromJson(Map<String, dynamic> json) => DetallistaShipTo(
        detallistaGln: DetallistaGlnClass.fromJson(json["detallista\u0024gln"]),
        detallistaNameAndAddress: DetallistaInvoiceCreatorDetallistaNameAndAddress.fromJson(json["detallista\u0024nameAndAddress"]),
    );

    Map<String, dynamic> toJson() => {
        "detallista\u0024gln": detallistaGln!.toJson(),
        "detallista\u0024nameAndAddress": detallistaNameAndAddress!.toJson(),
    };
}
class DetallistaShipmentDetail {
    DetallistaShipmentDetail();

    factory DetallistaShipmentDetail.fromJson(Map<String, dynamic> json) => DetallistaShipmentDetail(
    );

    Map<String, dynamic> toJson() => {
    };
}
class DetallistaSpecialInstruction {
    DetallistaSpecialInstruction({
        this.code,
        this.detallistaText,
    });

    String? code;
    DetallistaGlnClass? detallistaText;

    factory DetallistaSpecialInstruction.fromJson(Map<String, dynamic> json) => DetallistaSpecialInstruction(
        code: json["code"],
        detallistaText: DetallistaGlnClass.fromJson(json["detallista\u0024text"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "detallista\u0024text": detallistaText!.toJson(),
    };
}
class DetallistaTotalAllowanceCharge {
    DetallistaTotalAllowanceCharge({
        this.allowanceOrChargeType,
        this.detallistaSpecialServicesType,
        this.detallistaAmount,
    });

    String? allowanceOrChargeType;
    DetallistaGlnClass? detallistaSpecialServicesType;
    DetallistaGlnClass? detallistaAmount;

    factory DetallistaTotalAllowanceCharge.fromJson(Map<String, dynamic> json) => DetallistaTotalAllowanceCharge(
        allowanceOrChargeType: json["allowanceOrChargeType"],
        detallistaSpecialServicesType: DetallistaGlnClass.fromJson(json["detallista\u0024specialServicesType"]),
        detallistaAmount: DetallistaGlnClass.fromJson(json["detallista\u0024Amount"]),
    );

    Map<String, dynamic> toJson() => {
        "allowanceOrChargeType": allowanceOrChargeType,
        "detallista\u0024specialServicesType": detallistaSpecialServicesType!.toJson(),
        "detallista\u0024Amount": detallistaAmount!.toJson(),
    };
}
//EndRegion

class Xmln {
    Xmln();

    factory Xmln.fromJson(Map<String, dynamic> json) => Xmln(
    );

    Map<String, dynamic> toJson() => {
    };
}
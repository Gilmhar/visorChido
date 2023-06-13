
// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:visor_xml/Clase_Luis.dart/mapas.dart';

//#Region Complemento Concepto
class c_AiepsAcreditamientoIeps with ChangeNotifier {
  late var version_;
  late var tar_;
}

class c_IeduInstEducativas with ChangeNotifier {
  late var version_;
  late var nombreAlumno_;
  late var curp_;
  late var nivelEducativo_;
  late var autRvoe_;
  late var rfcPago_;
}

class c_TercerosPorCuentadeTerceros with ChangeNotifier {
  late var version_;
  late var rfc_;
  late var nombre_;
  late List<Xmln>? xmlns_;//LISTA
  late var xmlnsTerceros_;
  late List<TercerosParte>? tercerosParte_;
  late List<TercerosTraslado>? tercerosTraslado_IT_;
  late var calle_IFT_;
  late var noExterior_IFT_;
  late var municipio_IFT_;
  late var estado_IFT_;
  late var pais_IFT_;
  late var codigoPostal_IFT_;
}

class c_VentavehiculosVentaVehiculos with ChangeNotifier{
  late var version_;
  late var claveVehicular_;
  late var niv_;
  late var cantidad_P_;
  late var unidad_P_;
  late var noIdentificacion_P_;
  late var descripcion_P_;
  late var valorUnitario_P_;
  late var importe_P_;
  late var numero_P_IA_;
  late var fecha_P_IA_;
  late var aduana_P_IA_;
}
//EndRegion

//#Region Complemento
class c_AerolineasAerolineas with ChangeNotifier{
  late var version_;
  late var tua_;
  late var totalCargos_AOT_;
  late var codigoCargo_AOT_AC_;
  late var importe_AOT_AC_;
}

class c_DestruccionCertificadodedestruccion with ChangeNotifier{
  late var version_;
  late var serie_;
  late var numFolDesVeh_;
  late var numPedImp_DIA_;
  late var fecha_DIA_;
  late var aduana_DIA_;
  late var marca_DVD;
  late var tipooClase_DVD;
  late var ao_DVD;
  late var modelo_DVD;
  late var niv_DVD;
  late var numSerie_DVD;
  late var numPlacas_DVD;
  late var numMotor_DVD;
  late var numFolTarjCir_DVD;
}

class c_CceComercioExterior with ChangeNotifier{
  late var version_;
  late var tipoOperacion_;
  late var claveDePedimento_;
  late var certificadoOrigen_;
  late var numeroExportadorConfiable_;
  late var incoterm_;
  late var subdivision_;
  late var observaciones_;
  late var tipoCambioUsd_;
  late var totalUsd_;
  late var numRegIdTrib_D;
  late var calle_D_D_;
  late var estado_D_D_;
  late var pais_D_D_;
  late var codigoPostal_D_D_;
  late List<CceMercancia>? cceMercancia_M_;//LISTA
  late var numRegIdTrib_R_;
}

class c_DivisasDivisas with ChangeNotifier{
  late var version_;
  late var tipoOperacion_;
  late List<Xmln>? xmlns_DD_;//LISTA
  late var xmlnsDivisas_;
}

class c_ConsumodecombustiblesConsumoDeCombustibles_10 with ChangeNotifier{
  late var version_;
  late var tipoOperacion_;
  late var numeroDeCuenta_;
  late var subTotal_;
  late var total_;
  late var identificador_CCC_CDC_;
  late var fecha_CCC_CDC_;
  late var rfc_CCC_CDC_;
  late var claveEstacion_CCC_CDC_;
  late var cantidad_CCC_CDC_;
  late var nombreCombustible_CCC_CDC_;
  late var folioOperacion_CCC_CDC_;
  late var valorUnitario_CCC_CDC_;
  late var importe_CCC_CDC_;
  late var impuesto_CCC_CDC_CCD_;
  late var tasa_CCC_CDC_CCD_;
  late var importe_CCC_CDC_CCD_;
}

class c_Consumodecombustibles11ConsumoDeCombustibles_11 with ChangeNotifier{
  late var version_;
  late var numeroDeCuenta_;
  late var tipoOperacion_;
  late var subTotal_;
  late var total_;
  late var identificador_CCC_;
  late var fecha_CCC_;
  late var rfc_CCC_;
  late var claveEstacion_CCC_;
  late var tipoCombustible_CCC_;
  late var cantidad_CCC_;
  late var nombreCombustible_CCC_;
  late var folioOperacion_CCC_;
  late var valorUnitario_CCC_;
  late var importe_CCC_;
  late var impuesto_CCD_;
  late var tasaOCuota_CCD_;
  late var importe_CCD_;
}

class c_DonatDonatarias with ChangeNotifier{
  late var version_;
  late var noAutorizacion_;
  late var fechaAutorizacion_;
  late var leyenda_;
}

class c_Ecc12EstadoDeCuentaCombustible_12 with ChangeNotifier{
  late var numeroDeCuenta_;
  late var subTotal_;
  late var tipoOperacion_;
  late var total_;
  late var version_;
  late List<Ecc12ConceptoEstadoDeCuentaCombustible>? ecc12ConceptoEstadoDeCuentaCombustible_C_;//LISTA
}

class c_GcehGastosHidrocarburos with ChangeNotifier{
  late var version_;
  late var areaContractual_;
  late var numeroContrato_;
  late List<GcehErogacion>? gcehErogacion_;//LISTA
}

class c_IeehIngresosHidrocarburos with ChangeNotifier{
  late var version_;
  late var porcentaje_;
  late var contraprestacionPagadaOperador_;
  late var numeroContrato_;
  late var fechaFolioFiscalVinculado_DR_;
  late var folioFiscalVinculado_DR_;
  late var mes_DR_;
}

class c_IneIne with ChangeNotifier{
  late var version_;
  late var tipoProceso_;
  late List<IneEntidad>? ineEntidad_;
}

class c_LeyendasFiscLeyendasFiscales with ChangeNotifier{
  late var version_;
  late List<Xmln>? xmlns_;
  late var xmlnsLeyendasFisc_;
  late List<LeyendasFiscLeyenda>? leyendasFiscLeyenda_;
}

class c_NotariospublicosNotariosPublicos with ChangeNotifier{
  late var version_;
  late var coproSocConyugalE_DA_;
  late List<NotariospublicosDatosAdquirienteCopSc>? notariospublicosDatosAdquirienteCopSc_DA_CSC_;
  late var coproSocConyugalE_DE_;
  late var nombre_DE_DUE_;
  late var apellidoPaterno_DUE_;
  late var rfc_DUE_;
  late var curp_DUE_;
  late var curp_DN_;
  late var numNotaria_DN_;
  late var entidadFederativa_DN_;
  late var numInstrumentoNotarial_DO_;
  late var fechaInstNotarial_DO_;
  late var montoOperacion_DO_;
  late var subtotal_DO_;
  late var iva_DO_;
  late var tipoInmueble_DI_;
  late var calle_DI_;
  late var municipio_DI_;
  late var estado_DI_;
  late var pais_DI_;
  late var codigoPostal_DI_;
}

class c_ObrasarteObrasarteantiguedades with ChangeNotifier{
  late var version_;
  late var tipoBien_;
  late var tituloAdquirido_;
  late var subtotal_;
  late var iva_;
  late var fechaAdquisicion_;
  late var caractersticasDeObraoPieza_;
}

class c_ImplocalImpuestosLocales with ChangeNotifier{
  late var version_;
  late var totaldeRetenciones_;
  late var totaldeTraslados_;
  late List<ImplocalRetencionesLocale>? implocalRetencionesLocales_;
}

class c_PagoenespeciePagoEnEspecie with ChangeNotifier{
  late var version_;
  late var cvePic_;
  late var folioSolDon_;
  late var pzaArtNombre_;
  late var pzaArtTecn_;
  late var pzaArtAProd_;
  late var pzaArtDim_;
}

class c_PficPFintegranteCoordinado with ChangeNotifier{
  late var version_;
  late var claveVehicular_;
  late var placa_;
  late var rfcpf_;
}

class c_ServicioparcialParcialesconstruccion with ChangeNotifier{
  late var version_;
  late var numPerLicoAut_;
  late var calle_I_;
  late var codigoPostal_I_;
  late var estado_I_;
  late var municipio_I_;
}

class c_SpeiComplementoSpei with ChangeNotifier{
  late var claveSpei_;
  late var fechaOperacion_;
  late var hora_;
  late var cadenaCda_;
  late var numeroCertificado_;
  late var sello_;
  late var bancoReceptor_B_;
  late var nombre_B_;
  late var tipoCuenta_B_;
  late var cuenta_B_;
  late var rfc_B_;
  late var concepto_B_;
  late var iva_B_;
  late var montoPago_B_;
  late var bancoEmisor_O_;
  late var nombre_O__O_;
  late var cuenta_O_;
  late var rfc_O_;
  late var tipoCuenta_O_;
}

class c_TpeTuristaPasajeroExtranjero with ChangeNotifier{
  late var version_;
  late var fechadeTransito_;
  late var tipoTransito_;
  late var via_DT_;
  late var tipoId_DT_;
  late var numeroId_DT_;
  late var nacionalidad_DT_;
  late var empresaTransporte_DT_;
  late var idTransporte_DT_;
}

class c_ValesdedespensaValesDeDespensa with ChangeNotifier{
  late var version_;
  late var tipoOperacion_;
  late var registroPatronal_;
  late var numeroDeCuenta_;
  late var total_;
  late List<ValesdedespensaConcepto>? valesdedespensaConcepto_C_;
}

class c_VehiculousadoVehiculoUsado with ChangeNotifier{
  late var version_;
  late var montoAdquisicion_;
  late var montoEnajenacion_;
  late var claveVehicular_;
  late var marca_;
  late var tipo_;
  late var modelo_;
  late var numeroMotor_;
  late var numeroSerie_;
  late var niv_;
  late var valor_;
  late var numero_IA_;
  late var fecha_IA_;
  late var aduana_IA_;
}

class c_Ecc11EstadoDeCuentaCombustible with ChangeNotifier{
  late var version_;
  late var tipoOperacion_;
  late var numeroDeCuenta_;
  late var subTotal_;
  late var total_;
  late var identificador_C_;
  late var fecha_C_;
  late var rfc_C_;
  late var claveEstacion_C_;
  late var tar_C_;
  late var cantidad_C_;
  late var noIdentificacion_C_;
  late var unidad_C_;
  late var nombreCombustible_C_;
  late var folioOperacion_C_;
  late var valorUnitario_C_;
  late var importe_C_;
  late List<Ecc11Traslado> ecc11Traslado_C_T_;
}

class c_DecretoRenovacionysustitucionvehiculos with ChangeNotifier{
  late var version_;
  late var tipoDeDecreto_;
  late var vehEnaj_DRV_;
  late var ao_DRV_VNSEFP_;
  late var modelo_DRV_VNSEFP_;
  late var numPlacas_DRV_VNSEFP_;
  late var precioVehUsado_DRV_VEPAF_;
  late var tipoVeh_DRV_VEPAF_;
  late var marca_DRV_VEPAF_;
  late var tipooClase_DRV_VEPAF_;
  late var ao_DRV_VEPAF_;
  late var modelo_DRV_VEPAF_;
  late var niv_DRV_VEPAF_;
  late var numSerie_DRV_VEPAF_;
  late var numPlacas_DRV_VEPAF_;
  late var numMotor_DRV_VEPAF_;
  late var numFolTarjCir_DRV_VEPAF_;
  late var foliofiscal_DRV_VEPAF_;
  late var numFolAvisoint_DRV_VEPAF_;
  late var numPedIm_DRV_VEPAF_;
  late var aduana_DRV_VEPAF_;
  late var fechaRegulVeh_DRV_VEPAF_;
  late var vehEnaj_DSV_;
  late var ao_DSV_VNSEFP_;
  late var modelo_DSV_VNSEFP_;
  late var numPlacas_DSV_VNSEFP_;
  late var precioVehUsado_DSV_VEPAF_;
  late var tipoVeh_DSV_VEPAF_;
  late var marca_DSV_VEPAF_;
  late var tipooClase_DSV_VEPAF_;
  late var ao_DSV_VEPAF_;
  late var modelo_DSV_VEPAF_;
  late var niv_DSV_VEPAF_;
  late var numSerie_DSV_VEPAF_;
  late var numPlacas_DSV_VEPAF_;
  late var numMotor_DSV_VEPAF_;
  late var numFolTarjCir_DSV_VEPAF_;
  late var foliofiscal_DSV_VEPAF_;
  late var numFolAvisoint_DSV_VEPAF_;
  late var numPedIm_DSV_VEPAF_;
  late var aduana_DSV_VEPAF_;
  late var fechaRegulVeh_DSV_VEPAF_;
}

class c_DetallistaDetallista with ChangeNotifier{

  late var documentStructureVersion_;
  late var documentStatus_;
  late var type_;
  late var contentVersion_;

  late var t_DRFPI_DGlnC_;

  late var code_DSI_;
  late var t_DSI_DGlnC_;

  late var type_DOI_DAPIC_;
  late var t_DOI_DAPIC_;
  late var t_DOI_DGlnC_;

  late var type_DAI_DAPIC_;
  late var t_DAI_DAPIC_;

  late var t_DDN_ri_DGlnC_;
  late var t_RI_DDN_rd_DGlnC_;

  late var t_DB_DGlnC_;
  late var t_DB_DCI_DPoDN_DGlnC_;

  late var t_DS_DGlnC_;
  late var type_DS_DAPIC_;
  late var t_DS_DAPIC_;

  late var t_DST_DGlnC_;
  late var Name_DST_DICDNA_DGlnC_;
  late var StreetAddressOne_DST_DICDNA_DGlnC_;
  late var City_DST_DICDNA_DGlnC_;
  late var PostalCode_DST_DICDNA_DGlnC_;

  late var t_DIC_DGlnC_;
  late var type_DIC_DAPIC_;
  late var t_DIC_DAPIC_;
  late var Name_DIC_DICDNaA_DGlnC_;
  late var StreetAddresOne_DIC_DICDNaA_DGlnC_;
  late var City_DIC_DICDNaA_DGlnC_;
  late var PostalCode_DIC_DICDNaA_DGlnC_;

  late var t_DDDC_DGlnC_;

  late var currenyisoCode_DC_;
  late var Currencyunction_DC_DlnC_;
  late var RateOfChange_DC_DlnC_;

  late var paymentTermsEvent_DPT_;
  late var paymentTermsRelationTime_DPT_;
  late var netPaymentTermsType_DPT_DNP_;
  late var timePeriod_DPT_DNP_DPTP_DTPD_;
  late var Value_DPT_DNP_DPTP_DTPD_DGlnC_;
  late var discountType_DPT_DDP_;
  late var Percentage_DPT_DDP_DGlnC_;

  late var type_DPIC_;

  late var alowanceChargeType_DDDAC_;
  late var settlemntType_DDDAC_;
  late var sequencenumber_DDDAC_;
  late var base_DDDAC_PDMAOP_DR_;
  late var Percentage_DDDAC_PDMAOP_DR_DGlnC_;

  late var type_DLI_;
  late var number_DLI_;
  late var Gtin_DLI_DTII_DGlnC_;
  late var type_DLI_DAPIC_;
  late var t_DLI_DAPIC_;
  late var language_DLI_DTIDI_;
  late var LongText_DLI_DTIDI_DGlnC_;
  late var unitOfMeasure_DLI_DIQ_;
  late var t_DLI_DIQ_;
  late var quantityType_DLI_DAQ_;
  late var t_DLI_DAQ_;
  late var Amount_DLI_GP_DTAC_DGlnC_;
  late var Amount_DLI_NP_DTAC_DGlnC_;
  late var type_DLI_DAI_DAPIC_;
  late var t_DLI_DAI_DAPIC_;
  late var Gln_DLI_DLIDC_DGlnC_;
  late var type_DLI_DLIDC_DAPIC_;
  late var t_DLI_DLIDC_DAPIC_;
  late var ReferenceDate_DLI_DLIDC_DGlnC_;
  late var Name_DLI_DLIDC_DCDNAA_DGlnC_;
  late var type_DLI_DLU_DAPIC_;
  late var t_DLI_DLU_DAPIC_;
  late var PalletQuantity_DLI_DPI_DGlnC_;
  late var type_DLI_DPI_DAPIC_;
  late var t_DLI_DPI_DAPIC_;
  late var MethodOfPayment_DLI_DPI_DT_DGlnC_;
  late var productionDate_DLI_DEA_DLN_;
  late var t_DLI_DEA_DLN_;
  late var allowanceChargeType_DLI_DLIDAC_;
  late var settlementType_DLI_DLIDAC_;
  late var sequenceNumber_DLI_DLIDAC_;
  late var SpecialServicesType_DLI_DLIDAC_DGlnC_;
  late var PercentagePerUnit_DLI_DLIDAC_FDMAOP_DGlnC_;
  late var AmountPerUnit_DLI_DLIDAC_FDMAOP_DRPU_DGlnC_;
  late var TaxTypeDescription_DLI_DTITI_DGlnC_;
  late var ReferenceNumber_DLI_DTITI_DGlnC;
  late var TaxCategory_DLI_DTITI_DGlnC_;
  late var TacPercentge_DLI_DTITI_DTITA_DGlnC_;
  late var TaxAmount_DLI_DTITI_DTITA_DGlnC_;
  late var GrossAmount_DLI_DTLA_DTAC_DGlnC_;
  late var NetAmount_DLI_DTLA_DTAC_DGlnC_;

  late var Amount_DTAC_DGlnC_;

  late var allowanceOrChargeType_DTAC_;
  late var SpecialServicesType_DTAC_DGnC_;
  late var Amount_DTAC_DGnC_;
  
}
//EndRegion

// Clases necesarias para complementos factura
class Xmln {
    Xmln();

    factory Xmln.fromJson(Map<String, dynamic> json) => Xmln(
    );

    Map<String, dynamic> toJson() => {
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
// Fin de clases necesarias para complementos factura


class c_arrendamiendoenfideicomiso with ChangeNotifier {
  late var version_;
  late var pagProvEfecPorFiduc_;
  late var rendimFideicom_;
  late var deduccCorresp_;
  late var montTotRet_;
}

class c_dividendos with ChangeNotifier {
  //RetencionesFromJson(str,'arrendamientoenfideicomiso');
  late var version_;
  late var cveTipDivOUtil_;
  late var montIsrAcredRetMexico_;
  late var montIsrAcredRetExtranjero_;
  late var tipoSocDistrDiv_;
  late var montRetExtDivExt_;
  late var montDivAcumExt_;
  late var montDivAcumNal_;
  late var montIsrAcredNal_;
}

class c_enajenaciondeacciones with ChangeNotifier {
  late var version_;
  late var contratoIntermediacion_;
  late var ganancia_;
  late var perdida_;
}

class c_fideicomisonoempresarial with ChangeNotifier {
  late var version_;
  late var montTotEgresPeriodo_DoS_;
  late var partPropDelFideicom_DoS_;
  late var propDelMontTot_DoS_;
  late var conceptoS_IE_;
  late var montTotEntradasPeriodo_IoE_;
  late var partPropAcumDelFideicom_IoE_;
  late var propDelMontTot_IoE_;
  late var concepto_II_;
  late var montRetRelPagFideic_REF_;
  late var descRetRelPagFideic_REF_;
}

class c_intereses with ChangeNotifier {
  late var version_;
  late var sistFinanciero_;
  late var retiroAoresRetInt_;
  late var operFinancDerivad_;
  late var montIntNominal_;
  late var montIntReal_;
  late var perdida_;
}

class c_intereseshipotecarios with ChangeNotifier {
  late var version_;
  late var creditoDeInstFinanc_;
  late var saldoInsoluto_;
  late var propDeducDelCredit_;
  late var montTotIntNominalesDev_;
  late var montTotIntNominalesDevYPag_;
  late var montTotIntRealPagDeduc_;
  late var numContrato_;
}

class c_operacionesconderivados with ChangeNotifier {
  late var version_;
  late var montGanAcum_;
  late var montPerdDed_;
}

class c_pagosaextranjeros with ChangeNotifier {
  late var version_PE_;
  late var esBenefEfectDelCobro_PE_;
  late var rfc_B_;
  late var curp_B_;
  late var nomDenRazSocB_B_;
  late var conceptoPago_B_;
  late var descripcionConcepto_B_;
}

class c_planesderetiro with ChangeNotifier {
  late var version_;
  late var sistemaFinanc_;
  late var montTotAportAnioInmAnterior_;
  late var montIntRealesDevengAniooInmAnt_;
  late var huboRetirosAnioInmAntPer_;
  late var montTotRetiradoAnioInmAntPer_;
  late var montTotExentRetiradoAnioInmAnt_;
  late var montTotExedenteAnioInmAnt_;
  late var huboRetirosAnioInmAnt_;
  late var montTotRetiradoAnioInmAnt_;
}

class c_premios with ChangeNotifier {
  late var version_;
  late var entidadFederativa_;
  late var montTotPago_;
  late var montTotPagoGrav_;
  late var montTotPagoExent_;
}

class c_sectorfinanciero with ChangeNotifier {
  late var version_;
  late var idFideicom_;
  late var nomFideicom_;
  late var descripFideicom_;
}

class c_serviciosplataformastecnologicas with ChangeNotifier {
    late var difIvaEntregadoPrestServ_SPT;
    late var monTotServSiva_SPT;
    late var monTotalporUsoPlataforma_SPT;
    late var numServ_SPT;
    late var periodicidad_SPT;
    late var totalIsrRetenido_SPT;
    late var totalIvaRetenido_SPT;
    late var totalIvaTrasladado_SPT;
    late var version_SPT;
    late var fechaServ_DS;
    late var formaPagoServ_DS;
    late var precioServSinIva_DS;
    late var tipoDeServ_DS;
    late var base_ITS;
    late var importe_ITS;
    late var impuesto_ITS;
    late var tasaCuota_ITS;
    late var tipoFactor_ITS;
    late var base_CS;
    late var importe_CS;
    late var porcentaje_CS;
}
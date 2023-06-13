

// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types, unused_local_variable

import 'dart:convert';
//import 'package:jackson/complementos_factura.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Clase_Luis.dart/Providers.dart';


class al_shile{
comprobanteFromJson(String tipo, String str, context) => comprobante( tipo, json.decode(str), context);

comprobante(String tipo, Map<String, dynamic> parse, context) {

  switch (tipo){

   case "aieps":
      var es = Provider.of<c_AiepsAcreditamientoIeps>(context, listen: false);
      final json = parse["cfdi\u0024ComplementoConcepto"];
      final algo = json["aieps\u0024acreditamientoIEPS"];
      es.version_ = algo["Version"] ?? '';
      es.tar_ = algo["TAR"] ?? '';   
      break;

    case "iedu":
      var es = Provider.of<c_IeduInstEducativas>(context, listen: false);
      final json = parse["cfdi\u0024ComplementoConcepto"];
      final algo = json["iedu\u0024instEducativas"];
      es.version_ = algo["version"] ?? '';
      es.nombreAlumno_ = algo["nombreAlumno"] ?? '';
      es.curp_ = algo["CURP"] ?? '';
      es.nivelEducativo_ = algo["nivelEducativo"] ?? '';
      es.autRvoe_ = algo["autRVOE"] ?? '';
      es.rfcPago_ = algo["rfcPago"] ?? '';        
      break;

    case "terceros":
      var es = Provider.of<c_TercerosPorCuentadeTerceros>(context, listen: false);
      final json = parse["cfdi\u0024ComplementoConcepto"];
      final algo = json["terceros\u0024PorCuentadeTerceros"];
      es.version_ = algo["version"] ?? '';
      es.rfc_ = algo["rfc"] ?? '';   
      es.nombre_ = algo["nombre"] ?? '';   
      es.xmlns_ = List<Xmln>.from(algo["xmlns"].map((x) => Xmln.fromJson(x))); //falta vacio
      es.xmlnsTerceros_ = algo["xmlns\u0024terceros"] ?? '';   
      es.tercerosParte_ = List<TercerosParte>.from(algo["terceros\u0024Parte"].map((x) => TercerosParte.fromJson(x)));  //falta vacio 
      final algo2 = algo["terceros\u0024Impuestos"]; 
      final algo3 = algo2["terceros\u0024Traslados"];  
      es.tercerosTraslado_IT_ = List<TercerosTraslado>.from(algo3["terceros\u0024Traslado"].map((x) => TercerosTraslado.fromJson(x))); //alta vacio
      final algo4 = algo["terceros\u0024InformacionFiscalTercero"];
      es.calle_IFT_ = algo4["calle"] ?? '';   
      es.noExterior_IFT_ = algo4["noExterior"] ?? '';   
      es.municipio_IFT_ = algo4["municipio"] ?? '';   
      es.estado_IFT_ = algo4["estado"] ?? '';   
      es.pais_IFT_ = algo4["pais"] ?? '';   
      es.codigoPostal_IFT_ = algo4["codigoPostal"] ?? '';   
      break;

    case "ventavehiculos":
      var es = Provider.of<c_VentavehiculosVentaVehiculos>(context, listen: false);
      final json = parse["cfdi\u0024ComplementoConcepto"];
      final algo = json["ventavehiculos\u0024VentaVehiculos"];
      es.version_ = algo["version"] ?? '';
      es.claveVehicular_ = algo["ClaveVehicular"] ?? '';
      es.niv_ = algo["Niv"] ?? '';
      final algo2 = algo["ventavehiculos\u0024Parte"];
      es.cantidad_P_ = algo2["cantidad"] ?? '';
      es.unidad_P_ = algo2["unidad"] ?? '';
      es.noIdentificacion_P_ = algo2["noIdentificacion"] ?? '';
      es.descripcion_P_ = algo2["descripcion"] ?? '';
      es.valorUnitario_P_ = algo2["valorUnitario"] ?? '';
      es.importe_P_ = algo2["importe"] ?? '';
      final algo3 = algo2["ventavehiculos\u0024InformacionAduanera"];
      es.numero_P_IA_ = algo3["numero"] ?? '';
      es.fecha_P_IA_ = algo3["fecha"] ?? '';
      es.aduana_P_IA_ = algo3["aduana"] ?? '';
      break;
    
    case "aerolineas":
      var es = Provider.of<c_AerolineasAerolineas>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["aerolineas\u0024Aerolineas"];
      es.version_ = algo["Version"] ?? '';
      es.tua_ = algo["TUA"] ?? '';
      final algo2 = algo["aerolineas\u0024OtrosCargos"];
      es.totalCargos_AOT_ = algo2["TotalCargos"] ?? '';
      final algo3 = algo2["aerolineas\u0024Cargo"];
      es.codigoCargo_AOT_AC_ = algo3["CodigoCargo"] ?? '';
      es.importe_AOT_AC_ = algo3["Importe"] ?? '';
      break;
    
    case "destruccion":
      var es = Provider.of<c_DestruccionCertificadodedestruccion>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["destruccion\u0024certificadodedestruccion"];
      es.version_ = algo["Version"] ?? '';
      es.serie_ = algo["Serie"] ?? '';
      es.numFolDesVeh_ = algo["NumFolDesVeh"] ?? '';
      final algo2 = algo["destruccion\u0024InformacionAduanera"];
      es.numPedImp_DIA_ = algo2["NumPedImp"] ?? '';
      es.fecha_DIA_ = algo2["Fecha"] ?? '';
      es.aduana_DIA_ = algo2["Aduana"] ?? '';
      final algo3 = algo["destruccion\u0024VehiculoDestruido"];
      es.marca_DVD = algo3["Marca"] ?? '';
      es.tipooClase_DVD = algo3["TipooClase"] ?? '';
      es.ao_DVD = algo3["Año"] ?? '';
      es.modelo_DVD = algo3["Modelo"] ?? '';
      es.niv_DVD = algo3["NIV"] ?? '';
      es.numSerie_DVD = algo3["NumSerie"] ?? '';
      es.numPlacas_DVD = algo3["NumPlacas"] ?? '';
      es.numMotor_DVD = algo3["NumMotor"] ?? '';
      es.numFolTarjCir_DVD = algo3["NumFolTarjCir"] ?? '';
      break;
    
    case "cce":
      var es = Provider.of<c_CceComercioExterior>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["cce\u0024ComercioExterior"];
      es.version_ = algo["Version"] ?? '';
      es.tipoOperacion_ = algo["TipoOperacion"] ?? '';
      es.claveDePedimento_ = algo["ClaveDePedimento"] ?? '';
      es.certificadoOrigen_ = algo["CertificadoOrigen"] ?? '';
      es.numeroExportadorConfiable_ = algo["NumeroExportadorConfiable"] ?? '';
      es.incoterm_ = algo["Incoterm"] ?? '';
      es.subdivision_ = algo["Subdivision"] ?? '';
      es.observaciones_ = algo["Observaciones"] ?? '';
      es.tipoCambioUsd_ = algo["TipoCambioUSD"] ?? '';
      es.totalUsd_ = algo["TotalUSD"] ?? '';
      final algo2 = algo["cce\u0024Destinatario"];
      es.numRegIdTrib_D = algo2["NumRegIdTrib"] ?? '';
      final algo3 = algo2["cce\u0024Domicilio"];
      es.calle_D_D_ = algo3["Calle"] ?? '';
      es.estado_D_D_ = algo3["Estado"] ?? '';
      es.pais_D_D_ = algo3["Pais"] ?? '';
      es.codigoPostal_D_D_ = algo3["CodigoPostal"] ?? '';
      final algo4 = algo["cce\u0024Mercancias"];
      es.cceMercancia_M_ = List<CceMercancia>.from(algo4["cce\u0024Mercancia"].map((x) => CceMercancia.fromJson(x)));
      final algo5= algo["cce\u0024Receptor"];
      es.numRegIdTrib_R_ = algo5["NumRegIdTrib"] ?? '';
      break;
    
    case "divisas":
      var es = Provider.of<c_DivisasDivisas>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["divisas\u0024Divisas"];
      es.version_ = algo["version"] ?? '';
      es.tipoOperacion_ = algo["tipoOperacion"] ?? '';
      es.xmlns_DD_ = List<Xmln>.from(algo["xmlns"].map((x) => Xmln.fromJson(x)));
      es.xmlnsDivisas_ = algo["xmlns\u0024divisas"] ?? '';
      break;
    
    case "consumodecombustibles":
      var es = Provider.of<c_ConsumodecombustiblesConsumoDeCombustibles_10>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["consumodecombustibles\u0024ConsumoDeCombustibles"];
      es.version_ = algo["version"] ?? '';
      es.tipoOperacion_ = algo["tipoOperacion"] ?? '';
      es.numeroDeCuenta_ = algo["numeroDeCuenta"] ?? '';
      es.subTotal_ = algo["subTotal"] ?? '';
      es.total_ = algo["total"] ?? '';
      final algo2 = algo["consumodecombustibles\u0024Conceptos"];
      final algo3 = algo2["consumodecombustibles\u0024ConceptoConsumoDeCombustibles"];
      es.identificador_CCC_CDC_ = algo3["identificador"] ?? '';
      es.fecha_CCC_CDC_ = algo3["fecha"] ?? '';
      es.rfc_CCC_CDC_ = algo3["rfc"] ?? '';
      es.claveEstacion_CCC_CDC_ = algo3["claveEstacion"] ?? '';
      es.cantidad_CCC_CDC_ = algo3["cantidad"] ?? '';
      es.nombreCombustible_CCC_CDC_ = algo3["nombreCombustible"] ?? '';
      es.folioOperacion_CCC_CDC_ = algo3["folioOperacion"] ?? '';
      es.valorUnitario_CCC_CDC_ = algo3["valorUnitario"] ?? '';
      es.importe_CCC_CDC_ = algo3["importe"] ?? '';
      final algo4 = algo3["consumodecombustibles\u0024Determinados"];
      final algo5 = algo4["consumodecombustibles\u0024Determinado"];
      es.impuesto_CCC_CDC_CCD_ = algo5["impuesto"] ?? '';
      es.tasa_CCC_CDC_CCD_ = algo5["tasa"] ?? '';
      es.importe_CCC_CDC_CCD_ = algo5["importe"] ?? '';
      break;
    
    case "consumodecombustibles11":
      var es = Provider.of<c_Consumodecombustibles11ConsumoDeCombustibles_11>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["consumodecombustibles11\u0024ConsumoDeCombustibles"];
      es.version_ = algo["version"] ?? '';
      es.numeroDeCuenta_ = algo["numeroDeCuenta"] ?? '';
      es.tipoOperacion_ = algo["tipoOperacion"] ?? '';
      es.subTotal_ = algo["subTotal"] ?? '';
      es.total_ = algo["total"] ?? '';
      final algo2 = algo["consumodecombustibles11\u0024Conceptos"];
      final algo3 = algo2["consumodecombustibles11\u0024ConceptoConsumoDeCombustibles"];
      es.identificador_CCC_ = algo3["identificador"] ?? '';
      es.fecha_CCC_ = algo3["fecha"] ?? '';
      es.rfc_CCC_ = algo3["rfc"] ?? '';
      es.claveEstacion_CCC_ = algo3["claveEstacion"] ?? '';
      es.tipoCombustible_CCC_ = algo3["tipoCombustible"] ?? '';
      es.cantidad_CCC_ = algo3["cantidad"] ?? '';
      es.nombreCombustible_CCC_ = algo3["nombreCombustible"] ?? '';
      es.folioOperacion_CCC_ = algo3["folioOperacion"] ?? '';
      es.valorUnitario_CCC_ = algo3["valorUnitario"] ?? '';
      es.importe_CCC_ = algo3["importe"] ?? '';
      final algo4 = algo3["consumodecombustibles11\u0024Determinados"];
      final algo5 = algo4["consumodecombustibles11\u0024Determinado"];
      es.impuesto_CCD_ = algo5["impuesto"] ?? '';
      es.tasaOCuota_CCD_ = algo5["tasaOCuota"] ?? '';
      es.importe_CCD_ = algo5["importe"] ?? '';
      break;
    
    case "donat":
      var es = Provider.of<c_DonatDonatarias>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["donat\u0024Donatarias"];
      es.version_ = algo["version"] ?? '';
      es.noAutorizacion_ = algo["noAutorizacion"] ?? '';
      es.fechaAutorizacion_ = algo["fechaAutorizacion"] ?? '';
      es.leyenda_ = algo["leyenda"] ?? '';
      break;
    
    case "ecc12":
      var es = Provider.of<c_Ecc12EstadoDeCuentaCombustible_12>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["ecc12\u0024EstadoDeCuentaCombustible"];
      es.numeroDeCuenta_ = algo["NumeroDeCuenta"] ?? '';
      es.subTotal_ = algo["SubTotal"] ?? '';
      es.tipoOperacion_ = algo["TipoOperacion"] ?? '';
      es.total_ = algo["Total"] ?? '';
      es.version_ = algo["Version"] ?? '';
      final algo2 = algo["ecc12\u0024Conceptos"];
      es.ecc12ConceptoEstadoDeCuentaCombustible_C_ = List<Ecc12ConceptoEstadoDeCuentaCombustible>.from(algo2["ecc12\u0024ConceptoEstadoDeCuentaCombustible"].map((x) => Ecc12ConceptoEstadoDeCuentaCombustible.fromJson(x)));//LISTA
      break;
    
    case "gceh":
      var es = Provider.of<c_GcehGastosHidrocarburos>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["gceh\u0024GastosHidrocarburos"];
      es.version_ = algo["Version"] ?? '';
      es.areaContractual_ = algo["AreaContractual"] ?? '';
      es.numeroContrato_ = algo["NumeroContrato"] ?? '';
      es.gcehErogacion_ = List<GcehErogacion>.from(algo["gceh\u0024Erogacion"].map((x) => GcehErogacion.fromJson(x)));
      break;
    
    case "ieeh":
      var es = Provider.of<c_IeehIngresosHidrocarburos>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["ieeh\u0024IngresosHidrocarburos"];
      es.version_ = algo["Version"] ?? '';
      es.porcentaje_ = algo["Porcentaje"] ?? '';
      es.contraprestacionPagadaOperador_ = algo["ContraprestacionPagadaOperador"] ?? '';
      es.numeroContrato_ = algo["NumeroContrato"] ?? '';
      final algo2 = algo["ieeh\u0024DocumentoRelacionado"];
      es.fechaFolioFiscalVinculado_DR_ = algo2["FechaFolioFiscalVinculado"] ?? '';
      es.folioFiscalVinculado_DR_ = algo2["FolioFiscalVinculado"] ?? '';
      es.mes_DR_ = algo2["Mes"] ?? '';
      break;
    
    case "ine":
      var es = Provider.of<c_IneIne>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["ine\u0024INE"];
      es.version_ = algo["Version"] ?? '';
      es.tipoProceso_ = algo["TipoProceso"] ?? '';
      es.ineEntidad_ = List<IneEntidad>.from(algo["ine\u0024Entidad"].map((x) => IneEntidad.fromJson(x)));
      break;
    
    case "leyendasFisc":
      var es = Provider.of<c_LeyendasFiscLeyendasFiscales>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["leyendasFisc\u0024LeyendasFiscales"];
      es.version_ = algo["version"] ?? '';
      es.xmlns_ = List<Xmln>.from(algo["xmlns"].map((x) => Xmln.fromJson(x)));
      es.xmlnsLeyendasFisc_ = algo["xmlns\u0024leyendasFisc"] ?? '';
      es.leyendasFiscLeyenda_ = List<LeyendasFiscLeyenda>.from(algo["leyendasFisc\u0024Leyenda"].map((x) => LeyendasFiscLeyenda.fromJson(x)));
      break;
    
    case "notariospublicos":
      var es = Provider.of<c_NotariospublicosNotariosPublicos>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["notariospublicos\u0024NotariosPublicos"];
      es.version_ = algo["Version"] ?? '';
      final algo2 = algo["notariospublicos\u0024DatosAdquiriente"];
      es.coproSocConyugalE_DA_ = algo["CoproSocConyugalE"] ?? '';
      final algo3 = algo2["notariospublicos\u0024DatosAdquirientesCopSC"];
      es.notariospublicosDatosAdquirienteCopSc_DA_CSC_ = List<NotariospublicosDatosAdquirienteCopSc>.from(algo3["notariospublicos\u0024DatosAdquirienteCopSC"].map((x) => NotariospublicosDatosAdquirienteCopSc.fromJson(x)));
      final algo4 = algo["notariospublicos\u0024DatosEnajenante"];
      es.coproSocConyugalE_DE_ = algo4["CoproSocConyugalE"] ?? '';
      final algo5 = algo4["notariospublicos\u0024DatosUnEnajenante"];
      es.nombre_DE_DUE_ = algo5["Nombre"] ?? '';
      es.apellidoPaterno_DUE_ = algo5["ApellidoPaterno"] ?? '';
      es.rfc_DUE_ = algo5["RFC"] ?? '';
      es.curp_DUE_ = algo5["CURP"] ?? '';
      final algo6 = algo["notariospublicos\u0024DatosNotario"];
      es.curp_DN_ = algo6["CURP"] ?? '';
      es.numNotaria_DN_ = algo6["NumNotaria"] ?? '';
      es.entidadFederativa_DN_ = algo6["EntidadFederativa"] ?? '';
      final algo7 = algo["notariospublicos\u0024DatosOperacion"];
      es.numInstrumentoNotarial_DO_ = algo7["NumInstrumentoNotarial"] ?? '';
      es.fechaInstNotarial_DO_ = algo7["FechaInstNotarial"] ?? '';
      es.montoOperacion_DO_ = algo7["MontoOperacion"] ?? '';
      es.subtotal_DO_ = algo7["Subtotal"] ?? '';
      es.iva_DO_ = algo7["IVA"] ?? '';
      final algo8 = algo["notariospublicos\u0024DescInmuebles"];
      final algo9 = algo8["notariospublicos\u0024DescInmueble"];
      es.tipoInmueble_DI_ = algo9["TipoInmueble"] ?? '';
      es.calle_DI_ = algo9["Calle"] ?? '';
      es.municipio_DI_ = algo9["Municipio"] ?? '';
      es.estado_DI_ = algo9["Estado"] ?? '';
      es.pais_DI_ = algo9["Pais"] ?? '';
      es.codigoPostal_DI_ = algo9["CodigoPostal"] ?? '';
      break;
    
    case "obrasarte":
      var es = Provider.of<c_ObrasarteObrasarteantiguedades>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["obrasarte\u0024obrasarteantiguedades"];
      es.version_ = algo["Version"] ?? '';
      es.tipoBien_ = algo["TipoBien"] ?? '';
      es.tituloAdquirido_ = algo["TituloAdquirido"] ?? '';
      es.subtotal_ = algo["Subtotal"] ?? '';
      es.iva_ = algo["IVA"] ?? '';
      es.fechaAdquisicion_ = algo["FechaAdquisicion"] ?? '';
      es.caractersticasDeObraoPieza_ = algo["CaracterísticasDeObraoPieza"] ?? '';
      break;
    
    case "implocal":
      var es = Provider.of<c_ImplocalImpuestosLocales>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["implocal\u0024ImpuestosLocales"];
      es.version_ = algo["version"] ?? '';
      es.totaldeRetenciones_ = algo["TotaldeRetenciones"] ?? '';
      es.totaldeTraslados_ = algo["TotaldeTraslados"] ?? '';
      es.implocalRetencionesLocales_ = List<ImplocalRetencionesLocale>.from(algo["implocal\u0024RetencionesLocales"].map((x) => ImplocalRetencionesLocale.fromJson(x)));
      break;
    
    case "pagoenespecie":
      var es = Provider.of<c_PagoenespeciePagoEnEspecie>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["pagoenespecie\u0024PagoEnEspecie"];
      es.version_ = algo["Version"] ?? '';
      es.cvePic_ = algo["CvePIC"] ?? '';
      es.folioSolDon_ = algo["FolioSolDon"] ?? '';
      es.pzaArtNombre_ = algo["PzaArtNombre"] ?? '';
      es.pzaArtTecn_ = algo["PzaArtTecn"] ?? '';
      es.pzaArtAProd_ = algo["PzaArtAProd"] ?? '';
      es.pzaArtDim_ = algo["PzaArtDim"] ?? '';
      break;
    
    case "pfic":
      var es = Provider.of<c_PficPFintegranteCoordinado>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["pfic\u0024PFintegranteCoordinado"];
      es.version_ = algo["version"] ?? '';
      es.claveVehicular_ = algo["ClaveVehicular"] ?? '';
      es.placa_ = algo["Placa"] ?? '';
      es.rfcpf_ = algo["RFCPF"] ?? '';
      break;
    
    case "servicioparcial":
      var es = Provider.of<c_ServicioparcialParcialesconstruccion>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["servicioparcial\u0024parcialesconstruccion"];
      es.version_ = algo["Version"] ?? '';
      es.numPerLicoAut_ = algo["NumPerLicoAut"] ?? '';
      final algo2 = algo["servicioparcial\u0024Inmueble"];
      es.calle_I_ = algo2["Calle"] ?? '';
      es.codigoPostal_I_ = algo2["CodigoPostal"] ?? '';
      es.estado_I_ = algo2["Estado"] ?? '';
      es.municipio_I_ = algo2["Municipio"] ?? '';
      break;
    
    case "spei":
      var es = Provider.of<c_SpeiComplementoSpei>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["spei\u0024Complemento_SPEI"];
      final algo2 = algo["spei\u0024SPEI_Tercero"];
      es.claveSpei_ = algo2["ClaveSPEI"] ?? '';
      es.fechaOperacion_ = algo2["FechaOperacion"] ?? '';
      es.hora_ = algo2["Hora"] ?? '';
      es.cadenaCda_ = algo2["cadenaCDA"] ?? '';
      es.numeroCertificado_ = algo2["numeroCertificado"] ?? '';
      es.sello_ = algo2["sello"] ?? '';
      final algo3 = algo2["spei\u0024Beneficiario"];
      es.bancoReceptor_B_ = algo3["BancoReceptor"] ?? '';
      es.nombre_B_ = algo3["Nombre"] ?? '';
      es.tipoCuenta_B_ = algo3["TipoCuenta"] ?? '';
      es.cuenta_B_ = algo3["Cuenta"] ?? '';
      es.rfc_B_ = algo3["RFC"] ?? '';
      es.concepto_B_ = algo3["Concepto"] ?? '';
      es.iva_B_ = algo3["IVA"] ?? '';
      es.montoPago_B_ = algo3["MontoPago"] ?? '';
      final algo4 = algo2["spei\u0024Ordenante"];
      es.bancoEmisor_O_ = algo4["BancoEmisor"] ?? '';
      es.nombre_O__O_ = algo4["Nombre"] ?? '';
      es.cuenta_O_ = algo4["Cuenta"] ?? '';
      es.rfc_O_ = algo4["RFC"] ?? '';
      es.tipoCuenta_O_ = algo4["TipoCuenta"] ?? '';
      break;

    case "tpe":
      var es = Provider.of<c_TpeTuristaPasajeroExtranjero>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["tpe\u0024TuristaPasajeroExtranjero"];
      es.version_ = algo["version"] ?? '';
      es.fechadeTransito_ = algo["fechadeTransito"] ?? '';
      es.tipoTransito_ = algo["tipoTransito"] ?? '';
      final algo2 = algo["tpe\u0024datosTransito"];
      es.via_DT_ = algo2["Via"] ?? '';
      es.tipoId_DT_ = algo2["TipoId"] ?? '';
      es.numeroId_DT_ = algo2["NumeroId"] ?? '';
      es.nacionalidad_DT_ = algo2["Nacionalidad"] ?? '';
      es.empresaTransporte_DT_ = algo2["EmpresaTransporte"] ?? '';
      es.idTransporte_DT_ = algo2["IdTransporte"] ?? '';
      break;
    
    case "valesdedespensa":
      var es = Provider.of<c_ValesdedespensaValesDeDespensa>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["valesdedespensa\u0024ValesDeDespensa"];
      es.version_ = algo["version"] ?? '';
      es.tipoOperacion_ = algo["tipoOperacion"] ?? '';
      es.registroPatronal_ = algo["registroPatronal"] ?? '';
      es.numeroDeCuenta_ = algo["numeroDeCuenta"] ?? '';
      es.total_ = algo["total"] ?? '';
      final  algo2 = algo["valesdedespensa\u0024Conceptos"];
      es.valesdedespensaConcepto_C_ = List<ValesdedespensaConcepto>.from(algo2["valesdedespensa\u0024Concepto"].map((x) => ValesdedespensaConcepto.fromJson(x)));
      break;
    
    case "vehiculousado":
      var es = Provider.of<c_VehiculousadoVehiculoUsado>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["vehiculousado\u0024VehiculoUsado"];
      es.version_ = algo["Version"] ?? '';
      es.montoAdquisicion_ = algo["montoAdquisicion"] ?? '';
      es.montoEnajenacion_ = algo["montoEnajenacion"] ?? '';
      es.claveVehicular_ = algo["claveVehicular"] ?? '';
      es.marca_ = algo["marca"] ?? '';
      es.tipo_ = algo["tipo"] ?? '';
      es.modelo_ = algo["modelo"] ?? '';
      es.numeroMotor_ = algo["numeroMotor"] ?? '';
      es.numeroSerie_ = algo["numeroSerie"] ?? '';
      es.niv_ = algo["NIV"] ?? '';
      es.valor_ = algo["valor"] ?? '';
      final algo2 = algo["vehiculousado\u0024InformacionAduanera"];
      es.numero_IA_ = algo2["numero"] ?? '';
      es.fecha_IA_ = algo2["fecha"] ?? '';
      es.aduana_IA_ = algo2["aduana"] ?? '';
      break;
    
    case "ecc11":
      var es = Provider.of<c_Ecc11EstadoDeCuentaCombustible>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["ecc11\u0024EstadoDeCuentaCombustible"];
      es.version_ = algo["Version"] ?? '';
      es.tipoOperacion_ = algo["TipoOperacion"] ?? '';
      es.numeroDeCuenta_ = algo["NumeroDeCuenta"] ?? '';
      es.subTotal_ = algo["SubTotal"] ?? '';
      es.total_ = algo["Total"] ?? '';
      final algo2 = algo["ecc11\u0024Conceptos"];
      final algo3 = algo2["ecc11\u0024ConceptoEstadoDeCuentaCombustible"];
      es.identificador_C_ = algo3["Identificador"] ?? '';
      es.fecha_C_ = algo3["Fecha"] ?? '';
      es.rfc_C_ = algo3["Rfc"] ?? '';
      es.claveEstacion_C_ = algo3["ClaveEstacion"] ?? '';
      es.tar_C_ = algo3["TAR"] ?? '';
      es.cantidad_C_ = algo3["Cantidad"] ?? '';
      es.noIdentificacion_C_ = algo3["NoIdentificacion"] ?? '';
      es.unidad_C_ = algo3["Unidad"] ?? '';
      es.nombreCombustible_C_ = algo3["NombreCombustible"] ?? '';
      es.folioOperacion_C_ = algo3["FolioOperacion"] ?? '';
      es.valorUnitario_C_ = algo3["ValorUnitario"] ?? '';
      es.importe_C_ = algo3["Importe"] ?? '';
      final algo4 = algo3["ecc11\u0024Traslados"];
      es.ecc11Traslado_C_T_ = List<Ecc11Traslado>.from(algo4["ecc11\u0024Traslado"].map((x) => Ecc11Traslado.fromJson(x)));
      break;
    
    case "decreto":
      var es = Provider.of<c_DecretoRenovacionysustitucionvehiculos>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["decreto\u0024renovacionysustitucionvehiculos"];
      es.version_ = algo["Version"] ?? '';
      es.tipoDeDecreto_ = algo["TipoDeDecreto"] ?? '';
      final algo2 = algo["decreto\u0024DecretoRenovVehicular"];
      es.vehEnaj_DRV_ = algo2["VehEnaj"] ?? '';
      final algo3 = algo2["decreto\u0024VehiculoNuvoSemEnajenadoFabAlPerm"];
      es.ao_DRV_VNSEFP_ = algo3["Año"] ?? '';
      es.modelo_DRV_VNSEFP_ = algo3["Modelo"] ?? '';
      es.numPlacas_DRV_VNSEFP_ = algo3["NumPlacas"] ?? '';
      final algo4 = algo2["decreto\u0024VehiculosUsadosEnajenadoPermAlFab"];
      es.precioVehUsado_DRV_VEPAF_ = algo4["PrecioVehUsado"] ?? '';
      es.tipoVeh_DRV_VEPAF_ = algo4["TipoVeh"] ?? '';
      es.marca_DRV_VEPAF_ = algo4["Marca"] ?? '';
      es.tipooClase_DRV_VEPAF_ = algo4["TipooClase"] ?? '';
      es.ao_DRV_VEPAF_ = algo4["Año"] ?? '';
      es.modelo_DRV_VEPAF_ = algo4["Modelo"] ?? '';
      es.niv_DRV_VEPAF_ = algo4["NIV"] ?? '';
      es.numSerie_DRV_VEPAF_ = algo4["NumSerie"] ?? '';
      es.numPlacas_DRV_VEPAF_ = algo4["NumPlacas"] ?? '';
      es.numMotor_DRV_VEPAF_ = algo4["NumMotor"] ?? '';
      es.numFolTarjCir_DRV_VEPAF_ = algo4["NumFolTarjCir"] ?? '';
      es.foliofiscal_DRV_VEPAF_ = algo4["Foliofiscal"] ?? '';
      es.numFolAvisoint_DRV_VEPAF_ = algo4["NumFolAvisoint"] ?? '';
      es.numPedIm_DRV_VEPAF_ = algo4["NumPedIm"] ?? '';
      es.aduana_DRV_VEPAF_ = algo4["Aduana"] ?? '';
      es.fechaRegulVeh_DRV_VEPAF_ = algo4["FechaRegulVeh"] ?? '';
      final algo5 = algo["decreto\u0024DecretoSustitVehicular"];    
      es.vehEnaj_DSV_ = algo5["VehEnaj"] ?? '';
      final algo6 = algo5["decreto\u0024VehiculoNuvoSemEnajenadoFabAlPerm"];
      es.ao_DSV_VNSEFP_ = algo6["Año"] ?? '';
      es.modelo_DSV_VNSEFP_ = algo6["Modelo"] ?? '';
      es.numPlacas_DSV_VNSEFP_ = algo6["NumPlacas"] ?? '';
      final algo7 = algo5["decreto\u0024VehiculoUsadoEnajenadoPermAlFab"];
      es.precioVehUsado_DSV_VEPAF_ = algo7["PrecioVehUsado"] ?? '';
      es.tipoVeh_DSV_VEPAF_ = algo7["TipoVeh"] ?? '';
      es.marca_DSV_VEPAF_ = algo7["Marca"] ?? '';
      es.tipooClase_DSV_VEPAF_ = algo7["TipooClase"] ?? '';
      es.ao_DSV_VEPAF_ = algo7["Año"] ?? '';
      es.modelo_DSV_VEPAF_ = algo7["Modelo"] ?? '';
      es.niv_DSV_VEPAF_ = algo7["NIV"] ?? '';
      es.numSerie_DSV_VEPAF_ = algo7["NumSerie"] ?? '';
      es.numPlacas_DSV_VEPAF_ = algo7["NumPlacas"] ?? '';
      es.numMotor_DSV_VEPAF_ = algo7["NumMotor"] ?? '';
      es.numFolTarjCir_DSV_VEPAF_ = algo7["NumFolTarjCir"] ?? '';
      es.foliofiscal_DSV_VEPAF_ = algo7["Foliofiscal"] ?? '';
      es.numFolAvisoint_DSV_VEPAF_ = algo7["NumFolAvisoint"] ?? '';
      es.numPedIm_DSV_VEPAF_ = algo7["NumPedIm"] ?? '';
      es.aduana_DSV_VEPAF_ = algo7["Aduana"] ?? '';
      es.fechaRegulVeh_DSV_VEPAF_ = algo7["FechaRegulVeh"] ?? '';
      break;
    
    case "detallista":
      var es = Provider.of<c_DetallistaDetallista>(context, listen: false);
      final json = parse["cfdi\u0024Complemento"];
      final algo = json["detallista\u0024detallista"];
      
      es.documentStructureVersion_ = algo["documentStructureVersion"] ?? '';
      es.documentStatus_ = algo["documentStatus"] ?? '';
      es.type_ = algo["type"] ?? '';
      es.contentVersion_ = algo["contentVersion"] ?? '';

      final algo2 = algo["detallista\u0024requestForPaymentIdentification"];
      final algo3 = algo2["detallista\u0024entityType"];
      es.t_DRFPI_DGlnC_ = algo3["\u0024t"] ?? '';

      final algo4 = algo["detallista\u0024specialInstruction"];
      es.code_DSI_ = algo4["code"] ?? '';
      final algo5 = algo4["detallista\u0024text"];
      es.t_DSI_DGlnC_ = algo5["\u0024t"] ?? '';

      final algo6 = algo["detallista\u0024orderIdentification"];
      final algo7 = algo6["detallista\u0024referenceIdentification"];
      es.type_DOI_DAPIC_ = algo7["type"] ?? '';
      es.t_DOI_DAPIC_ = algo7["\u0024t"] ?? '';
      final algo8 = algo6["detallista\u0024ReferenceDate"];
      es.t_DOI_DGlnC_ = algo8["\u0024t"] ?? '';
      
      final algo9 = algo["detallista\u0024AdditionalInformation"];
      final algo10 = algo9["detallista\u0024referenceIdentification"];
      es.type_DAI_DAPIC_ = algo10["type"] ?? '';
      es.t_DAI_DAPIC_ = algo10["\u0024t"] ?? '';

      final algo11 = algo["detallista\u0024DeliveryNote"];
      final algo12 = algo11["detallista\u0024referenceIdentification"];
      es.t_DDN_ri_DGlnC_ = algo["\u0024t"] ?? '';
      final algo13 = algo11["detallista\u0024ReferenceDate"];
      es.t_RI_DDN_rd_DGlnC_ = algo13["\u0024t"] ?? '';

      final algo14 = algo["detallista\u0024buyer"];
      final algo15 = algo14["detallista\u0024gln"];
      es.t_DB_DGlnC_ = algo15["\u0024t"] ?? '';
      final algo16 = algo14["detallista\u0024contactInformation"];
      final algo17 = algo16["detallista\u0024personOrDepartmentName"];
      final algo18 = algo17["detallista\u0024text"];
      es.t_DB_DCI_DPoDN_DGlnC_ = algo18["\u0024t"] ?? '';

      final algo19 = algo["detallista\u0024seller"];
      final algo20 = algo19["detallista\u0024gln"];
      es.t_DS_DGlnC_ = algo20["\u0024t"] ?? '';
      final algo21 = algo19["detallista\u0024alternatePartyIdentification"];
      es.type_DS_DAPIC_ = algo21["type"] ?? '';
      es.t_DS_DAPIC_ = algo21["\u0024t"] ?? '';

      final algo22 = algo["detallista\u0024shipTo"];
      final algo23 = algo22["detallista\u0024gln"];
      es.t_DST_DGlnC_ = algo23["\u0024t"] ?? '';
      final algo24 = algo22["detallista\u0024nameAndAddress"];
      final algo25 = algo24["detallista\u0024name"];
      es.Name_DST_DICDNA_DGlnC_ = algo25["\u0024t"] ?? '';
      final algo26 = algo24["detallista\u0024streetAddressOne"];
      es.StreetAddressOne_DST_DICDNA_DGlnC_ = algo26["\u0024t"] ?? '';
      final algo27 = algo24["detallista\u0024city"];
      es.City_DST_DICDNA_DGlnC_ = algo27["\u0024t"] ?? '';
      final algo28 = algo24["detallista\u0024postalCode"];
      es.PostalCode_DST_DICDNA_DGlnC_ = algo28["\u0024t"] ?? '';

      final algo29 = algo["detallista\u0024InvoiceCreator"];
      final algo30 = algo29["detallista\u0024gln"];
      es.t_DIC_DGlnC_ = algo30["\u0024t"] ?? '';
      final algo31 = algo29["detallista\u0024alternatePartyIdentification"];
      es.type_DIC_DAPIC_ = algo31["type"] ?? '';
      es.t_DIC_DAPIC_ = algo31["\u0024t"] ?? '';
      final algo32 = algo29["detallista\u0024nameAndAddress"];
      final algo33 = algo32["detallista\u0024name"];
      es.Name_DIC_DICDNaA_DGlnC_ = algo33["\u0024t"] ?? '';
      final algo34 = algo32["detallista\u0024streetAddressOne"];
      es.StreetAddresOne_DIC_DICDNaA_DGlnC_ = algo34["\u0024t"] ?? '';
      final algo35 = algo32["detallista\u0024city"];
      es.City_DIC_DICDNaA_DGlnC_ = algo35["\u0024t"] ?? '';
      final algo36 = algo32["detallista\u0024postalCode"];
      es.PostalCode_DIC_DICDNaA_DGlnC_ = algo36["\u0024t"] ?? '';

      final algo37 = algo["detallista\u0024Customs"];
      final algo38 = algo37["detallista\u0024gln"];
      es.t_DDDC_DGlnC_ = algo38["\u0024t"] ?? '';

      final algo39 = algo["detallista\u0024currency"];
      es.currenyisoCode_DC_ = algo39["currencyISOCode"] ?? '';
      final algo40 = algo39["detallista\u0024currencyFunction"];
      es.Currencyunction_DC_DlnC_ = algo40["\u0024t"] ?? '';
      final algo41 = algo39["detallista\u0024rateOfChange"];
      es.RateOfChange_DC_DlnC_ = algo41["\u0024t"] ?? '';

      final algo42 = algo["detallista\u0024paymentTerms"];
      es.paymentTermsEvent_DPT_ = algo42["paymentTermsEvent"] ?? '';
      es.paymentTermsRelationTime_DPT_ = algo42["PaymentTermsRelationTime"] ?? '';
      final algo43 = algo42["detallista\u0024netPayment"];
      es.netPaymentTermsType_DPT_DNP_ = algo43["netPaymentTermsType"] ?? '';
      final algo44 = algo43["detallista\u0024paymentTimePeriod"];
      final algo45 = algo44["detallista\u0024timePeriodDue"];
      es.timePeriod_DPT_DNP_DPTP_DTPD_ = algo45["timePeriod"] ?? '';
      final algo46 = algo45["detallista\u0024value"];
      es.Value_DPT_DNP_DPTP_DTPD_DGlnC_ = algo46["\u0024t"] ?? '';
      final algo47 = algo42["detallista\u0024discountPayment"];
      es.discountType_DPT_DDP_ = algo47["discountType"] ?? '';
      final algo48 = algo47["detallista\u0024percentage"];
      es.Percentage_DPT_DDP_DGlnC_ = algo48["\u0024t"] ?? '';

      final algo49 = algo["detallista\u0024shipmentDetail"];
      es.type_DPIC_ = algo49[""] ?? '';//desde el nodo esta "vacio", no hay nada :v asi lo arrojo la pag de: https://app.quicktype.io/

      final algo50 = algo["detallista\u0024allowanceCharge"];
      es.alowanceChargeType_DDDAC_ = algo50["allowanceChargeType"] ?? '';
      es.settlemntType_DDDAC_ = algo50["settlementType"] ?? '';
      es.sequencenumber_DDDAC_ = algo50["sequenceNumber"] ?? '';
      final algo51 = algo50["detallista\u0024monetaryAmountOrPercentage"];
      final algo52 = algo51["detallista\u0024rate"];
      es.base_DDDAC_PDMAOP_DR_ = algo52["base"] ?? '';
      final algo53 = algo52["detallista\u0024percentage"];
      es.Percentage_DDDAC_PDMAOP_DR_DGlnC_ = algo53["\u0024t"] ?? '';

      final algo54 = algo["detallista\u0024lineItem"];
      es.type_DLI_ = algo54["type"] ?? '';
      es.number_DLI_ = algo54["number"] ?? '';
      final algo55 = algo54["detallista\u0024tradeItemIdentification"];
      final algo56 = algo55["detallista\u0024gtin"];
      es.Gtin_DLI_DTII_DGlnC_ = algo56["\u0024t"] ?? '';
      final algo57 = algo54["detallista\u0024alternateTradeItemIdentification"];
      es.type_DLI_DAPIC_ = algo57["type"] ?? '';
      es.t_DLI_DAPIC_ = algo57["\u0024t"] ?? '';
      final algo58 = algo54["detallista\u0024tradeItemDescriptionInformation"];
      es.language_DLI_DTIDI_ = algo58["language"] ?? '';
      final algo59 = algo58["detallista\u0024longText"];
      es.LongText_DLI_DTIDI_DGlnC_ = algo59["\u0024t"] ?? '';
      final algo60 = algo54["detallista\u0024invoicedQuantity"];
      es.unitOfMeasure_DLI_DIQ_ = algo60["unitOfMeasure"] ?? '';
      es.t_DLI_DIQ_ = algo60["\u0024t"] ?? '';
      final algo61 = algo54["detallista\u0024aditionalQuantity"];
      es.quantityType_DLI_DAQ_ = algo61["QuantityType"] ?? '';
      es.t_DLI_DAQ_ = algo61["\u0024t"] ?? '';
      final algo62 = algo54["detallista\u0024grossPrice"];
      final algo63 = algo62["detallista\u0024Amount"];
      es.Amount_DLI_GP_DTAC_DGlnC_ = algo63["\u0024t"] ?? '';
      final algo64 = algo54["detallista\u0024netPrice"];
      final algo65 = algo64["detallista\u0024Amount"];
      es.Amount_DLI_NP_DTAC_DGlnC_ = algo65["\u0024t"] ?? '';
      final algo66 = algo54["detallista\u0024AdditionalInformation"];
      final algo67 = algo66["detallista\u0024referenceIdentification"];
      es.type_DLI_DAI_DAPIC_ = algo67["type"] ?? '';
      es.t_DLI_DAI_DAPIC_ = algo67["\u0024t"] ?? '';
      final algo68 = algo54["detallista\u0024Customs"];
      final algo69 = algo68["detallista\u0024gln"];
      es.Gln_DLI_DLIDC_DGlnC_ = algo69["\u0024t"] ?? '';
      final algo70 = algo68["detallista\u0024alternatePartyIdentification"];
      es.type_DLI_DLIDC_DAPIC_ = algo70["type"] ?? '';
      es.t_DLI_DLIDC_DAPIC_ = algo70["\u0024t"] ?? '';
      final algo71 = algo68["detallista\u0024ReferenceDate"];
      es.ReferenceDate_DLI_DLIDC_DGlnC_ = algo71["\u0024t"] ?? '';
      final algo72 = algo68["detallista\u0024nameAndAddress"];
      final algo73 = algo72["detallista\u0024name"];
      es.Name_DLI_DLIDC_DCDNAA_DGlnC_ = algo73["\u0024t"] ?? '';
      final algo74 = algo54["detallista\u0024LogisticUnits"];////
      final algo75 = algo74["detallista\u0024serialShippingContainerCode"];
      es.type_DLI_DLU_DAPIC_ = algo75["type"] ?? '';
      es.t_DLI_DLU_DAPIC_ = algo75["\u0024t"] ?? '';
      final algo76 = algo54["detallista\u0024palletInformation"];
      final algo77 = algo76["detallista\u0024palletQuantity"];
      es.PalletQuantity_DLI_DPI_DGlnC_ = algo77["\u0024t"] ?? '';
      final algo78 = algo76["detallista\u0024description"];
      es.type_DLI_DPI_DAPIC_ = algo78["type"] ?? '';
      es.t_DLI_DPI_DAPIC_ = algo78["\u0024t"] ?? '';
      final algo79 = algo76["detallista\u0024transport"];
      final algo80 = algo79["detallista\u0024methodOfPayment"];
      es.MethodOfPayment_DLI_DPI_DT_DGlnC_ = algo80["\u0024t"] ?? '';
      final algo81 = algo54["detallista\u0024extendedAttributes"];
      final algo82 = algo81["detallista\u0024lotNumber"];
      es.productionDate_DLI_DEA_DLN_ = algo82["productionDate"] ?? '';
      es.t_DLI_DEA_DLN_ = algo82["\u0024t"] ?? '';
      final algo83 = algo54["detallista\u0024allowanceCharge"];
      es.allowanceChargeType_DLI_DLIDAC_ = algo83["allowanceChargeType"] ?? '';
      es.settlementType_DLI_DLIDAC_ = algo83["settlementType"] ?? '';
      es.sequenceNumber_DLI_DLIDAC_ = algo83["sequenceNumber"] ?? '';
      final algo84 = algo83["detallista\u0024specialServicesType"];
      es.SpecialServicesType_DLI_DLIDAC_DGlnC_ = algo84["\u0024t"] ?? '';
      final algo85 = algo83["detallista\u0024monetaryAmountOrPercentage"];
      final algo86 = algo85["detallista\u0024percentagePerUnit"];
      es.PercentagePerUnit_DLI_DLIDAC_FDMAOP_DGlnC_ = algo86["\u0024t"] ?? '';
      final algo87 = algo85["detallista\u0024ratePerUnit"];
      final algo88 = algo87["detallista\u0024amountPerUnit"];
      es.AmountPerUnit_DLI_DLIDAC_FDMAOP_DRPU_DGlnC_ = algo88["\u0024t"] ?? '';
      final algo89 = algo54["detallista\u0024tradeItemTaxInformation"];
      final algo90 = algo89["detallista\u0024taxTypeDescription"];
      es.TaxTypeDescription_DLI_DTITI_DGlnC_ = algo90["\u0024t"] ?? '';
      final algo91 = algo89["detallista\u0024referenceNumber"];
      es.ReferenceNumber_DLI_DTITI_DGlnC = algo91["\u0024t"] ?? '';
      final algo92 = algo89["detallista\u0024taxCategory"];
      es.TaxCategory_DLI_DTITI_DGlnC_ = algo92["\u0024t"] ?? '';
      final algo93 = algo89["detallista\u0024tradeItemTaxAmount"];
      final algo94 = algo93["detallista\u0024taxPercentage"];
      es.TacPercentge_DLI_DTITI_DTITA_DGlnC_ = algo94["\u0024t"] ?? '';
      final algo95 = algo93["detallista\u0024taxAmount"];
      es.TaxAmount_DLI_DTITI_DTITA_DGlnC_ = algo95["\u0024t"] ?? '';
      final algo96 = algo54["detallista\u0024totalLineAmount"];
      final algo97 = algo96["detallista\u0024grossAmount"];
      final algo98 = algo97["detallista\u0024Amount"];
      es.GrossAmount_DLI_DTLA_DTAC_DGlnC_ = algo98["\u0024t"] ?? '';
      final algo99 = algo96["detallista\u0024netAmount"];
      final algo100 = algo99["detallista\u0024Amount"];
      es.NetAmount_DLI_DTLA_DTAC_DGlnC_ = algo100["\u0024t"] ?? '';

      final algo101 = algo["detallista\u0024totalAmount"];
      final algo102 = algo101["detallista\u0024Amount"];
      es.Amount_DTAC_DGlnC_ = algo102["\u0024t"] ?? '';

      final algo103 = algo["detallista\u0024TotalAllowanceCharge"];
      es.allowanceOrChargeType_DTAC_ = algo103["allowanceOrChargeType"] ?? '';
      final algo104 = algo103["detallista\u0024specialServicesType"];
      es.SpecialServicesType_DTAC_DGnC_ = algo104["\u0024t"] ?? '';
      final algo105 = algo103["detallista\u0024Amount"];
      es.Amount_DTAC_DGnC_ = algo105["\u0024t"] ?? '';
      break;
    
  case 'arrendamientoenfideicomiso':
    var es = Provider.of<c_arrendamiendoenfideicomiso>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["arrendamientoenfideicomiso\u0024Arrendamientoenfideicomiso"];
    es.version_ = algo["Version"] ?? '';
    es.pagProvEfecPorFiduc_ = algo["PagProvEfecPorFiduc"] ?? '';
    es.rendimFideicom_ = algo["RendimFideicom"] ?? '';
    es.deduccCorresp_ = algo["DeduccCorresp"] ?? '';
    es.montTotRet_ = algo["MontTotRet"] ?? '';  
    break;
  
  case 'dividendos':
    var es = Provider.of<c_dividendos>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["dividendos\u0024Dividendos"];
    es.version_ = algo["Version"] ?? '';
    final algo2 = algo["dividendos\u0024DividOUtil"];
    es.cveTipDivOUtil_ = algo2["CveTipDivOUtil"] ?? '';
    es.montIsrAcredRetMexico_ = algo2["MontISRAcredRetMexico"] ?? '';
    es.montIsrAcredRetExtranjero_ = algo2["MontISRAcredRetExtranjero"] ?? '';
    es.tipoSocDistrDiv_ = algo2["TipoSocDistrDiv"] ?? '';
    es.montRetExtDivExt_ = algo2["MontRetExtDivExt"] ?? '';
    es.montDivAcumExt_ = algo2["MontDivAcumExt"] ?? '';
    es.montDivAcumNal_ = algo2["MontDivAcumNal"] ?? '';
    es.montIsrAcredNal_ = algo2["MontISRAcredNal"] ?? '';
    break;
  
  case 'enajenaciondeacciones':
    var es = Provider.of<c_enajenaciondeacciones>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["enajenaciondeacciones\u0024EnajenaciondeAcciones"];
    es.version_ = algo["Version"] ?? '';
    es.contratoIntermediacion_ = algo["ContratoIntermediacion"] ?? '';
    es.ganancia_ = algo["Ganancia"] ?? '';
    es.perdida_ = algo["Perdida"] ?? '';
    break;
  
  case 'fideicomisonoempresarial':
    var es = Provider.of<c_fideicomisonoempresarial>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["fideicomisonoempresarial\u0024Fideicomisonoempresarial"];
    es.version_ = algo["Version"] ?? '';

    final algo2 = algo["fideicomisonoempresarial\u0024DeduccOSalidas"];
    es.montTotEgresPeriodo_DoS_ = algo2["MontTotEgresPeriodo"] ?? '';
    es.partPropDelFideicom_DoS_ = algo2["PartPropDelFideicom"] ?? '';
    es.propDelMontTot_DoS_ = algo2["PropDelMontTot"] ?? '';
    final algo3 = algo2["fideicomisonoempresarial\u0024IntegracEgresos"];
    es.conceptoS_IE_ = algo3["ConceptoS"] ?? '';

    final algo4 = algo["fideicomisonoempresarial\u0024IngresosOEntradas"];
    es.montTotEntradasPeriodo_IoE_ = algo4["MontTotEntradasPeriodo"] ?? '';
    es.partPropAcumDelFideicom_IoE_ = algo4["PartPropAcumDelFideicom"] ?? '';
    es.propDelMontTot_IoE_ = algo4["PropDelMontTot"] ?? '';
    final algo5 = algo4["fideicomisonoempresarial\u0024IntegracIngresos"];
    es.concepto_II_ = algo5["Concepto"] ?? '';

    final algo6 = algo["fideicomisonoempresarial\u0024RetEfectFideicomiso"];
    es.montRetRelPagFideic_REF_ = algo6["MontRetRelPagFideic"] ?? '';
    es.descRetRelPagFideic_REF_ = algo6["DescRetRelPagFideic"] ?? '';
    break;
  
  case 'intereses':
    var es = Provider.of<c_intereses>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["intereses\u0024Intereses"];
    es.version_ = algo["Version"] ?? '';
    es.sistFinanciero_ = algo["SistFinanciero"] ?? '';
    es.retiroAoresRetInt_ = algo["RetiroAORESRetInt"] ?? '';
    es.operFinancDerivad_ = algo["OperFinancDerivad"] ?? '';
    es.montIntNominal_ = algo["MontIntNominal"] ?? '';
    es.montIntReal_ = algo["MontIntReal"] ?? '';
    es.perdida_ = algo["Perdida"] ?? '';
    break;

  case 'intereseshipotecarios':
    var es = Provider.of<c_intereseshipotecarios>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["intereseshipotecarios\u0024Intereseshipotecarios"];
    es.version_ = algo["Version"] ?? '';
    es.creditoDeInstFinanc_ = algo["CreditoDeInstFinanc"] ?? '';
    es.saldoInsoluto_ = algo["SaldoInsoluto"] ?? '';
    es.propDeducDelCredit_ = algo["PropDeducDelCredit"] ?? '';
    es.montTotIntNominalesDev_ = algo["MontTotIntNominalesDev"] ?? '';
    es.montTotIntNominalesDevYPag_ = algo["MontTotIntNominalesDevYPag"] ?? '';
    es.montTotIntRealPagDeduc_ = algo["MontTotIntRealPagDeduc"] ?? '';
    es.numContrato_ = algo["NumContrato"] ?? '';
    break;
  
  case 'operacionesconderivados':
    var es = Provider.of<c_operacionesconderivados>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["operacionesconderivados\u0024Operacionesconderivados"];
    es.version_ = algo["Version"] ?? '';
    es.montGanAcum_ = algo["MontGanAcum"] ?? '';
    es.montPerdDed_ = algo["MontPerdDed"] ?? '';
    break;
  
  case 'pagosaextranjeros':
    var es = Provider.of<c_pagosaextranjeros>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["pagosaextranjeros\u0024Pagosaextranjeros"];
    es.version_PE_ = algo["Version"] ?? '';
    es.esBenefEfectDelCobro_PE_ = algo["EsBenefEfectDelCobro"] ?? '';
    final algo2 = algo["pagosaextranjeros\u0024Beneficiario"];
    es.rfc_B_ = algo2["RFC"] ?? '';
    es.curp_B_ = algo2["CURP"] ?? '';
    es.nomDenRazSocB_B_ = algo2["NomDenRazSocB"] ?? '';
    es.conceptoPago_B_ = algo2["ConceptoPago"] ?? '';
    es.descripcionConcepto_B_ = algo2["DescripcionConcepto"] ?? '';
    break;
  
  case 'planesderetiro':
    var es = Provider.of<c_planesderetiro>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["planesderetiro\u0024Planesderetiro"];
    es.version_ = algo["Version"] ?? '';
    es.sistemaFinanc_ = algo["SistemaFinanc"] ?? '';
    es.montTotAportAnioInmAnterior_ = algo["MontTotAportAnioInmAnterior"] ?? '';
    es.montIntRealesDevengAniooInmAnt_ = algo["MontIntRealesDevengAniooInmAnt"] ?? '';
    es.huboRetirosAnioInmAntPer_ = algo["HuboRetirosAnioInmAntPer"] ?? '';
    es.montTotRetiradoAnioInmAntPer_ = algo["MontTotRetiradoAnioInmAntPer"] ?? '';
    es.montTotExentRetiradoAnioInmAnt_ = algo["MontTotExentRetiradoAnioInmAnt"] ?? '';
    es.montTotExedenteAnioInmAnt_ = algo["MontTotExedenteAnioInmAnt"] ?? '';
    es.huboRetirosAnioInmAnt_ = algo["HuboRetirosAnioInmAnt"] ?? '';
    es.montTotRetiradoAnioInmAnt_ = algo["MontTotRetiradoAnioInmAnt"] ?? '';
    break;
  
  case 'premios':
    var es = Provider.of<c_premios>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["premios\u0024Premios"];
    es.version_ = algo["Version"] ?? '';
    es.entidadFederativa_ = algo["EntidadFederativa"] ?? '';
    es.montTotPago_ = algo["MontTotPago"] ?? '';
    es.montTotPagoGrav_ = algo["MontTotPagoGrav"] ?? '';
    es.montTotPagoExent_ = algo["MontTotPagoExent"] ?? '';
    break;
  
  case 'sectorfinanciero':
    var es = Provider.of<c_sectorfinanciero>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["sectorfinanciero\u0024SectorFinanciero"];
    es.version_ = algo["Version"] ?? '';
    es.idFideicom_ = algo["IdFideicom"] ?? '';
    es.nomFideicom_ = algo["NomFideicom"] ?? '';
    es.descripFideicom_ = algo["DescripFideicom"] ?? '';
    break;

  case 'plataformasTecnologicas':
    var es = Provider.of<c_serviciosplataformastecnologicas>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["plataformasTecnologicas\u0024ServiciosPlataformasTecnologicas"];
    es.difIvaEntregadoPrestServ_SPT = algo["DifIVAEntregadoPrestServ"] ?? '';
    es.monTotServSiva_SPT = algo["MonTotServSIVA"] ?? '';
    es.monTotalporUsoPlataforma_SPT = algo["MonTotalporUsoPlataforma"] ?? '';
    es.numServ_SPT = algo["NumServ"] ?? '';
    es.periodicidad_SPT = algo["Periodicidad"] ?? '';
    es.totalIsrRetenido_SPT = algo["TotalISRRetenido"] ?? '';
    es.totalIvaRetenido_SPT = algo["TotalIVARetenido"] ?? '';
    es.totalIvaTrasladado_SPT = algo["TotalIVATrasladado"] ?? '';
    es.version_SPT = algo["Version"] ?? '';
    final algo2 = algo["plataformasTecnologicas\u0024Servicios"];
    final algo3 = algo2["plataformasTecnologicas\u0024DetallesDelServicio"];
    es.fechaServ_DS = algo3["FechaServ"] ?? '';
    es.formaPagoServ_DS = algo3["FormaPagoServ"] ?? '';
    es.precioServSinIva_DS = algo3["PrecioServSinIVA"] ?? '';
    es.tipoDeServ_DS = algo3["TipoDeServ"] ?? '';
    final algo4 = algo3["plataformasTecnologicas\u0024ImpuestosTrasladadosdelServicio"];
    es.base_ITS = algo4["Base"] ?? '';
    es.importe_ITS = algo4["Importe"] ?? '';
    es.impuesto_ITS = algo4["Impuesto"] ?? '';
    es.tasaCuota_ITS = algo4["TasaCuota"] ?? '';
    es.tipoFactor_ITS = algo4["TipoFactor"] ?? '';
    final algo5 = algo3["plataformasTecnologicas\u0024ComisionDelServicio"];
    es.base_CS = algo5["Base"] ?? '';
    es.importe_CS = algo5["Importe"] ?? '';
    es.porcentaje_CS = algo5["Porcentaje"] ?? '';
    break;
    
  }
}

Retencion(String tipo, Map<String, dynamic> parse, context){

switch (tipo) {

  case 'arrendamientoenfideicomiso':
    var es = Provider.of<c_arrendamiendoenfideicomiso>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["arrendamientoenfideicomiso\u0024Arrendamientoenfideicomiso"];
    es.version_ = algo["Version"] ?? '';
    es.pagProvEfecPorFiduc_ = algo["PagProvEfecPorFiduc"] ?? '';
    es.rendimFideicom_ = algo["RendimFideicom"] ?? '';
    es.deduccCorresp_ = algo["DeduccCorresp"] ?? '';
    es.montTotRet_ = algo["MontTotRet"] ?? '';  
    break;
  
  case 'dividendos':
    var es = Provider.of<c_dividendos>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["dividendos\u0024Dividendos"];
    es.version_ = algo["Version"] ?? '';
    final algo2 = algo["dividendos\u0024DividOUtil"];
    es.cveTipDivOUtil_ = algo2["CveTipDivOUtil"] ?? '';
    es.montIsrAcredRetMexico_ = algo2["MontISRAcredRetMexico"] ?? '';
    es.montIsrAcredRetExtranjero_ = algo2["MontISRAcredRetExtranjero"] ?? '';
    es.tipoSocDistrDiv_ = algo2["TipoSocDistrDiv"] ?? '';
    es.montRetExtDivExt_ = algo2["MontRetExtDivExt"] ?? '';
    es.montDivAcumExt_ = algo2["MontDivAcumExt"] ?? '';
    es.montDivAcumNal_ = algo2["MontDivAcumNal"] ?? '';
    es.montIsrAcredNal_ = algo2["MontISRAcredNal"] ?? '';
    break;
  
  case 'enajenaciondeacciones':
    var es = Provider.of<c_enajenaciondeacciones>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["enajenaciondeacciones\u0024EnajenaciondeAcciones"];
    es.version_ = algo["Version"] ?? '';
    es.contratoIntermediacion_ = algo["ContratoIntermediacion"] ?? '';
    es.ganancia_ = algo["Ganancia"] ?? '';
    es.perdida_ = algo["Perdida"] ?? '';
    break;
  
  case 'fideicomisonoempresarial':
    var es = Provider.of<c_fideicomisonoempresarial>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["enajenaciondeacciones\u0024EnajenaciondeAcciones"];
    es.version_ = algo["Version"] ?? '';

    final algo2 = algo["fideicomisonoempresarial\u0024DeduccOSalidas"];
    es.montTotEgresPeriodo_DoS_ = algo["MontTotEgresPeriodo"] ?? '';
    es.partPropDelFideicom_DoS_ = algo["PartPropDelFideicom"] ?? '';
    es.propDelMontTot_DoS_ = algo["PropDelMontTot"] ?? '';
    final algo3 = algo2["fideicomisonoempresarial\u0024IntegracEgresos"];
    es.conceptoS_IE_ = algo3["ConceptoS"] ?? '';

    final algo4 = algo["fideicomisonoempresarial\u0024IngresosOEntradas"];
    es.montTotEntradasPeriodo_IoE_ = algo4["MontTotEntradasPeriodo"] ?? '';
    es.partPropAcumDelFideicom_IoE_ = algo4["PartPropAcumDelFideicom"] ?? '';
    es.propDelMontTot_IoE_ = algo4["PropDelMontTot"] ?? '';
    final algo5 = algo4["fideicomisonoempresarial\u0024IntegracIngresos"];
    es.concepto_II_ = algo5["Concepto"] ?? '';

    final algo6 = algo["fideicomisonoempresarial\u0024RetEfectFideicomiso"];
    es.montRetRelPagFideic_REF_ = algo6["MontRetRelPagFideic"] ?? '';
    es.descRetRelPagFideic_REF_ = algo6["DescRetRelPagFideic"] ?? '';
    break;
  
  case 'intereses':
    var es = Provider.of<c_intereses>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["intereses\u0024Intereses"];
    es.version_ = algo["Version"] ?? '';
    es.sistFinanciero_ = algo["SistFinanciero"] ?? '';
    es.retiroAoresRetInt_ = algo["RetiroAORESRetInt"] ?? '';
    es.operFinancDerivad_ = algo["OperFinancDerivad"] ?? '';
    es.montIntNominal_ = algo["MontIntNominal"] ?? '';
    es.montIntReal_ = algo["MontIntReal"] ?? '';
    es.perdida_ = algo["Perdida"] ?? '';
    break;

  case 'intereseshipotecarios':
    var es = Provider.of<c_intereseshipotecarios>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["intereseshipotecarios\u0024Intereseshipotecarios"];
    es.version_ = algo["Version"] ?? '';
    es.creditoDeInstFinanc_ = algo["CreditoDeInstFinanc"] ?? '';
    es.saldoInsoluto_ = algo["SaldoInsoluto"] ?? '';
    es.propDeducDelCredit_ = algo["PropDeducDelCredit"] ?? '';
    es.montTotIntNominalesDev_ = algo["MontTotIntNominalesDev"] ?? '';
    es.montTotIntNominalesDevYPag_ = algo["MontTotIntNominalesDevYPag"] ?? '';
    es.montTotIntRealPagDeduc_ = algo["MontTotIntRealPagDeduc"] ?? '';
    es.numContrato_ = algo["NumContrato"] ?? '';
    break;
  
  case 'operacionesconderivados':
    var es = Provider.of<c_operacionesconderivados>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["operacionesconderivados\u0024Operacionesconderivados"];
    es.version_ = algo["Version"] ?? '';
    es.montGanAcum_ = algo["MontGanAcum"] ?? '';
    es.montPerdDed_ = algo["MontPerdDed"] ?? '';
    break;
  
  case 'pagosaextranjeros':
    var es = Provider.of<c_pagosaextranjeros>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["pagosaextranjeros\u0024Pagosaextranjeros"];
    es.version_PE_ = algo["Version"] ?? '';
    es.esBenefEfectDelCobro_PE_ = algo["EsBenefEfectDelCobro"] ?? '';
    final algo2 = algo["pagosaextranjeros\u0024Beneficiario"];
    es.rfc_B_ = algo2["RFC"] ?? '';
    es.curp_B_ = algo2["CURP"] ?? '';
    es.nomDenRazSocB_B_ = algo2["NomDenRazSocB"] ?? '';
    es.conceptoPago_B_ = algo2["ConceptoPago"] ?? '';
    es.descripcionConcepto_B_ = algo2["DescripcionConcepto"] ?? '';
    break;
  
  case 'planesderetiro':
    var es = Provider.of<c_planesderetiro>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["planesderetiro\u0024Planesderetiro"];
    es.version_ = algo["Version"] ?? '';
    es.sistemaFinanc_ = algo["SistemaFinanc"] ?? '';
    es.montTotAportAnioInmAnterior_ = algo["MontTotAportAnioInmAnterior"] ?? '';
    es.montIntRealesDevengAniooInmAnt_ = algo["MontIntRealesDevengAniooInmAnt"] ?? '';
    es.huboRetirosAnioInmAntPer_ = algo["HuboRetirosAnioInmAntPer"] ?? '';
    es.montTotRetiradoAnioInmAntPer_ = algo["MontTotRetiradoAnioInmAntPer"] ?? '';
    es.montTotExentRetiradoAnioInmAnt_ = algo["MontTotExentRetiradoAnioInmAnt"] ?? '';
    es.montTotExedenteAnioInmAnt_ = algo["MontTotExedenteAnioInmAnt"] ?? '';
    es.huboRetirosAnioInmAnt_ = algo["HuboRetirosAnioInmAnt"] ?? '';
    es.montTotRetiradoAnioInmAnt_ = algo["MontTotRetiradoAnioInmAnt"] ?? '';
    break;
  
  case 'premios':
    var es = Provider.of<c_premios>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["premios\u0024Premios"];
    es.version_ = algo["Version"] ?? '';
    es.entidadFederativa_ = algo["EntidadFederativa"] ?? '';
    es.montTotPago_ = algo["MontTotPago"] ?? '';
    es.montTotPagoGrav_ = algo["MontTotPagoGrav"] ?? '';
    es.montTotPagoExent_ = algo["MontTotPagoExent"] ?? '';
    break;
  
  case 'sectorfinanciero':
    var es = Provider.of<c_sectorfinanciero>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["sectorfinanciero\u0024SectorFinanciero"];
    es.version_ = algo["Version"] ?? '';
    es.idFideicom_ = algo["IdFideicom"] ?? '';
    es.nomFideicom_ = algo["NomFideicom"] ?? '';
    es.descripFideicom_ = algo["DescripFideicom"] ?? '';
    break;

  case 'plataformasTecnologicas':
    var es = Provider.of<c_serviciosplataformastecnologicas>(context, listen: false);
    final json = parse["retenciones\u0024Complemento"];
    final algo = json["plataformasTecnologicas\u0024ServiciosPlataformasTecnologicas"];
    es.difIvaEntregadoPrestServ_SPT = algo["DifIVAEntregadoPrestServ"] ?? '';
    es.monTotServSiva_SPT = algo["MonTotServSIVA"] ?? '';
    es.monTotalporUsoPlataforma_SPT = algo["MonTotalporUsoPlataforma"] ?? '';
    es.numServ_SPT = algo["NumServ"] ?? '';
    es.periodicidad_SPT = algo["Periodicidad"] ?? '';
    es.totalIsrRetenido_SPT = algo["TotalISRRetenido"] ?? '';
    es.totalIvaRetenido_SPT = algo["TotalIVARetenido"] ?? '';
    es.totalIvaTrasladado_SPT = algo["TotalIVATrasladado"] ?? '';
    es.version_SPT = algo["Version"] ?? '';
    final algo2 = algo["plataformasTecnologicas\u0024Servicios"];
    final algo3 = algo2["plataformasTecnologicas\u0024DetallesDelServicio"];
    es.fechaServ_DS = algo3["FechaServ"] ?? '';
    es.formaPagoServ_DS = algo3["FormaPagoServ"] ?? '';
    es.precioServSinIva_DS = algo3["PrecioServSinIVA"] ?? '';
    es.tipoDeServ_DS = algo3["TipoDeServ"] ?? '';
    final algo4 = algo3["plataformasTecnologicas\u0024ImpuestosTrasladadosdelServicio"];
    es.base_ITS = algo4["Base"] ?? '';
    es.importe_ITS = algo4["Importe"] ?? '';
    es.impuesto_ITS = algo4["Impuesto"] ?? '';
    es.tasaCuota_ITS = algo4["TasaCuota"] ?? '';
    es.tipoFactor_ITS = algo4["TipoFactor"] ?? '';
    final algo5 = algo3["plataformasTecnologicas\u0024ComisionDelServicio"];
    es.base_CS = algo5["Base"] ?? '';
    es.importe_CS = algo5["Importe"] ?? '';
    es.porcentaje_CS = algo5["Porcentaje"] ?? '';
    break;

  default:
}

}

}


// ignore_for_file: file_names, must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/DatosCFDI.dart';
import 'package:visor_xml/Moldes/Estructura_Datos.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';

class Cartaporte_20 extends StatefulWidget {
  String data;
  Cartaporte_20({Key? key, required this.data}) : super(key: key);

  @override
  State<Cartaporte_20> createState() => _Cartaporte_20State();
}

class _Cartaporte_20State extends State<Cartaporte_20> {
  bool icomp = true;
  bool iemisor = true;
  bool ireceptor = true;
  bool conceptosc = true;
  bool impuestosc = true;
  bool complementoc = true;
  @override
  Widget build(BuildContext context) {
    var dato = Provider.of<DatosCfdi>(context, listen: false);
    final Concepto = dato.concepto;

    return SingleChildScrollView(
      child: Column(
        children: [
          icomp ||
                  iemisor ||
                  ireceptor ||
                  conceptosc ||
                  impuestosc ||
                  complementoc
              ? const SizedBox(height: 10)
              : SizedBox(height: MediaQuery.of(context).size.height / 6),

          EstructuraC(
              i: 10,
              ii: 10,
              imagen1: 'assets/CXML.png',
              text: 'Comprobante',
              ontap: () => setState(() {
                    icomp = !icomp;
                  })),
          icomp
              ? Column(
                  children: [
                    name('Certificado', dato.xsiSchemaLocation, context),
                    name('Version', dato.version, context),
                    name('Fecha', dato.fecha.toString(), context),
                    name('Sello', dato.sello, context),
                    name('FormaPago', formadepago(dato.formaPago), context),
                    name('NOCertificado', dato.noCertificado, context),
                    name('Certificado', dato.certificado, context),
                    name('SubTotal', dato.subTotal, context),
                    name('Moneda', dato.moneda, context),
                    name('Total', dato.total, context),
                    name('TipoDeComprobante',
                        tipoComprobante(dato.tipoDeComprobante), context),
                    name('Exportacion', dato.exportacion, context),
                    name('MetodoPago', metodoPago(dato.metodoPago), context),
                    name('LugarExpedicion', dato.lugarExpedicion, context),
                    name('cfdi', dato.xmlnsCfdi, context),
                    name('xsi', dato.xmlnsXsi, context),
                  ],
                )
              : const Divider(
                  color: Colors.transparent,
                ),
          ////////////////////////////////////////////////
          EstructuraD(
              i: 1,
              ii: 1,
              imagen2: 'assets/NODOEMISOR.png',
              ontap: () => setState(() {
                    iemisor = !iemisor;
                  })),
          iemisor
              ? Column(
                  children: [
                    name('RFC', dato.rfcEmisor, context),
                    name('Nombre', dato.nombreEmisor, context),
                    name('RegimenFiscal',
                        regimenFiscal(dato.regimenFiscalEmisor), context)
                  ],
                )
              : const Divider(
                  color: Colors.transparent,
                ),
          //////////////////////////////////////////////////////
          EstructuraD(
              i: 1,
              ii: 1,
              imagen2: 'assets/NODORECEPTOR.png',
              ontap: () => setState(() {
                    ireceptor = !ireceptor;
                  })),
          ireceptor
              ? Column(
                  children: [
                    name('RFC', dato.rfcReceptor, context),
                    name('Nombre', dato.nombreReceptor, context),
                    name('DomicilioFiscal', dato.domicilioFiscalReceptor,
                        context),
                    name('RegimenFiscal',
                        regimenFiscal(dato.regimenFiscalReceptor), context),
                    name('UsoCFDI', usoCFDI(dato.usoCfdiReceptor), context)
                  ],
                )
              : const Divider(
                  color: Colors.transparent,
                ),
          ////////////////////////////////////////////////////////////
          EstructuraD(
              i: 1,
              ii: 1,
              imagen2: 'assets/NODOCONCEPTOS.png',
              ontap: () => setState(() {
                    conceptosc = !conceptosc;
                  })),
          conceptosc
              ? Column(
                  children: [
                    const Divider(height: 5, color: Colors.transparent),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Concepto.length,
                        itemBuilder: (_, i) => ListTile(
                              subtitle: Column(
                                children: [
                                  Concepto.length > 1
                                      ? heads(
                                          context, 'Concepto ${i + 1}', 0, 0)
                                      : heads(context, 'Concepto', 0, 0),
                                  dataC('ClaveProdServ',
                                      Concepto[i].claveProdServ, context),
                                  dataC('ClaveUnidad', Concepto[i].claveUnidad,
                                      context),
                                  dataC('Cantidad', Concepto[i].cantidad,
                                      context),
                                  dataC('NoIdentificacion',
                                      Concepto[i].claveUnidad, context),
                                  dataC('Descripcion', Concepto[i].descripcion,
                                      context),
                                  dataC('ValorUnitario',
                                      Concepto[i].valorUnitario, context),
                                  dataC(
                                      'Importe', Concepto[i].importe, context),
                                  dataC(
                                      'ObjetoImp',
                                      objetoImpuesto(Concepto[i].objetoImp),
                                      context),
                                  const Divider(height: 3),
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: Concepto[i]
                                          .cfdiImpuestos
                                          .cfdiTraslados
                                          .length,
                                      itemBuilder: (_, it) => ListTile(
                                              subtitle: Column(children: [
                                            Concepto[i]
                                                        .cfdiImpuestos
                                                        .cfdiTraslados[it]
                                                        .cfdiTraslado
                                                        .base ==
                                                    ''
                                                ? Container()
                                                : heads(context, 'Impuestos', 5,
                                                    15),
                                            Concepto[i]
                                                        .cfdiImpuestos
                                                        .cfdiTraslados[it]
                                                        .cfdiTraslado
                                                        .base ==
                                                    ''
                                                ? Container()
                                                : heads(context, 'Traslados', 5,
                                                    15),
                                            const Divider(height: 3),
                                            Concepto[i]
                                                        .cfdiImpuestos
                                                        .cfdiTraslados[it]
                                                        .cfdiTraslado
                                                        .base ==
                                                    ''
                                                ? Container()
                                                : heads(
                                                    context, 'Traslado', 5, 15),
                                            dataC(
                                                'Base',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .base,
                                                context),
                                            dataC(
                                                'Impuesto',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .impuesto,
                                                context),
                                            dataC(
                                                'TipoFactor',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .tipoFactor,
                                                context),
                                            dataC(
                                                'TasaOCuota',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .tasaOCuota,
                                                context),
                                            dataC(
                                                'Importe',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .importe,
                                                context),
                                          ]))),
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: Concepto[i]
                                          .cfdiImpuestos
                                          .cfdiRetenciones
                                          .length,
                                      itemBuilder: (_, ir) => ListTile(
                                              subtitle: Column(children: [
                                            Concepto[i]
                                                        .cfdiImpuestos
                                                        .cfdiRetenciones[ir]
                                                        .cfdiRetencion
                                                        .base ==
                                                    ''
                                                ? Container()
                                                : heads(context, 'Retenciones',
                                                    5, 15),
                                            const Divider(height: 3),
                                            Concepto[i]
                                                        .cfdiImpuestos
                                                        .cfdiRetenciones[ir]
                                                        .cfdiRetencion
                                                        .base ==
                                                    ''
                                                ? Container()
                                                : heads(context, 'Retencion', 5,
                                                    15),
                                            dataC(
                                                'Base',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .base,
                                                context),
                                            dataC(
                                                'Impuesto',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .impuesto,
                                                context),
                                            dataC(
                                                'TipoFactor',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .tipoFactor,
                                                context),
                                            dataC(
                                                'TasaOCuota',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .tasaOCuota,
                                                context),
                                            dataC(
                                                'Importe',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .importe,
                                                context),
                                            const Divider(
                                                height: 8,
                                                color: Colors.black87),
                                          ]))),
                                ],
                              ),
                            ))
                  ],
                )
              : const Divider(
                  color: Colors.transparent,
                ),
          ///////////////////////////////////////////////////
          EstructuraD(
              i: 1,
              ii: 1,
              imagen2: 'assets/NODOIMPUESTOS.png',
              ontap: () => setState(() {
                    impuestosc = !impuestosc;
                  })),
          impuestosc
              ? Column(
                  children: [
                    name('TotalImpuestosRetenidos',
                        dato.totalImpuestosRetenidos, context),
                    name('TotalImpuestosTrasladados',
                        dato.totalImpuestosTrasladados, context),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dato.impuestoRetenido.length,
                        itemBuilder: (_, ir) => ListTile(
                                subtitle: Column(children: [
                              dato.impuestoRetenido[ir].cfdiRetencion.impuesto +
                                          dato.impuestoRetenido[ir]
                                              .cfdiRetencion.importe ==
                                      ''
                                  ? Container()
                                  : Column(children: [
                                      heads(context, 'Retenciones', 0, 15),
                                      const Divider(
                                          height: 5, color: Colors.transparent),
                                      heads(context, 'Retencion', 0, 40)
                                    ]),
                              name(
                                  'Impuesto',
                                  dato.impuestoRetenido[ir].cfdiRetencion
                                      .impuesto,
                                  context),
                              name(
                                  'Importe',
                                  dato.impuestoRetenido[ir].cfdiRetencion
                                      .importe,
                                  context),
                            ]))),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: dato.impuestoTraslado.length,
                        itemBuilder: (_, it) => ListTile(
                                subtitle: Column(children: [
                              dato.impuestoTraslado[it].cfdiTraslado.importe +
                                          dato.impuestoTraslado[it].cfdiTraslado
                                              .base ==
                                      ''
                                  ? Container()
                                  : Column(children: [
                                      heads(context, 'Traslados', 0, 15),
                                      const Divider(
                                          height: 5, color: Colors.transparent),
                                      heads(context, 'Traslado', 0, 40)
                                    ]),
                              name(
                                  'Impuesto',
                                  dato.impuestoTraslado[it].cfdiTraslado
                                      .impuesto,
                                  context),
                              name(
                                  'TipoFactor',
                                  dato.impuestoTraslado[it].cfdiTraslado
                                      .tipoFactor,
                                  context),
                              name(
                                  'TasaOCuota',
                                  dato.impuestoTraslado[it].cfdiTraslado
                                      .tasaOCuota,
                                  context),
                              name(
                                  'Importe',
                                  dato.impuestoTraslado[it].cfdiTraslado
                                      .importe,
                                  context),
                              name(
                                  'Base',
                                  dato.impuestoTraslado[it].cfdiTraslado.base,
                                  context),
                            ])))
                  ],
                )
              : const Divider(
                  color: Colors.transparent,
                ),
          ////////////////////////////////////////////////////////////
          EstructuraD(
              i: 1,
              ii: 1,
              imagen2: 'assets/NODOCOMPLEMENTO.png',
              ontap: () => setState(() {
                    complementoc = !complementoc;
                  })),
          complementoc
              ? Column(children: [
                  const Divider(height: 5, color: Colors.transparent),
                  heads(context, 'CartaPorte', 0, 15),
                  name('TotalDistanciaRecorrida',
                      dato.cartaPorteAuto.totalDistRec, context),
                  name('TrnspInternacional', dato.cartaPorteAuto.transpInternac,
                      context),
                  name('Version', dato.cartaPorteAuto.version, context),
                  heads(context, 'Ubicaciones', 0, 15),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          dato.cartaPorteAuto.cartaporte20Ubicaciones.length,
                      itemBuilder: (_, cpu) => ListTile(
                              subtitle: Column(children: [
                            heads(context, 'Ubicacion', 0, 15),
                            name(
                                'FechaHoraSalidaLlegada',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .fechaHoraSalidaLlegada
                                    .toString(),
                                context),
                            name(
                                'IDUbicacion',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .idUbicacion,
                                context),
                            name(
                                'RFCRemitenteDestinatario',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .rfcRemitenteDestinatario,
                                context),
                            name(
                                'TipoUbicacion',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .tipoUbicacion,
                                context),
                            heads(context, 'Domicilio', 0, 15),
                            name(
                                'Calle',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .cartaporte20Domicilio.calle,
                                context),
                            name(
                                'CodigoPostal',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .cartaporte20Domicilio.codigoPostal,
                                context),
                            name(
                                'Colonia',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .cartaporte20Domicilio.colonia,
                                context),
                            name(
                                'Estado',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .cartaporte20Domicilio.estado,
                                context),
                            name(
                                'Localidad',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .cartaporte20Domicilio.localidad,
                                context),
                            name(
                                'Municipio',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .cartaporte20Domicilio.municipio,
                                context),
                            name(
                                'NumeroExterior',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .cartaporte20Domicilio.numeroExterior,
                                context),
                            name(
                                'Pais',
                                dato.cartaPorteAuto.cartaporte20Ubicaciones[cpu]
                                    .cartaporte20Domicilio.pais,
                                context),
                          ]))),
                  heads(context, 'Mercancias', 0, 15),
                  name(
                      'NumTotalMercancias',
                      dato.cartaPorteAuto.cartaporte20MercanciasT
                          .numTotalMercancias,
                      context),
                  name(
                      'PesoBrutoTotal',
                      dato.cartaPorteAuto.cartaporte20MercanciasT
                          .pesoBrutoTotal,
                      context),
                  name(
                      'UnidadPeso',
                      dato.cartaPorteAuto.cartaporte20MercanciasT.unidadPeso,
                      context),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          dato.cartaPorteAuto.cartaporte20Mercancias.length,
                      itemBuilder: (_, cpm) => ListTile(
                              subtitle: Column(children: [
                            heads(context, 'mercancia', 0, 15),
                            name(
                                'BienesTrasp',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .bienesTransp,
                                context),
                            name(
                                'Cantidad',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .cantidad,
                                context),
                            name(
                                'ClaveUnidad',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .claveUnidad,
                                context),
                            name(
                                'Descripcion',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .descripcion,
                                context),
                            name(
                                'Moneda',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .moneda,
                                context),
                            name(
                                'pesoEnKG',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .pesoEnKg,
                                context),
                            name(
                                'ValorMercancia',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .valorMercancia,
                                context),
                            heads(context, 'CantidadTransportada', 0, 15),
                            name(
                                'Cantidad',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .cartaporte20CantidadTransporta.cantidad,
                                context),
                            name(
                                'IDDestino',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .cartaporte20CantidadTransporta.idDestino,
                                context),
                            name(
                                'IDOrigen',
                                dato.cartaPorteAuto.cartaporte20Mercancias[cpm]
                                    .cartaporte20CantidadTransporta.idOrigen,
                                context),
                          ]))),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          dato.cartaPorteAuto.carttaporte20Autotrasporte.length,
                      itemBuilder: (_, cpa) => ListTile(
                              subtitle: Column(children: [
                            heads(context, 'Autotransporte', 0, 15),
                            name(
                                'NumPermisoSCT',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .numPermisoSct,
                                context),
                            name(
                                'PermSCT',
                                dato.cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa].permSct,
                                context),
                            heads(context, 'IdentificacionVehicular', 0, 15),
                            name(
                                'AñoModeloVM',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .cartaporte20IdentificacionVehicular
                                    .anioModeloVm,
                                context),
                            name(
                                'ConfigVehicular',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .cartaporte20IdentificacionVehicular
                                    .configVehicular,
                                context),
                            name(
                                'PlacaVM',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .cartaporte20IdentificacionVehicular
                                    .placaVm,
                                context),
                            heads(context, 'Seguros', 0, 15),
                            name(
                                'AseguradoraRespCivil',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .cartaporte20Seguros
                                    .aseguraRespCivil,
                                context),
                            name(
                                'PolizaMedAmbiente',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .cartaporte20Seguros
                                    .polizaMedAmbiente,
                                context),
                            name(
                                'PolizaRespCivil',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .cartaporte20Seguros
                                    .polizaRespCivil,
                                context),
                            heads(context, 'Remolques', 0, 15),
                            heads(context, 'Remolque', 0, 15),
                            name(
                                'Placa',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .cartaporte20Remolques
                                    .cartaporte20Remolque
                                    .placa,
                                context),
                            name(
                                'SubTipoRemolque',
                                dato
                                    .cartaPorteAuto
                                    .carttaporte20Autotrasporte[cpa]
                                    .cartaporte20Remolques
                                    .cartaporte20Remolque
                                    .subTipoRem,
                                context),
                          ]))),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dato
                          .cartaPorteAuto.cartaporte20FiguraTransporte.length,
                      itemBuilder: (_, cpft) => ListTile(
                              subtitle: Column(children: [
                            heads(context, 'FiguraTransporte', 0, 15),
                            heads(context, 'TiposFigura', 0, 15),
                            name(
                                'NumLicencia',
                                dato
                                    .cartaPorteAuto
                                    .cartaporte20FiguraTransporte[cpft]
                                    .numLicencia,
                                context),
                            name(
                                'RFCFigura',
                                dato
                                    .cartaPorteAuto
                                    .cartaporte20FiguraTransporte[cpft]
                                    .rfcFigura,
                                context),
                            name(
                                'TipoFigura',
                                dato
                                    .cartaPorteAuto
                                    .cartaporte20FiguraTransporte[cpft]
                                    .tipoFigura,
                                context),
                            name(
                                'NombreFigura',
                                dato
                                    .cartaPorteAuto
                                    .cartaporte20FiguraTransporte[cpft]
                                    .nombreFigura,
                                context),
                            name(
                                'NumRegIdTribFigura',
                                dato
                                    .cartaPorteAuto
                                    .cartaporte20FiguraTransporte[cpft]
                                    .numRegIdTribFigura,
                                context),
                            name(
                                'ResidenciaFiscalFigura',
                                dato
                                    .cartaPorteAuto
                                    .cartaporte20FiguraTransporte[cpft]
                                    .residenciaFiscalFigura,
                                context),
                          ]))),
                  heads(context, 'TimbreFiscalDigital', 0, 40),
                  name('tfd', dato.xmlnsTfdT, context),
                  name('schemaLocation', dato.xsiSchemaLocationT, context),
                  name('Version', dato.versionT, context),
                  name('UUID', dato.uuidT, context),
                  name(
                      'FechaTimbrado', dato.fechaTimbradoT.toString(), context),
                  name('RFCProvCertif', dato.rfcProvCertifT, context),
                  name('SelloCFD', dato.selloCfdT, context),
                  name('NoCertificadoSAT', dato.noCertificadoSatT, context),
                  name('SelloSAT', dato.selloSatT, context)
                ])
              : const Divider(color: Colors.transparent),
        ],
      ),
    );
  }
}

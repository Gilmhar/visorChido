// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, unused_element, unused_local_variable, camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/DatosCFDI.dart';
import 'package:visor_xml/Moldes/Estructura_Datos.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';

class Pagos20_40 extends StatefulWidget {
  String data;
  Pagos20_40({Key? key, required this.data}) : super(key: key);

  @override
  State<Pagos20_40> createState() => _Pagos20_40State();
}

class _Pagos20_40State extends State<Pagos20_40> {
  bool icomp = true;
  bool iemisor = true;
  bool ireceptor = true;
  bool conceptosc = true;
  bool impuestosc = true;
  bool complementoc = true;

  @override
  Widget build(BuildContext context) {
    var dato = Provider.of<DatosCfdi>(context, listen: false);
    final Complemento = dato;
    final Concepto = dato.concepto;
    final CompPagos = dato.complementoPagos;

    return SingleChildScrollView(
      child: Column(
        children: [
          icomp || iemisor || ireceptor || conceptosc || complementoc
              ? const SizedBox(height: 10)
              : SizedBox(height: MediaQuery.of(context).size.height / 5),

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
                  heads(context, 'Pagos', 5, 15),
                  name('pago ${dato.PVersionC}', Complemento.pagoXxmlns,
                      context),
                  name('pago ${dato.PVersionC}', Complemento.pagosVersion,
                      context),
                  Complemento.pagosTotalTrasladosBaseIVA16 +
                              Complemento.pagosTotaltrasladosImpuestoIVA +
                              Complemento.pagosMontoTotal ==
                          ''
                      ? Container()
                      : heads(context, 'Totales', 5, 15),
                  name('TotalTrasladosBaseIVA16',
                      Complemento.pagosTotalTrasladosBaseIVA16, context),
                  name('TotalTrasladosImpuestosIVA16',
                      Complemento.pagosTotaltrasladosImpuestoIVA, context),
                  name('MontoTotalPagos', Complemento.pagosMontoTotal, context),
                  heads(context, 'Pago', 5, 15),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: CompPagos.length,
                      itemBuilder: (_, cpd) => ListTile(
                            subtitle: Column(
                              children: [
                                name(
                                    'Fecha pago',
                                    CompPagos[cpd].fechaPago.toString(),
                                    context),
                                name('FormaDePago', CompPagos[cpd].formaDePagoP,
                                    context),
                                name(
                                    'MonedaP', CompPagos[cpd].monedaP, context),
                                name('TipoCambioP', CompPagos[cpd].tipoCambioP,
                                    context),
                                name('Monto', CompPagos[cpd].monto, context),
                                name('NumOperacion',
                                    CompPagos[cpd].noOperacionP, context),
                                CompPagos[cpd].pago20DoctoRelacionado.length > 0
                                    ? ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: CompPagos[cpd]
                                            .pago20DoctoRelacionado
                                            .length,
                                        itemBuilder: (_, docr) => ListTile(
                                              subtitle: Column(
                                                children: [
                                                  heads(
                                                      context,
                                                      'Documento Relacionado ${docr + 1}',
                                                      0,
                                                      0),
                                                  name(
                                                      'ID-Documento',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .idDocumento,
                                                      context),
                                                  name(
                                                      'Serie',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .serie,
                                                      context),
                                                  name(
                                                      'Folio',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .folio,
                                                      context),
                                                  name(
                                                      'MonedaDR',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .monedaDr,
                                                      context),
                                                  name(
                                                      'EquivalenciaDR',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .equivalenciaDr,
                                                      context),
                                                  name(
                                                      'NumParcialidad',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .numParcialidad,
                                                      context),
                                                  name(
                                                      'ImpSaldoAnt',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .impSaldoAnt,
                                                      context),
                                                  name(
                                                      'ImpPagado',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .impPagado,
                                                      context),
                                                  name(
                                                      'ImpSaldoInsoluto',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .impSaldoInsoluto,
                                                      context),
                                                  name(
                                                      'ObjetoImpDR',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .objetoImpDr,
                                                      context),
                                                  heads(context, 'ImpuestosDR',
                                                      0, 0),
                                                  heads(context, 'TrasladosDR',
                                                      0, 0),
                                                  heads(context, 'TrasladoDR',
                                                      0, 0),
                                                  name(
                                                      'BaseDR',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .pago20ImpuestosDr
                                                          .pago20TrasladosDr
                                                          .pago20TrasladoDr
                                                          .baseDr,
                                                      context),
                                                  name(
                                                      'ImpuestoDR',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .pago20ImpuestosDr
                                                          .pago20TrasladosDr
                                                          .pago20TrasladoDr
                                                          .impuestoDr,
                                                      context),
                                                  name(
                                                      'TipoFactorDR',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .pago20ImpuestosDr
                                                          .pago20TrasladosDr
                                                          .pago20TrasladoDr
                                                          .tipoFactorDr,
                                                      context),
                                                  name(
                                                      'TasaOCuotaDR',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .pago20ImpuestosDr
                                                          .pago20TrasladosDr
                                                          .pago20TrasladoDr
                                                          .tasaOCuotaDr,
                                                      context),
                                                  name(
                                                      'ImporteDR',
                                                      CompPagos[cpd]
                                                          .pago20DoctoRelacionado[
                                                              docr]
                                                          .pago20ImpuestosDr
                                                          .pago20TrasladosDr
                                                          .pago20TrasladoDr
                                                          .importeDr,
                                                      context),
                                                ],
                                              ),
                                            ))
                                    : Container(),
                              ],
                            ),
                          )),
                  const Divider(height: 5, color: Colors.transparent),
                  heads(context, 'TimbreFiscalDigital', 5, 15),
                  name('tfd', dato.selloCfdT, context),
                  name('schemaLocation', dato.xsiSchemaLocation, context),
                  name('Version', dato.versionT, context),
                  name('UUID', dato.uuidT.toUpperCase(), context),
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

// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, unused_element, unused_local_variable, camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visor_xml/Moldes/DatosCFDI.dart';
import 'package:visor_xml/Moldes/Estructura_Datos.dart';
import 'package:visor_xml/Moldes/SaveDatos.dart';

class Nomina_40 extends StatefulWidget {
  String data;
  Nomina_40({Key? key, required this.data}) : super(key: key);

  @override
  State<Nomina_40> createState() => _Nomina_40State();
}

class _Nomina_40State extends State<Nomina_40> {
  bool icomp = true;
  bool iemisor = true;
  bool ireceptor = true;
  bool conceptosc = true;
  bool impuestosc = true;
  bool complementoc = true;

  @override
  Widget build(BuildContext context) {
    var dato = Provider.of<DatosCfdi>(context, listen: false);
    final Complemento = dato.complementosNomina;
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
                    name('DomicilioFiscal', dato.domicilioFiscalReceptor, context),
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
                                  dataC('ClaveUnidad', Concepto[i].claveUnidad, context),
                                  dataC('Cantidad', Concepto[i].cantidad, context),
                                  dataC('NoIdentificacion',
                                      Concepto[i].claveUnidad, context),
                                  dataC('Descripcion', Concepto[i].descripcion, context),
                                  dataC('ValorUnitario',
                                      Concepto[i].valorUnitario, context),
                                  dataC('Importe', Concepto[i].importe, context),
                                  dataC('Descuento', Concepto[i].descuento, context),
                                  dataC('ObjetoImp',
                                      objetoImpuesto(Concepto[i].objetoImp), context),
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
                                                    .base, context),
                                            dataC(
                                                'Impuesto',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .impuesto, context),
                                            dataC(
                                                'TipoFactor',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .tipoFactor, context),
                                            dataC(
                                                'TasaOCuota',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .tasaOCuota, context),
                                            dataC(
                                                'Importe',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiTraslados[it]
                                                    .cfdiTraslado
                                                    .importe, context),
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
                                                    .base, context),
                                            dataC(
                                                'Impuesto',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .impuesto, context),
                                            dataC(
                                                'TipoFactor',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .tipoFactor, context),
                                            dataC(
                                                'TasaOCuota',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .tasaOCuota, context),
                                            dataC(
                                                'Importe',
                                                Concepto[i]
                                                    .cfdiImpuestos
                                                    .cfdiRetenciones[ir]
                                                    .cfdiRetencion
                                                    .importe, context),
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
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Complemento.length,
                      itemBuilder: (_, c) => ListTile(
                            subtitle: Column(
                              children: [
                                heads(context, 'Nomina', 0, 0),
                                name('Version', Complemento[c].version, context),
                                name('TipoNomina', Complemento[c].tipoNomina, context),
                                name('Fecha Pago',
                                    Complemento[c].fechaPago.toString(), context),
                                name('FechaInicialpago',
                                    Complemento[c].fechaInicialPago.toString(), context),
                                name('FedchaFinalPago',
                                    Complemento[c].fechaFinalPago.toString(), context),
                                name('NumDiasPagado',
                                    Complemento[c].numDiasPagados, context),
                                name('TotalPercepciones',
                                    Complemento[c].totalPercepciones, context),
                                name('TotalDeducciones',
                                    Complemento[c].totalDeducciones, context),
                                name('TotalOtrosPagos',
                                    Complemento[c].totalOtrosPagos, context),
                                heads(context, 'Emisor', 5, 15),
                                name(
                                    'RegistroPatronal',
                                    Complemento[c]
                                        .nomina12Emisor
                                        .registroPatronal, context),
                                heads(context, 'Receptor', 5, 15),
                                name('Curp',
                                    Complemento[c].nomina12Receptor.curp, context),
                                name(
                                    'NumSeguridadSocial',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .numSeguridadSocial, context),
                                name(
                                    'FechaIniciolRealLaboral',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .fechaInicioRelLaboral
                                        .toString(), context),
                                name('Antiguedad',
                                    Complemento[c].nomina12Receptor.antigedad, context),
                                name(
                                    'TipoContrato',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .tipoContrato, context),
                                name(
                                    'Sindicalizado',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .sindicalizado, context),
                                name(
                                    'TipoJornada',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .tipoJornada, context),
                                name(
                                    'TipoRegimen',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .tipoRegimen, context),
                                name(
                                    'NumEmpleado',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .numEmpleado, context),
                                name(
                                    'RiesgoPuesto',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .riesgoPuesto, context),
                                name(
                                    'PeriodicidadPago',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .periodicidadPago, context),
                                name('Banco',
                                    Complemento[c].nomina12Receptor.banco, context),
                                name(
                                    'CuentaBancaria',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .cuentaBancaria, context),
                                name(
                                    'SalarioBaseCotApor',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .salarioBaseCotApor, context),
                                name(
                                    'SalarioDiarioIntegerado',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .salarioDiarioIntegrado, context),
                                name(
                                    'ClaveEntFed',
                                    Complemento[c]
                                        .nomina12Receptor
                                        .claveEntFed, context),
                                heads(context, 'Percepciones', 5, 15),
                                name(
                                    'TotalSueldos',
                                    Complemento[c]
                                        .nomina12Percepciones
                                        .totalSueldos, context),
                                name(
                                    'TotalGravado',
                                    Complemento[c]
                                        .nomina12Percepciones
                                        .totalGravado, context),
                                name(
                                    'TotalExento',
                                    Complemento[c]
                                        .nomina12Percepciones
                                        .totalExento, context),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: Complemento[c]
                                        .nomina12Percepciones
                                        .nomina12Percepcion
                                        .length,
                                    itemBuilder: (_, pe) => ListTile(
                                          subtitle: Column(
                                            children: [
                                              heads(
                                                  context, 'Percepcion', 5, 15),
                                              Container(
                                                child: name(
                                                    'TipoPercepcion',
                                                    Complemento[c]
                                                        .nomina12Percepciones
                                                        .nomina12Percepcion[pe]
                                                        .tipoPercepcion, context),
                                              ),
                                              Container(
                                                child: name(
                                                    'Clave',
                                                    Complemento[c]
                                                        .nomina12Percepciones
                                                        .nomina12Percepcion[pe]
                                                        .clave, context),
                                              ),
                                              Container(
                                                child: name(
                                                    'Concepto',
                                                    Complemento[c]
                                                        .nomina12Percepciones
                                                        .nomina12Percepcion[pe]
                                                        .concepto, context),
                                              ),
                                              Container(
                                                child: name(
                                                    'ImporteGravado',
                                                    Complemento[c]
                                                        .nomina12Percepciones
                                                        .nomina12Percepcion[pe]
                                                        .importeGravado, context),
                                              ),
                                              Container(
                                                child: name(
                                                    'ImporteExento',
                                                    Complemento[c]
                                                        .nomina12Percepciones
                                                        .nomina12Percepcion[pe]
                                                        .importeExento, context),
                                              ),
                                            ],
                                          ),
                                        )),
                                heads(context, 'Deducciones', 0, 0),
                                name(
                                    'TotalOtrasDeducciones',
                                    Complemento[c]
                                        .nomina12Deducciones
                                        .totalOtrasDeducciones
                                        .toString(), context),
                                name(
                                    'TotalImpuestosRetenidos',
                                    Complemento[c]
                                        .nomina12Deducciones
                                        .totalImpuestosRetenidos
                                        .toString(), context),
                                heads(context, 'Deduccion', 5, 15),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: Complemento[c]
                                        .nomina12Deducciones
                                        .nomina12Deduccion
                                        .length,
                                    itemBuilder: (_, d) => ListTile(
                                          subtitle: Column(
                                            children: [
                                              Container(
                                                child: name(
                                                    'TipoDeduccion',
                                                    Complemento[c]
                                                        .nomina12Deducciones
                                                        .nomina12Deduccion[d]
                                                        .tipoDeduccion, context),
                                              ),
                                              Container(
                                                child: name(
                                                    'Clave',
                                                    Complemento[c]
                                                        .nomina12Deducciones
                                                        .nomina12Deduccion[d]
                                                        .clave, context),
                                              ),
                                              Container(
                                                child: name(
                                                    'Concepto',
                                                    Complemento[c]
                                                        .nomina12Deducciones
                                                        .nomina12Deduccion[d]
                                                        .concepto, context),
                                              ),
                                              Container(
                                                child: name(
                                                    'Importe',
                                                    Complemento[c]
                                                        .nomina12Deducciones
                                                        .nomina12Deduccion[d]
                                                        .importe, context),
                                              ),
                                            ],
                                          ),
                                        )),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: Complemento[c]
                                        .nomina12OtrosPagos
                                        .nomina12OtroPago
                                        .length,
                                    itemBuilder: (_, op) => ListTile(
                                            subtitle: Column(
                                          children: [
                                            Container(
                                                child: heads(context,
                                                    'OtrosPagos', 0, 0)),
                                            Container(
                                                child: heads(context,
                                                    'OtroPago', 5, 15)),
                                            Container(
                                                child: name(
                                                    'Importe',
                                                    Complemento[c]
                                                        .nomina12OtrosPagos
                                                        .nomina12OtroPago[op]
                                                        .tipoOtroPago, context)),
                                            Container(
                                                child: name(
                                                    'Clave',
                                                    Complemento[c]
                                                        .nomina12OtrosPagos
                                                        .nomina12OtroPago[op]
                                                        .clave, context)),
                                            Container(
                                                child: name(
                                                    'Concepto',
                                                    Complemento[c]
                                                        .nomina12OtrosPagos
                                                        .nomina12OtroPago[op]
                                                        .concepto, context)),
                                            Container(
                                                child: name(
                                                    'Importe',
                                                    Complemento[c]
                                                        .nomina12OtrosPagos
                                                        .nomina12OtroPago[op]
                                                        .importe, context)),
                                            Container(
                                              child: heads(context,
                                                  'SubsidioAlEmpleo', 0, 0),
                                            ),
                                            Container(
                                              child: heads(context,
                                                  'SubsidioCausado', 0, 0),
                                            ),
                                            Container(
                                                child: name(
                                                    'Importe',
                                                    Complemento[c]
                                                        .nomina12OtrosPagos
                                                        .nomina12OtroPago[op]
                                                        .nomina12SubsidioAlEmpleo
                                                        .subsidioCausado, context)),
                                          ],
                                        ))),
                              ],
                            ),
                          )),
                  const Divider(height: 5, color: Colors.transparent),
                  heads(context, 'TimbreFiscalDigital', 0, 40),
                  name('tfd', dato.xmlnsTfdT, context),
                  name('schemaLocation', dato.xsiSchemaLocationT, context),
                  name('Version', dato.versionT, context),
                  name('UUID', dato.uuidT.toUpperCase(), context),
                  name('FechaTimbrado', dato.fechaTimbradoT.toString(), context),
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

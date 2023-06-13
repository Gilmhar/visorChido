// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:visor_xml/Moldes/Preferencias.dart';
import 'package:visor_xml/utils/datos_xml.dart';

class FormattedText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  FormattedText(this.text, {Key? key, this.style}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final s = DefaultTextStyle.of(context);

    var sinCer = quitarCertificado(text, 'NoCertificado=', 'SubTotal=');
    final newCer = sinCer.substring(0, 150);
    final textm = text.replaceAll(sinCer, newCer);

    var t = '';
    if (Pref.show == true) {
      t = text;
    } else {
      t = textm;
    }

    return ParsedText(
      text: t,
      style: style ?? s.style,
      parse: parse,
    );
  }

  final parse = <MatchText>[
    b1('"', const Color.fromARGB(255, 234, 2, 79)),
    ////////////////////////////////////////////////////////////////////////////
    b1('</', Colors.blue),
    b1('<', Colors.blue),
    b1('>', Colors.blue),
    b1('/>', Colors.blue),
    ////////////////////////////////////////////////////////////////////////////
    b1('==', Colors.black),
    ////////////////////////////////////////////////////////////////////////////
    b1('=', Colors.green),
    b1('cfdi:Comprobante', Colors.green),
    b1('cfdi:CfdiRelacionados', Colors.green),
    b1('cfdi:CfdiRelacionado', Colors.green),
    b1('cfdi:Emisor', Colors.green),
    b1('cfdi:Receptor', Colors.green),
    b1('cfdi:Conceptos', Colors.green),
    b1('cfdi:Concepto', Colors.green),
    b1('cfdi:Impuestos', Colors.green),
    b1('cfdi:Traslados', Colors.green),
    b1('cfdi:Traslado', Colors.green),
    b1('tfd:TimbreFiscalDigital ', Colors.green),
    b1('cfdi:Complemento', Colors.green),
    b1('cfdi:Retenciones', Colors.green),
    b1('cfdi:Retencion', Colors.green),
    b1('cartaporte20:CartaPorte', Colors.green),
    b1('cartaporte20:Ubicaciones', Colors.green),
    b1('cartaporte20:Ubicacion', Colors.green),
    b1('cartaporte20:Domicilio', Colors.green),
    b1('cartaporte20:Mercancias', Colors.green),
    b1('cartaporte20:Mercancia', Colors.green),
    b1('cartaporte20:CantidadTransporta', Colors.green),
    b1('cartaporte20:Autotransporte', Colors.green),
    b1('cartaporte20:Remolques', Colors.green),
    b1('cartaporte20:Remolque', Colors.green),
    b1('cartaporte20:FiguraTransporte', Colors.green),
    b1('cartaporte20:TiposFigura', Colors.green),
    b1('cartaporte20:IdentificacionVeicular', Colors.green),
    b1('cartaporte20:Seguros', Colors.green),
    b1('cartaporte20:IdentificacionVehicular', Colors.green),
    b1('pago10:pagos', Colors.green),
    b1('pago10:Pago', Colors.green),
    b1('pago10:DoctoRelacionado', Colors.green),
    ////////////////////////////////////////////////////////////////////////////
    b1('TotalImpuestosRetenidos', const Color.fromARGB(255, 135, 14, 14)),
    b1('TotalImpuestosTrasladados', const Color.fromARGB(255, 135, 14, 14)),
    b1('xmlns:cfdi', const Color.fromARGB(255, 135, 14, 14)),
    b1('xmlns:xsi', const Color.fromARGB(255, 135, 14, 14)),
    b1('xsi:schemaLocation', const Color.fromARGB(255, 135, 14, 14)),
    b1('Version', const Color.fromARGB(255, 135, 14, 14)),
    b1('Serie', const Color.fromARGB(255, 135, 14, 14)),
    b1('Folio', const Color.fromARGB(255, 135, 14, 14)),
    b1('FechaHoraSalidaLlegada', const Color.fromARGB(255, 135, 14, 14)),
    b1('FechaPago', const Color.fromARGB(255, 135, 14, 14)),
    b1('FechaTimbrado', const Color.fromARGB(255, 135, 14, 14)),
    b1('Fecha', const Color.fromARGB(255, 135, 14, 14)),
    b1('FormaPago', const Color.fromARGB(255, 135, 14, 14)),
    b1('NoCertificadoSAT', const Color.fromARGB(255, 135, 14, 14)),
    b1('NoCertificado', const Color.fromARGB(255, 135, 14, 14)),
    b1('Certificado', const Color.fromARGB(255, 135, 14, 14)),
    b1('SubTotal', const Color.fromARGB(255, 135, 14, 14)),
    b1('MonedaDR', const Color.fromARGB(255, 135, 14, 14)),
    b1('MonedaP', const Color.fromARGB(255, 135, 14, 14)),
    b1('Moneda', const Color.fromARGB(255, 135, 14, 14)),
    b1('NumTotalMercancias', const Color.fromARGB(255, 135, 14, 14)),
    b1('TotalDistRec', const Color.fromARGB(255, 135, 14, 14)),
    b1('Total', const Color.fromARGB(255, 135, 14, 14)),
    b1('TipoDeComprobante', const Color.fromARGB(255, 135, 14, 14)),
    b1('MetodoPago', const Color.fromARGB(255, 135, 14, 14)),
    b1('LugarExpedicion', const Color.fromARGB(255, 135, 14, 14)),
    b1('TipoRelacion', const Color.fromARGB(255, 135, 14, 14)),
    b1('UUID', const Color.fromARGB(255, 135, 14, 14)),
    b1('RFCRemitenteDestinatario', const Color.fromARGB(255, 135, 14, 14)),
    b1('RfcProvCertif', const Color.fromARGB(255, 135, 14, 14)),
    b1('Rfc', const Color.fromARGB(255, 135, 14, 14)),
    b1('NombreRemitenteDestinatario', const Color.fromARGB(255, 135, 14, 14)),
    b1('NombreFigura', const Color.fromARGB(255, 135, 14, 14)),
    b1('Nombre', const Color.fromARGB(255, 135, 14, 14)),
    b1('RegimenFiscal', const Color.fromARGB(255, 135, 14, 14)),
    b1('RegimenFiscalReceptor', const Color.fromARGB(255, 135, 14, 14)),
    b1('DomicilioFiscalReceptor', const Color.fromARGB(255, 135, 14, 14)),
    b1('UsoCFDI', const Color.fromARGB(255, 135, 14, 14)),
    b1('ClaveProdServ', const Color.fromARGB(255, 135, 14, 14)),
    b1('NoIdentificacion', const Color.fromARGB(255, 135, 14, 14)),
    b1('Cantidad', const Color.fromARGB(255, 135, 14, 14)),
    b1('ClaveUnidad', const Color.fromARGB(255, 135, 14, 14)),
    b1('UnidadPeso', const Color.fromARGB(255, 135, 14, 14)),
    b1('Unidad', const Color.fromARGB(255, 135, 14, 14)),
    b1('Descripcion', const Color.fromARGB(255, 135, 14, 14)),
    b1('ValorUnitario', const Color.fromARGB(255, 135, 14, 14)),
    b1('Importe', const Color.fromARGB(255, 135, 14, 14)),
    b1('Base', const Color.fromARGB(255, 135, 14, 14)),
    b1('Impuesto', const Color.fromARGB(255, 135, 14, 14)),
    b1('TipoFactor', const Color.fromARGB(255, 135, 14, 14)),
    b1('TasaOCuota', const Color.fromARGB(255, 135, 14, 14)),
    b1('FechaTimbrado', const Color.fromARGB(255, 135, 14, 14)),
    b1('NoCertificadoSAT', const Color.fromARGB(255, 135, 14, 14)),
    b1('RfcProvCertif', const Color.fromARGB(255, 135, 14, 14)),
    b1('SelloCFD', const Color.fromARGB(255, 135, 14, 14)),
    b1('SelloSAT', const Color.fromARGB(255, 135, 14, 14)),
    b1('xmlns:tfd', const Color.fromARGB(255, 135, 14, 14)),
    b1('CondicionesDePago', const Color.fromARGB(255, 135, 14, 14)),
    b1('Sello', const Color.fromARGB(255, 135, 14, 14)),
    b1('xmlns:cartaporte20', const Color.fromARGB(255, 135, 14, 14)),
    b1('TipoCambio', const Color.fromARGB(255, 135, 14, 14)),
    b1('IDUbicacion', const Color.fromARGB(255, 135, 14, 14)),
    b1('TipoUbicacion', const Color.fromARGB(255, 135, 14, 14)),
    b1('Exportacion', const Color.fromARGB(255, 135, 14, 14)),
    b1('ObjetoImp', const Color.fromARGB(255, 135, 14, 14)),
    b1('TraspInternac', const Color.fromARGB(255, 135, 14, 14)),
    b1('Calle', const Color.fromARGB(255, 135, 14, 14)),
    b1('Colonia', const Color.fromARGB(255, 135, 14, 14)),
    b1('Estado', const Color.fromARGB(255, 135, 14, 14)),
    b1('Localidad', const Color.fromARGB(255, 135, 14, 14)),
    b1('Municipio', const Color.fromARGB(255, 135, 14, 14)),
    b1('NumeroExterior', const Color.fromARGB(255, 135, 14, 14)),
    b1('DistaciaRecorrida', const Color.fromARGB(255, 135, 14, 14)),
    b1('Pais', const Color.fromARGB(255, 135, 14, 14)),
    b1('BienesTransp', const Color.fromARGB(255, 135, 14, 14)),
    b1('PesoBrutoTotal', const Color.fromARGB(255, 135, 14, 14)),
    b1('PesoEnKg', const Color.fromARGB(255, 135, 14, 14)),
    b1('IDDestino', const Color.fromARGB(255, 135, 14, 14)),
    b1('IDOrigen', const Color.fromARGB(255, 135, 14, 14)),
    b1('MaterialPeligroso', const Color.fromARGB(255, 135, 14, 14)),
    b1('CodigoPostal', const Color.fromARGB(255, 135, 14, 14)),
    b1('NumPermisoSCT', const Color.fromARGB(255, 135, 14, 14)),
    b1('PermSCT', const Color.fromARGB(255, 135, 14, 14)),
    b1('AnioModeloVM', const Color.fromARGB(255, 135, 14, 14)),
    b1('ConfigVehicular', const Color.fromARGB(255, 135, 14, 14)),
    b1('PlacaVM', const Color.fromARGB(255, 135, 14, 14)),
    b1('AseguraCarga', const Color.fromARGB(255, 135, 14, 14)),
    b1('AseguraRespCivil', const Color.fromARGB(255, 135, 14, 14)),
    b1('PolizaCarga', const Color.fromARGB(255, 135, 14, 14)),
    b1('PolizaRespCivil', const Color.fromARGB(255, 135, 14, 14)),
    b1('Placa', const Color.fromARGB(255, 135, 14, 14)),
    b1('SubTipoRem', const Color.fromARGB(255, 135, 14, 14)),
    b1('NumLicencia', const Color.fromARGB(255, 135, 14, 14)),
    b1('RFCFigura', const Color.fromARGB(255, 135, 14, 14)),
    b1('TipoFigura', const Color.fromARGB(255, 135, 14, 14)),
    b1('FormaDePagoP', const Color.fromARGB(255, 135, 14, 14)),
    b1('Monto', const Color.fromARGB(255, 135, 14, 14)),
    b1('NumOperacion', const Color.fromARGB(255, 135, 14, 14)),
    b1('IdDocumento', const Color.fromARGB(255, 135, 14, 14)),
    b1('MetodoDePagoDR', const Color.fromARGB(255, 135, 14, 14)),
    b1('NumParcialidad', const Color.fromARGB(255, 135, 14, 14)),
    b1('ImpSaldoAnt', const Color.fromARGB(255, 135, 14, 14)),
    b1('ImpPagado', const Color.fromARGB(255, 135, 14, 14)),
    b1('ImpSaldoInsoluto', const Color.fromARGB(255, 135, 14, 14)),
  ];
}

b1(String p, Color c) {
  return MatchText(
    pattern: p,
    renderWidget: ({required pattern, required text}) =>
        Text(text, style: TextStyle(color: c, fontSize: 10)),
  );
}

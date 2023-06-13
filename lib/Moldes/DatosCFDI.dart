// ignore_for_file: file_names

import 'package:intl/intl.dart';

formatCantidades(String n) {
  final numero = n.replaceAll('\$', '').replaceAll(',', '');
  NumberFormat f = NumberFormat("#,###.0#", "es_US");
  String result = f.format(double.parse(numero == '' ? '0.0' : numero));
  return result;
}

formadepago(String formaPago) {
  const formaDePago = {
    '01': '01 - Efectivo',
    '02': '02 - Cheque nominativo',
    '03': '03 - Transferencia electrónica de fondos',
    '04': '04 - Tarjeta de crédito',
    '05': '05 - Monedero electrónico',
    '06': '06 - Dinero electrónico',
    '08': '08 - Vales de despensa',
    '12': '12 - Dación en pago',
    '13': '13 - Pago por subrogación',
    '14': '14 - Pago por consignación',
    '15': '15 - Condonación',
    '17': '17 - Compensación',
    '23': '23 - Novación',
    '24': '24 - Confusión',
    '25': '25 - Remisión de deuda',
    '26': '26 - Prescripción o caducidad',
    '27': '27 - A satisfacción del acreedor',
    '28': '28 - Tarjeta de débito',
    '29': '29 - Tarjeta de servicios',
    '30': '30 - Aplicación de anticipos',
    '31': '31 - Intermediario pagos',
    '99': '99 - Por definir'
  };
  var formaPagoDefault = '$formaPago - Forma de pago no encontrada';
  return formaDePago[formaPago] ?? formaPagoDefault;
}

tipoComprobante(String tipo) {
  const tipoDeComprobante = {
    'I': 'I - Ingreso',
    'E': 'E - Egreso',
    'T': 'T - Traslado',
    'P': 'P - Pago',
    'N': 'N - Nomina'
  };
  var tipoDefecto = '$tipo - no se encontro';
  return tipoDeComprobante[tipo] ?? tipoDefecto;
}

metodoPago(String metodo) {
  const metodoDePago = {
    'PUE': 'PUE - Pago en una sola exhibición',
    'PPD': 'PPD - Pago en parcialidades o diferido',
  };
  var metodoDefecto = '$metodo - Metodo no encontrado';
  return metodoDePago[metodo] ?? metodoDefecto;
}

regimenFiscal(String regimen) {
  const regFiscal = {
    '601': '601 - General de Ley Personas Morales',
    '603': '603 - Personas Morales con Fines no Lucrativos',
    '605': '605 - Sueldos y Salarios e Ingresos Asimilados a Salarios',
    '606': '606 - Arrendamiento',
    '607': '607 - Régimen de Enajenación o Adquisición de Bienes',
    '608': '608 - Demás ingresos',
    '609': '609 - Consolidación',
    '610':
        '610 - Residentes en el Extranjero sin Establecimiento Permanente en México',
    '611': '611 - Ingresos por Dividendos (socios y accionistas)',
    '612':
        '612 - Personas Físicas con Actividades Empresariales y Profesionales',
    '614': '614 - Ingresos por intereses',
    '615': '615 - Régimen de los ingresos por obtención de premios',
    '616': '616 - Sin obligaciones fiscales',
    '620':
        '620 - Sociedades Cooperativas de Producción que optan por diferir sus ingresos',
    '621': '621 - Incorporación Fiscal',
    '622': '622 - Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras',
    '623': '623 - Opcional para Grupos de Sociedades',
    '624': '624 - Coordinados',
    '626': '626 - Régimen Simplificado de Confianza',
    '628': '628 - Hidrocarburos',
    '629':
        '629 - De los Regímenes Fiscales Preferentes y de las Empresas Multinacionales',
    '630': '630 - Enajenación de acciones en bolsa de valores',
  };
  var regDefault = '$regimen - Regimen no encontrado';
  return regFiscal[regimen] ?? regDefault;
}

usoCFDI(String cfdi) {
  const usoDeCFDI = {
    'G01': 'G01 - Adquisición de mercancías.',
    'G02': 'G02 - Devoluciones, descuentos o bonificaciones.',
    'G03': 'G03 - Gastos en general.',
    'I01': 'I01 - Construcciones.',
    'I02': 'I02 - Mobiliario y equipo de oficina por inversiones.',
    'I03': 'I03 - Equipo de transporte.',
    'I04': 'I04 - Equipo de computo y accesorios.',
    'I05': 'I05 - Dados, troqueles, moldes, matrices y herramental.',
    'I06': 'I06 - Comunicaciones telefónicas.',
    'I07': 'I07 - Comunicaciones satelitales.',
    'I08': 'I08 - Otra maquinaria y equipo.',
    'D01': 'D01 - Honorarios médicos, dentales y gastos hospitalarios.',
    'D02': 'D02 - Gastos médicos por incapacidad o discapacidad.',
    'D03': 'D03 - Gastos funerales.',
    'D04': 'D04 -Donativos',
    'D05':
        'D05 - Intereses reales efectivamente pagados por créditos hipotecarios (casa habitación).',
    'D06': 'D06 - Aportaciones voluntarias al SAR.',
    'D07': 'D07 - Primas por seguros de gastos médicos.',
    'D08': 'D08 - Gastos de transportación escolar obligatoria.',
    'D09':
        'D09 - Depósitos en cuentas para el ahorro, primas que tengan como base planes de pensiones.',
    'D10': 'D10 - Pagos por servicios educativos (colegiaturas).',
    'S01': 'S01 - Sin efectos fiscales.',
    'CP01': 'CP01 - Pagos',
    'CN01': 'CN01 - Nómina',
    'P01': 'P01 - Por definir'
  };
  var usoCFDIDefault = '$cfdi - No se encontro';
  return usoDeCFDI[cfdi] ?? usoCFDIDefault;
}

objetoImpuesto(String obImpuestos) {
  const objetoDeImpuestos = {
    '01': '01 - No objeto de impuesto',
    '02': '02 - Si objeto de impuesto',
    '03': '03 - Si objeto de impuesto y no obligado al desglose',
    '04': '04 - Sí objeto del impuesto y no causa impuesto',
  };
  var obImpuestosDefault = '$obImpuestos - No se encontro informacion';
  return objetoDeImpuestos[obImpuestos] ?? obImpuestosDefault;
}

tipoRelacion(String tipoRelacion) {
  const tipoDeRelacion = {
    '01': '01 - Nota de crédito de los documentos relacionados',
    '02': '02 - Nota de débito de los documentos relacionados',
    '03': '03 - Devolución de mercancía sobre facturas o traslados previos',
    '04': '04 - Sustitución de los CFDI previos',
    '05': '05 - Traslados de mercancias facturados previamente',
    '06': '06 - Factura generada por los traslados previos',
    '07': '07 - CFDI por aplicación de anticipo',
  };
  var tipoRelacionEDefault = '$tipoRelacion - No se encontro';
  return tipoDeRelacion[tipoRelacion] ?? tipoRelacionEDefault;
}

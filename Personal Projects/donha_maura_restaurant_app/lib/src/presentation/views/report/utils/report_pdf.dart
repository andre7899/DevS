import 'package:donha_maura_restaurant_app/src/domain/models/report.dart';
// import 'package:starbrands_erp_app/src/config/image.dart';
// import 'package:starbrands_erp_app/src/domain/models/quotation.dart';
// import 'package:starbrands_erp_app/src/domain/models/quotation_item.dart';
// import 'package:starbrands_erp_app/src/domain/models/quotation_type.dart';
// import 'package:starbrands_erp_app/src/domain/models/user.dart';
// import 'package:starbrands_erp_app/src/utils/parse_date.dart';
// import 'package:starbrands_erp_app/src/utils/utils_lists.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<Uint8List> reportPdfToBytes(Report report) async {
  final pdf = pw.Document();
  // await initializeDateFormatting('es_ES', null);

  // Obtener imagen
  ByteData imgbytes = await rootBundle.load('assets/logo.png');
  Uint8List logobytes = imgbytes.buffer.asUint8List();

  // ------------Obtencion de datos del reporte ------------
  final elementsReportList = report.elementsReportList;
  final totalQuantity = report.totalQuantitySales;
  final subTotal = report.subTotalSales;

  final billsReportList = report.billsReportList;
  final totalQuantityBills = report.totalQuantityBills;
  final subTotalBills = report.subTotalBills;

  // pw.TextStyle stylePdf({bool bold = false, PdfColor color = PdfColors.black}) {
  //   return pw.TextStyle(
  //     fontSize: 10,
  //     color: color,
  //     fontWeight: bold ? pw.FontWeight.bold : null,
  //   );
  // }

  List<List<dynamic>> rows = [];

  for (var elementReport in elementsReportList) {
    rows.add([
      elementReport.product.name,
      elementReport.quantity,
      ((elementReport.quantity * elementReport.product.unitPrice)
          .toStringAsFixed(2)),
    ]);
  }

  final table = TableHelper.fromTextArray(
    border: pw.TableBorder.all(),
    headerStyle: pw.TextStyle(
      fontSize: 20,
      color: PdfColors.blue900,
      fontWeight: pw.FontWeight.bold,
    ),
    cellStyle: const pw.TextStyle(
      fontSize: 16,
    ),
    headers: [
      'Producto',
      'Cantidad',
      'Subtotal',
    ],
    cellAlignments: {
      2: pw.Alignment.centerRight,
    },
    columnWidths: {
      0: const pw.FlexColumnWidth(1),
      1: const pw.FixedColumnWidth(110),
      2: const pw.FixedColumnWidth(110),
    },
    data: rows,
  );

  final summaryTable = TableHelper.fromTextArray(
    border: pw.TableBorder.all(),
    headerStyle: pw.TextStyle(
      fontSize: 20,
      color: PdfColors.black,
      fontWeight: pw.FontWeight.bold,
    ),
    cellStyle: const pw.TextStyle(
      fontSize: 16,
    ),
    headers: ['Total', '$totalQuantity', (subTotal.toStringAsFixed(2))],
    data: [],
    cellAlignments: {
      2: pw.Alignment.centerRight,
    },
    columnWidths: {
      0: const pw.FlexColumnWidth(1),
      1: const pw.FixedColumnWidth(110),
      2: const pw.FixedColumnWidth(110),
    },
  );

  //----------------------------------------------------------------------

  List<List<dynamic>> rowsBills = [];

  for (var bills in billsReportList) {
    rowsBills.add([
      bills.product.name,
      bills.quantity,
      ((bills.quantity * bills.product.unitPrice).toStringAsFixed(2)),
    ]);
  }

  final tableBills = TableHelper.fromTextArray(
    border: pw.TableBorder.all(),
    headerStyle: pw.TextStyle(
      fontSize: 20,
      color: PdfColors.blue900,
      fontWeight: pw.FontWeight.bold,
    ),
    cellStyle: const pw.TextStyle(
      fontSize: 16,
    ),
    headers: [
      'Producto',
      'Cantidad',
      'Subtotal',
    ],
    cellAlignments: {
      2: pw.Alignment.centerRight,
    },
    columnWidths: {
      0: const pw.FlexColumnWidth(1),
      1: const pw.FixedColumnWidth(110),
      2: const pw.FixedColumnWidth(110),
    },
    data: rowsBills,
  );

  final summaryBillsTable = TableHelper.fromTextArray(
    border: pw.TableBorder.all(),
    headerStyle: pw.TextStyle(
      fontSize: 20,
      color: PdfColors.black,
      fontWeight: pw.FontWeight.bold,
    ),
    cellStyle: const pw.TextStyle(
      fontSize: 16,
    ),
    headers: [
      'Total',
      '$totalQuantityBills',
      (subTotalBills.toStringAsFixed(2))
    ],
    data: [],
    cellAlignments: {
      2: pw.Alignment.centerRight,
    },
    columnWidths: {
      0: const pw.FlexColumnWidth(1),
      1: const pw.FixedColumnWidth(110),
      2: const pw.FixedColumnWidth(110),
    },
  );
  //-------------------------------------------------------

  final finalSaleTable = TableHelper.fromTextArray(
    border: pw.TableBorder.all(),
    headerStyle: pw.TextStyle(
      fontSize: 20,
      color: PdfColors.black,
      fontWeight: pw.FontWeight.bold,
    ),
    cellStyle: const pw.TextStyle(
      fontSize: 16,
    ),
    headers: ['Venta final', (subTotal - subTotalBills).toStringAsFixed(2)],
    data: [],
    cellAlignments: {
      1: pw.Alignment.centerRight,
    },
    columnWidths: {
      0: const pw.FlexColumnWidth(1),
      1: const pw.FixedColumnWidth(110),
    },
  );

  //------------------------------------------------------

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return [
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
              children: [
                pw.SizedBox(
                  width: 200,
                  child: pw.Image(
                    pw.MemoryImage(
                      logobytes,
                    ),
                  ),
                ),
                pw.Column(children: [
                  pw.Text('REPORTE DE VENTA DIARIA'),
                  pw.Text(DateFormat('HH:mm dd/MM/yyyy').format(DateTime.now()))
                ])
              ]),
          table,
          summaryTable,
          pw.SizedBox(height: 20),
          tableBills,
          summaryBillsTable,
          pw.SizedBox(height: 20),
          finalSaleTable,
        ];
      },

      // footer: (pw.Context context) {
      //   return pw.Row(
      //     children: [
      //       pw.Spacer(),
      //       pw.Expanded(
      //         child: pw.Text(
      //           'Página ${context.pageNumber} / ${context.pagesCount}',
      //           textAlign: pw.TextAlign.center,
      //           style: stylePdf(),
      //         ),
      //       ),
      //     ],
      //   );
      // },
    ),
  );
  //----------Codigo para descargar pdf------------------
  // final output = await getDownloadsDirectory();
  // final file = File("${output!.path}/ejemplo_Nota_de_debito.pdf");
  // await file.writeAsBytes(await pdf.save());
  // await Printing.layoutPdf(
  //     onLayout: (PdfPageFormat format) async => pdf.save());
  return pdf.save();
}

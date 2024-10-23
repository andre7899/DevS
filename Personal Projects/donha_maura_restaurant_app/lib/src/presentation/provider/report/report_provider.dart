import 'package:donha_maura_restaurant_app/main.dart';
import 'package:donha_maura_restaurant_app/src/data/repositories/managment.dart';
import 'package:donha_maura_restaurant_app/src/domain/models/report_element.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/report/utils/report_pdf.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/report/widgets/delete_report_dialog.dart';
import 'package:donha_maura_restaurant_app/src/presentation/views/report/widgets/generate_report_dialog.dart';
import 'package:donha_maura_restaurant_app/src/presentation/widgets/pdfviewerlocal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportProvider extends ChangeNotifier {
  final pageController = PageController();
  List<List<ReportElement>> infoList = [
    Provider.of<ManagmentProvider>(navigatorKey.currentContext!)
        .report
        .elementsReportList,
    Provider.of<ManagmentProvider>(navigatorKey.currentContext!)
        .report
        .billsReportList,
  ];

  void _listener() {
    currentPage = pageController.page ?? 0;
    notifyListeners();
  }

  double currentPage = 0;

  ReportProvider() {
    pageController.addListener(_listener);
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    super.dispose();
  }

  void onTapGenerateReport() async {
    final confirm = await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return const GenerateReportDialolg();
      },
    );
    if (confirm != true) return;
    final report = Provider.of<ManagmentProvider>(navigatorKey.currentContext!,
            listen: false)
        .report;
    final reportPdf = await reportPdfToBytes(report);

    await showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) {
        return SfPdfViewerDialog.bytes(
          bytes: reportPdf,
        );
      },
    );
  }

  void onTapDeleteReport() async {
    await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return const DeleteReportDialog();
      },
    );
    notifyListeners();
  }
}

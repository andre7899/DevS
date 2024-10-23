import 'dart:io';

import 'package:donha_maura_restaurant_app/src/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class SfPdfViewerDialog extends StatefulWidget {
  //  ViewerPdfDialog({super.key});
  SfPdfViewerDialog.url({super.key, required this.url});
  SfPdfViewerDialog.file({super.key, required this.pdfFile});
  SfPdfViewerDialog.bytes({super.key, required this.bytes});

  String? url;
  File? pdfFile;
  Uint8List? bytes;

  @override
  State<SfPdfViewerDialog> createState() => _SfPdfViewerDialogState();
}

class _SfPdfViewerDialogState extends State<SfPdfViewerDialog> {
  late SfPdfViewer sfPdfViewer;
  final PdfViewerController pdfViewerController = PdfViewerController();
  final numberPageController = TextEditingController(text: '1');
  int numberPage = 1;
  int totalPages = 1000;

  @override
  void initState() {
    if (widget.pdfFile != null) {
      sfPdfViewer = SfPdfViewer.file(
        widget.pdfFile!,
        controller: pdfViewerController,
        maxZoomLevel: 5,
        pageLayoutMode: PdfPageLayoutMode.continuous,
        interactionMode: PdfInteractionMode.pan,
        onDocumentLoaded: (details) => setState(() {}),
        onPageChanged: (details) => setState(() {
          numberPage = details.newPageNumber;
          numberPageController.text = numberPage.toString();
          // print('==>');
          // print(pdfViewerController.pageCount);
          // print(pdfViewerController.pageNumber);
        }),
      );
    } else if (widget.url != null) {
      sfPdfViewer = SfPdfViewer.network(
        widget.url!,
        controller: pdfViewerController,
        maxZoomLevel: 5,
        pageLayoutMode: PdfPageLayoutMode.continuous,
        interactionMode: PdfInteractionMode.pan,
        onDocumentLoaded: (details) => setState(() {}),
        onPageChanged: (details) => setState(() {
          numberPage = details.newPageNumber;
          numberPageController.text = numberPage.toString();
          // print('==>');
          // print(pdfViewerController.pageCount);
          // print(pdfViewerController.pageNumber);
        }),
      );
    } else {
      sfPdfViewer = SfPdfViewer.memory(
        widget.bytes!,
        controller: pdfViewerController,
        maxZoomLevel: 5,
        pageLayoutMode: PdfPageLayoutMode.continuous,
        interactionMode: PdfInteractionMode.pan,
        onDocumentLoaded: (details) => setState(() {}),
        onPageChanged: (details) => setState(() {
          numberPage = details.newPageNumber;
          numberPageController.text = numberPage.toString();
          // print('==>');
          // print(pdfViewerController.pageCount);
          // print(pdfViewerController.pageNumber);
        }),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    numberPageController.dispose();
    pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
      title: Container(
        height: 50,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const Icon(
            //   Icons.folder_open_sharp,
            //   color: Colors.white,
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 40,
                    // height: 30,
                    child: TextField(
                      controller: numberPageController,
                      textAlign: TextAlign.center,
                      scrollPadding: const EdgeInsets.all(0),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(bottom: 15),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      onSubmitted: onSubmittedTextfield,
                      onTapOutside: onTapOutsideTextfield,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    )),
                Text('de ${pdfViewerController.pageCount}'),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: previousPage,
                  child: const Icon(Icons.chevron_left, color: Colors.white),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: nextPage,
                  child: const Icon(Icons.chevron_right, color: Colors.white),
                ),
                const VerticalDivider(),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: onTapShare,
                  child: const Icon(Icons.share, color: Colors.white),
                ),
                const VerticalDivider(),
                // const VerticalDivider(),
                // CupertinoButton(
                //   padding: EdgeInsets.zero,
                //   onPressed: onTapZoomOut,
                //   child: const Icon(Icons.remove_circle_outline,
                //       color: Colors.white),
                // ),
                // CupertinoButton(
                //   padding: EdgeInsets.zero,
                //   onPressed: onTapZoomIn,
                //   child:
                //       const Icon(Icons.add_circle_outline, color: Colors.white),
                // ),
                // const VerticalDivider(),
                // CupertinoButton(
                //   padding: EdgeInsets.zero,
                //   child: const Icon(Icons.back_hand, color: Colors.white),
                //   onPressed: () {},
                // ),
              ],
            ),
            Row(
              children: [
                // const Icon(
                //   Icons.settings,
                //   color: Colors.white,
                // ),
                // const SizedBox(
                //   width: 5,
                // ),
                // const Icon(
                //   Icons.bookmark_border,
                //   color: Colors.white,
                // ),
                // const VerticalDivider(),
                // const Icon(
                //   Icons.search,
                //   color: Colors.white,
                // ),
                // const VerticalDivider(),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: Navigator.of(context).pop,
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      titleTextStyle: const TextStyle(color: Colors.white),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 800,
          height: 800,
          child: sfPdfViewer,
        ),
      ),
      // actions: widget.actions,
    );
  }

  void onSubmittedTextfield(String value) {
    final int page = int.parse(value);
    setState(() {
      pdfViewerController.jumpToPage(page);
    });
  }

  void onTapOutsideTextfield(PointerDownEvent event) {
    setState(() {
      numberPageController.text = numberPage.toString();
    });
  }

  void nextPage() {
    setState(() {
      pdfViewerController.nextPage();
    });
  }

  void previousPage() {
    setState(() {
      pdfViewerController.previousPage();
    });
  }

  void onTapZoomIn() {
    setState(() {
      pdfViewerController.zoomLevel += .5;
    });
  }

  void onTapZoomOut() {
    setState(() {
      pdfViewerController.zoomLevel -= .5;
    });
  }

  void onTapShare() async {
    if (widget.bytes != null) {
      final now = DateTime.now();
      final Directory tempDir = await getTemporaryDirectory();
      final day = now.day > 9 ? now.day : '0${now.day}';
      final month = now.month > 9 ? now.month : '0${now.month}';
      final file = File("${tempDir.path}/${day}_${month}_${now.year}_rest.pdf");
      await file.writeAsBytes(widget.bytes!.toList());
      // file.create();
      // await Printing.layoutPdf(
      //     onLayout: (PdfPageFormat format) async => pdf.save());
      Share.shareXFiles([XFile(file.path)]);
    }
  }
}

// ignore: must_be_immutable
class SfPdfViewerWidget extends StatefulWidget {
  //  ViewerPdfDialog({super.key});
  SfPdfViewerWidget.url({super.key, required this.url});
  SfPdfViewerWidget.file({super.key, required this.pdfFile});
  SfPdfViewerWidget.bytes({super.key, required this.bytes});

  String? url;
  File? pdfFile;
  Uint8List? bytes;
  final PdfViewerController pdfViewerController = PdfViewerController();

  @override
  State<SfPdfViewerWidget> createState() => _SfPdfViewerWidgetState();
}

class _SfPdfViewerWidgetState extends State<SfPdfViewerWidget> {
  final numberPageController = TextEditingController(text: '1');
  int numberPage = 1;
  int totalPages = 1000;

  Color? primaryColor = AppColors.primary;

  late SfPdfViewer sfPdfViewer;

  @override
  void initState() {
    if (widget.pdfFile != null) {
      sfPdfViewer = SfPdfViewer.file(
        widget.pdfFile!,
        controller: widget.pdfViewerController,
        maxZoomLevel: 5,
        pageLayoutMode: PdfPageLayoutMode.continuous,
        interactionMode: PdfInteractionMode.pan,
        onDocumentLoaded: (details) => setState(() {}),
        onPageChanged: (details) => setState(() {
          numberPage = details.newPageNumber;
          numberPageController.text = numberPage.toString();
          // print('==>');
          // print(widget.pdfViewerController.pageCount);
          // print(widget.pdfViewerController.pageNumber);
        }),
      );
    } else if (widget.url != null) {
      sfPdfViewer = SfPdfViewer.network(
        widget.url!,
        controller: widget.pdfViewerController,
        maxZoomLevel: 5,
        pageLayoutMode: PdfPageLayoutMode.continuous,
        interactionMode: PdfInteractionMode.pan,
        onDocumentLoaded: (details) => setState(() {}),
        onPageChanged: (details) => setState(() {
          numberPage = details.newPageNumber;
          numberPageController.text = numberPage.toString();
          // print('==>');
          // print(widget.pdfViewerController.pageCount);
          // print(widget.pdfViewerController.pageNumber);
        }),
      );
    } else {
      sfPdfViewer = SfPdfViewer.memory(
        widget.bytes!,
        controller: widget.pdfViewerController,
        maxZoomLevel: 5,
        pageLayoutMode: PdfPageLayoutMode.continuous,
        interactionMode: PdfInteractionMode.pan,
        onDocumentLoaded: (details) => setState(() {}),
        onPageChanged: (details) => setState(() {
          numberPage = details.newPageNumber;
          numberPageController.text = numberPage.toString();
          // print('==>');
          // print(widget.pdfViewerController.pageCount);
          // print(widget.pdfViewerController.pageNumber);
        }),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    numberPageController.dispose();
    widget.pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.folder_open_sharp,
                  color: Colors.white,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 40,
                        // height: 30,
                        child: TextField(
                          controller: numberPageController,
                          textAlign: TextAlign.center,
                          scrollPadding: const EdgeInsets.all(0),
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsetsDirectional.only(bottom: 15),
                          ),
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          onSubmitted: onSubmittedTextfield,
                          onTapOutside: onTapOutsideTextfield,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        )),
                    Text(
                      'de ${widget.pdfViewerController.pageCount}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: previousPage,
                      child:
                          const Icon(Icons.chevron_left, color: Colors.white),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: nextPage,
                      child:
                          const Icon(Icons.chevron_right, color: Colors.white),
                    ),
                    const VerticalDivider(),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: onTapZoomOut,
                      child: const Icon(Icons.remove_circle_outline,
                          color: Colors.white),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: onTapZoomIn,
                      child: const Icon(Icons.add_circle_outline,
                          color: Colors.white),
                    ),
                    const VerticalDivider(),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(Icons.back_hand, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                    ),
                    const VerticalDivider(),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    const VerticalDivider(),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: Navigator.of(context).pop,
                      child: Icon(
                        Icons.close,
                        color: primaryColor ?? Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: sfPdfViewer,
          ),
        ],
      ),
    );
  }

  void onSubmittedTextfield(String value) {
    final int page = int.parse(value);
    setState(() {
      widget.pdfViewerController.jumpToPage(page);
    });
  }

  void onTapOutsideTextfield(PointerDownEvent event) {
    setState(() {
      numberPageController.text = numberPage.toString();
    });
  }

  void nextPage() {
    setState(() {
      widget.pdfViewerController.nextPage();
    });
  }

  void previousPage() {
    setState(() {
      widget.pdfViewerController.previousPage();
    });
  }

  void onTapZoomIn() {
    setState(() {
      widget.pdfViewerController.zoomLevel += .5;
    });
  }

  void onTapZoomOut() {
    setState(() {
      widget.pdfViewerController.zoomLevel -= .5;
    });
  }
}

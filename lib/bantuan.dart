import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Bantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SfPdfViewer.asset('assets/bantuan.pdf',
      ),
    );
  }
}

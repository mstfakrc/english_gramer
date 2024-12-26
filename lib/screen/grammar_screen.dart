import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topics = {
      'Adverbial phrases of frequency, time and place':
          'assets/Adverbial-phrases-of-frequency-time-and-place.pdf',
      'Comparative and Superlative': 'assets/Comparatives-and-Superlative.pdf',
    };

    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 700, // specify the height
          child: PDF(
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: false,
            defaultPage: 1,
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
            },
          ).fromAsset(
            topics['Adverbial phrases of frequency, time and place']!,
          ),
        ),
      ),
    );
  }
}

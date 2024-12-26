import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/phrasal_verbs_provider.dart';

class PhrasalVerbsScreen extends StatelessWidget {
  const PhrasalVerbsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final phrasalVerbs =
        Provider.of<PhrasalVerbsProvider>(context).phrasalVerbs;

    // Veriler yükleniyor.
    if (phrasalVerbs.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<PhrasalVerbsProvider>(context, listen: false)
            .getPhrasalVerbs();
      });
      return const _LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Phrasal Verbs',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: ListView.separated(
          itemCount: phrasalVerbs.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final phrasalVerb = phrasalVerbs[index];
            return _PhrasalVerbCard(
              phrasalVerb: phrasalVerb.phrasalVerb,
              example: phrasalVerb.example,
            );
          },
        ),
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phrasal Verbs'),
        centerTitle: true,
      ),
      body: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class _PhrasalVerbCard extends StatelessWidget {
  const _PhrasalVerbCard({
    required this.phrasalVerb,
    required this.example,
    super.key,
  });

  final String phrasalVerb;
  final String example;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.blue.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TextHighlight(text: phrasalVerb),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              example,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextHighlight extends StatelessWidget {
  const _TextHighlight({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size.width * 0.045,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

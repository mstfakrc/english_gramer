import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/regular_verbs_provider.dart';

class RegularVerbsScreen extends StatelessWidget {
  const RegularVerbsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final regularVerbsProvider =
        Provider.of<RegularVerbsProvider>(context).regularVerbs;

    // Veriler yükleniyor.
    if (regularVerbsProvider.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<RegularVerbsProvider>(context, listen: false).getAllVerbs();
      });
      return const _LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Regular Verbs',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Present - Past - Past Participle',
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: regularVerbsProvider.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final verb = regularVerbsProvider[index];
                  return _VerbCard(
                    present: verb.english['present']!,
                    past: verb.english['past']!,
                    pastParticiple: verb.english['past_participle']!,
                    examples: [
                      verb.example['present']!,
                      verb.example['past']!,
                      verb.example['past_participle']!,
                    ],
                  );
                },
              ),
            ),
          ],
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
        title: const Text('Regular Verbs'),
        centerTitle: true,
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _VerbCard extends StatelessWidget {
  const _VerbCard({
    required this.present,
    required this.past,
    required this.pastParticiple,
    required this.examples,
    super.key,
  });

  final String present;
  final String past;
  final String pastParticiple;
  final List<String> examples;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.deepPurple.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TextHighlight(text: present),
                _TextHighlight(text: past),
                _TextHighlight(text: pastParticiple),
              ],
            ),
            const Divider(color: Colors.deepPurple, thickness: 1),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: examples.map((example) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '- $example',
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      color: Colors.grey[700],
                    ),
                  ),
                );
              }).toList(),
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
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size.width * 0.045,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/irregular_verbs_provider.dart';

class IrregularVerbScreen extends StatelessWidget {
  const IrregularVerbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final irregularVerbsProvider =
        Provider.of<IrregularVerbsProvider>(context).irregularVerbs;

    if (irregularVerbsProvider.isEmpty) {
      Provider.of<IrregularVerbsProvider>(context).getAllVerbs();
      return const _LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Irregular Verbs',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                  color: Colors.red[900],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: irregularVerbsProvider.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final verb = irregularVerbsProvider[index];
                  return _VerbTile(
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
        title: const Text('Irregular Verbs'),
        centerTitle: true,
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _VerbTile extends StatelessWidget {
  const _VerbTile({
    required this.present,
    required this.past,
    required this.pastParticiple,
    required this.examples,
  });

  final String present;
  final String past;
  final String pastParticiple;
  final List<String> examples;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _TextDecoration(text: present),
                _TextDecoration(text: past),
                _TextDecoration(text: pastParticiple),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: examples.map((example) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    example,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
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

class _TextDecoration extends StatelessWidget {
  const _TextDecoration({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.04,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}

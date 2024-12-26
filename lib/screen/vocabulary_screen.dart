import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final vocabulary = Provider.of<VocabularyProvider>(context).vocabularyList;

    // Veriler yükleniyor.
    if (vocabulary.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<VocabularyProvider>(context, listen: false).getVocabulary();
      });
      return const _LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vocabulary',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: ListView.separated(
          itemCount: vocabulary.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
          itemBuilder: (context, index) {
            final vocab = vocabulary[index];
            return _VocabularyCard(
              id: vocab.id,
              word: vocab.word,
              example: vocab.example,
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
        title: const Text('Vocabulary'),
        centerTitle: true,
      ),
      body: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class _VocabularyCard extends StatelessWidget {
  const _VocabularyCard({
    required this.id,
    required this.word,
    required this.example,
    super.key,
  });

  final int id;
  final String word;
  final String example;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$id. $word',
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              example,
              style: TextStyle(
                fontSize: size.width * 0.045,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

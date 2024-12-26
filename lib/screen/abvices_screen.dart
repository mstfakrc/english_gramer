import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class AdvicesScreen extends StatelessWidget {
  const AdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final abvices = Provider.of<AdvicesProvider>(context).abvices;
    if (abvices.isEmpty) {
      Provider.of<AdvicesProvider>(context).getAbvices();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tips',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: abvices.length,
        itemBuilder: (context, index) {
          final abvice = abvices[index];
          return ListTile(
            title: _TextDecoration(
              text: '${index + 1}. ${abvice.tip}', color: Colors.brown[900],
            ),
            subtitle: _TextDecoration(text: abvice.detail),
          );
        },
      ),
    );
  }
}

class _TextDecoration extends StatelessWidget {
  const _TextDecoration({
    required this.text, this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

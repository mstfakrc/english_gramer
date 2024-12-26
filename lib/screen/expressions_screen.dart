import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class ExpressionsScreen extends StatelessWidget {
  const ExpressionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expressions = Provider.of<ExpressionsProvider>(context).expressions;
    if (expressions.isEmpty) {
      Provider.of<ExpressionsProvider>(context).getExpressions();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Expressions',
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
        title: const Text('Expressions',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: expressions.length,
        itemBuilder: (context, index) {
          final expression = expressions[index];
          return ListTile(
            title: _TextDecoration(
              text: '${expression.id}. ${expression.expression}', color: Colors.orange[900],
            ),
            subtitle: _TextDecoration(text: expression.meaning),
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

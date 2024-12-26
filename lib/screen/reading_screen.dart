import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reading_provider.dart';
import '../widgets/card_text.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final readings = Provider.of<ReadingProvider>(context).readings;

    // Veriler yükleniyor.
    if (readings.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<ReadingProvider>(context, listen: false).getReadings();
      });
      return const _LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Topics',
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
          itemCount: readings.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
          itemBuilder: (context, index) {
            final read = readings[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardText(
                      id: read.id,
                    ),
                  ),
                );
              },
              child: _ReadingCard(
                title: read.title,
              ),
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
        title: const Text('Topics'),
        centerTitle: true,
      ),
      body: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class _ReadingCard extends StatelessWidget {
  const _ReadingCard({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: size.width * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }
}

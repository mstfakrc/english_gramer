import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/regular_verbs_provider.dart';
import 'screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fiilleri yükleme
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RegularVerbsProvider>(context, listen: false).getAllVerbs();
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.deepPurple,
        title: const _CustomText(
          text: 'LEARN ENGLISH',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const _CustomText(
              text: 'What do you want to learn?',
              fontSize: 25,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  children: [
                    _NavigationCard(
                      text: 'Regular Verbs',
                      gradientColors: [Colors.purple, Colors.deepPurple],
                      icon: Icons.check_circle_outline,
                      destination: const RegularVerbsScreen(),
                    ),
                    _NavigationCard(
                      text: 'Irregular Verbs',
                      gradientColors: [Colors.redAccent, Colors.orange],
                      icon: Icons.flash_on_outlined,
                      destination: const IrregularVerbScreen(),
                    ),
                    _NavigationCard(
                      text: 'Phrasal Verbs',
                      gradientColors: [Colors.green, Colors.teal],
                      icon: Icons.swap_vert,
                      destination: const PhrasalVerbsScreen(),
                    ),
                    _NavigationCard(
                      text: 'Vocabulary',
                      gradientColors: [Colors.yellow, Colors.amber],
                      icon: Icons.book_outlined,
                      destination: const VocabularyScreen(),
                    ),
                    
                    _NavigationCard(
                      text: 'Reading',
                      gradientColors: [Colors.blueAccent, Colors.indigo],
                      icon: Icons.chrome_reader_mode_outlined,
                      destination: const ReadingScreen(),
                    ),
                    _NavigationCard(
                      text: 'Tips to Learn',
                      gradientColors: [Colors.brown, Colors.brown.shade400],
                      icon: Icons.lightbulb_outline,
                      destination: const AdvicesScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationCard extends StatelessWidget {
  const _NavigationCard({
    super.key,
    required this.text,
    required this.gradientColors,
    required this.icon,
    required this.destination,
  });

  final String text;
  final List<Color> gradientColors;
  final IconData icon;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.6),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              _CustomText(
                text: text,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  const _CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page/app.dart';
import 'providers/providers.dart';
import 'share_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegularVerbsProvider()),
        ChangeNotifierProvider(create: (context) => IrregularVerbsProvider()),
        ChangeNotifierProvider(create: (context) => PhrasalVerbsProvider()),
        ChangeNotifierProvider(create: (context) => VocabularyProvider()),
        ChangeNotifierProvider(create: (context) => AdvicesProvider()),
        ChangeNotifierProvider(create: (context) => ExpressionsProvider()),
        ChangeNotifierProvider(create: (context) => ReadingProvider()),
        ChangeNotifierProvider(create: (context) => PageViewProvider(
          isAllPagesViewed: Preferences.allPagesViewed)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learning english app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: App(),
      ),
    );
  }
}

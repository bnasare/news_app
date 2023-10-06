import 'package:flutter/material.dart';
import 'package:news_app/presentation/pages/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme.copyWith(
          background: Colors.grey[300],
          secondary: Colors.pink[200],
          primary: Colors.black,
          tertiary: Colors.grey.withOpacity(0.8),
          onPrimary: const Color.fromARGB(255, 43, 46, 63),
          onSecondary: Colors.white,
        );

    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: colorScheme.primary,
        scaffoldBackgroundColor: colorScheme.surface,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: colorScheme.onBackground,
              displayColor: colorScheme.onBackground,
            ),
        colorScheme: colorScheme,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

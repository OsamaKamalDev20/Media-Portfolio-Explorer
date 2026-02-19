import 'package:firebase_projects/Media%20Portfolio%20Explorer/provider/media_provider.dart';
import 'package:firebase_projects/Media%20Portfolio%20Explorer/ui/screens/media_portfolio_screen.dart';
import 'package:firebase_projects/Technical%20Test%202/Task%201/counter_provider.dart';
import 'package:firebase_projects/Technical%20Text%201/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => CounterProviderOne()),
        ChangeNotifierProvider(create: (_) => MediaProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.white,
          toolbarHeight: 80,
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const MediaPortfolioScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multiversion_holy_bible/welcomepage.dart';
import 'package:multiversion_holy_bible/PagesFiles/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiversion_holy_bible/PagesFiles/BibleVideoPlayer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) =>  WelcomePage(),
        // '/home': (context) => const MyHomePage(),
      },
      title: 'MultiVersion Holy Bible',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.acmeTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart'
    as AppColors;
import 'package:multiversion_holy_bible/PagesFiles/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isLoading = false; // Track loading state

  Future<void> _simulateLoading() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });
    await Future.delayed(const Duration(seconds: 2)); // Simulate 5-second delay
    setState(() {
      _isLoading = false; // Hide loading indicator
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _simulateLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MultiVersion Holy Bible',
                style: GoogleFonts.acme(
                    textStyle: TextStyle(
                  fontSize: 30,
                  color: AppColors.primaryColor,
                  letterSpacing: 1.0,
                ))),
            Image.asset(
              'assets/logo.png',
              width: 160,
              height: 160,
            ),
            const SizedBox(
              height: 200,
            ),
            _isLoading // Conditionally show loading indicator
                ? const CircularProgressIndicator()
                : Container(),
          ],
        ),
      ),
    );
  }
}

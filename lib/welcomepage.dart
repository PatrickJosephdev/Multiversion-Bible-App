import 'package:flutter/material.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart' as AppColors;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'MultiVersion Holy Bible',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
            ),
            Container(
                  child: Image.asset(
                      'logo.png',
                      width: 160,
                      height: 160,
                  ),
                ),
            SizedBox(height: 200,),
            CircularProgressIndicator(),
          ],
        ),
      ),


    );
  }
}

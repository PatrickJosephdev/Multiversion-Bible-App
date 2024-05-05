import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigationbar.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart' as AppColors;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'BiblePage.dart';
import 'VideoPage.dart';
import 'SettingPage.dart';
import 'Home.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int myIndex = 0;

  List<Widget> screenList = const [
    Home(),
    BiblePage(),
    VideoPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Body Show the Four Pages in the List screenList
      body:screenList[myIndex],

      //BottomNavigationBar by Google Navigation
      bottomNavigationBar: Padding(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: GNav(
        color: AppColors.primaryColor,
        activeColor: AppColors.background,
        tabBackgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.all(15),
        onTabChange: (index){
          setState(() {
            myIndex = index;
          });
        },
        gap: 8,

          tabs: [
            GButton(
                icon: Icons.home_outlined,
                text: 'Home',
            ),
            GButton(
                icon: Icons.receipt_outlined,
                text: 'Bible',
            ),
            GButton(
                icon: Icons.play_circle_outline,
                text: 'Videos',
            ),
            GButton(
                icon: Icons.settings_outlined,
                text: 'Setting',
            ),
          ],
      ),
      ),
    );
  }
}

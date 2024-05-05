import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigationbar.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart' as AppColors;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'BiblePage.dart';
// import 'VideoPage.dart';
// import 'SettingPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          'Good Day!',
          style: GoogleFonts.acme(
            textStyle: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        actions: [ Container(
          margin: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(
                Icons.notification_add_outlined
            ),
            onPressed: () {  },
          ),
        ),
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network('https://th.bing.com/th/id/OIP.1ygr11cE-4ZUwUaiDouacgHaHa?rs=1&pid=ImgDetMain'),
            ),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 15),
                  const Text(
                    'Verse of the Day',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Lorem ipsum Lorem ipsumLorem ipsum Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),


    );
  }
}





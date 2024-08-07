import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart'
    as AppColors;

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Settings',
    //       style: TextStyle(
    //         color: AppColors.background,
    //         fontSize: 20,
    //       ),
    //     ),
    //   ),
    //   body: ListView(
    //     padding: const EdgeInsets.all(20),
    //     scrollDirection: Axis.vertical,
    //     children: [
    //       Text('Favourites',
    //           style: TextStyle(
    //             color: AppColors.background,
    //             fontSize: 15,
    //           )),
    //       Text('About',
    //           style: TextStyle(
    //             color: AppColors.background,
    //             fontSize: 15,
    //           )),
    //       Text('Share App',
    //           style: TextStyle(
    //             color: AppColors.background,
    //             fontSize: 15,
    //           ))
    //     ],
    //   ),
    // );

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 30,
              ),
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.vertical,
              children: [
                Text(
                  'Favourites',
                  style: TextStyle(fontSize: 25, color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 25, color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Feedback',
                  style: TextStyle(fontSize: 25, color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'About App',
                  style: TextStyle(fontSize: 25, color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Share App',
                  style: TextStyle(fontSize: 25, color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Credits',
                  style: TextStyle(fontSize: 25, color: AppColors.primaryColor),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class BiblePage extends StatefulWidget {
  const BiblePage({super.key});

  @override
  State<BiblePage> createState() => _BiblePageState();
}

class _BiblePageState extends State<BiblePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bible Page'),
    );
  }
}

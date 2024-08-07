import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:multiversion_holy_bible/model/BibleVerse.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart'
    as AppColors;
import 'ChapterPage.dart';

class BiblePage extends StatefulWidget {
  const BiblePage({super.key});

  @override
  State<BiblePage> createState() => _BiblePageState();
}

class _BiblePageState extends State<BiblePage> {
  // list to hold the Names of Books in the Bible
  List<String> bookNames = [];
  Set<String> setBookName = {};

  List<String> versionOptions = [
    'American Standard Version',
    'Bishop Version',
    'Coverdale Version',
    'Geneva Version',
    'King James Version',
    'New English Translation Version',
    'Tyndale Version',
    'World English Version'
  ];
  String selectedValue = 'King James Version';
  String jsonValue = 'kjv';

  // a future function that takes a String which chooses the version of
  Future loadBibleData(String version) async {
    // to load data from json file
    final bibleJsonString =
        await rootBundle.loadString('assets/json/$version.json');
    final jsonData = await json.decode(bibleJsonString);

    //to check if the data that has been decoded contain key = verses
    if (jsonData.containsKey('verses')) {
      final booksData = jsonData['verses'];

      // jsonData['verses'] is a List in the json file
      if (booksData is List) {
        // this is to loop the booksData
        for (var VerseEntry in booksData) {
          // this is to Check if VerseEntry in for loop is a map and it contains key 'book_name'
          if (VerseEntry is Map && VerseEntry.containsKey('book_name')) {
            //if the condition is true then the setBookname is updated with all the books in the bible
            final bookname = VerseEntry['book_name'];

            setBookName.add(bookname);
            //then the setBookname is converted to list because we can't access individual file of Set
            bookNames = setBookName.toList();
          }
        }
      }
    }
    // print(bookNames);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadBibleData('kjv');

    setState(() {
      loadBibleData('kjv');

      // print(jsonValue);

      if (selectedValue == 'American Standard Version') {
        jsonValue = 'asv';
      } else if (selectedValue == 'Bishop Version') {
        jsonValue = 'bishop';
      } else if (selectedValue == 'Coverdale Version') {
        jsonValue = 'coverdale';
      } else if (selectedValue == 'Geneva Version') {
        jsonValue = 'geneva';
      } else if (selectedValue == 'King James Version') {
        jsonValue = 'kjv';
      } else if (selectedValue == 'New English Translation Version') {
        jsonValue = 'net';
      } else if (selectedValue == 'Tyndale Version') {
        jsonValue = 'tyndale';
      } else {
        jsonValue = 'web';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text(
                    'Bible',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bible Version: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          // Icon(
                          //   Icons.list,
                          //   size: 16,
                          //   color: Colors.yellow,
                          // ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Select Version',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: versionOptions
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value!;
                          // print(selectedValue);
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            width: 3,
                            color: AppColors.primaryColor,
                          ),
                          color: Colors.white,
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 20,
                        iconEnabledColor: Colors.deepPurpleAccent,
                        iconDisabledColor: Colors.black,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 350,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                          // border: Border.all(
                          //   width: 3,
                          //   color: AppColors.primaryColor,
                          // ),
                        ),
                        offset: const Offset(0, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder<void>(
                  future: loadBibleData(jsonValue),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns in the grid
                          mainAxisSpacing: 10.0, // Spacing between rows
                          crossAxisSpacing: 10.0, // Spacing between columns
                        ),
                        itemCount: bookNames.length,
                        itemBuilder: (context, index) {
                          print(bookNames[7]);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChapterPage(
                                          bookName: bookNames[index],
                                          version: selectedValue)));
                              // print(selectedValue);
                              // print(bookNames[index]);
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              width: 300,
                              height: 300,
                              // color: AppColors.primaryColor,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // border: Border.all(
                                //   width: 3,
                                color: AppColors.primaryColor,
                                // ),
                              ), // Add background color for better visibility
                              child: Center(
                                  child: Text(
                                bookNames[index],
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width > 600
                                          ? 30.0
                                          : 15.0,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

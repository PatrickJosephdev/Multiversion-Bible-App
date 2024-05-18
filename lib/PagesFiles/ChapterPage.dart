import 'dart:convert';
// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart' as AppColors;


class ChapterPage extends StatefulWidget {

   String version;
   String bookName;

  ChapterPage(
      {
        super.key,
        required this.bookName,
        required this.version,
      });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {

  List Chapter = [];
  List Verses  = [];
  Set chapterSet = {};
  String versionValue = 'kjv';
  int selectedIndex = -1;
  int selectedChapterIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.version == 'American Standard Version'){
      versionValue = 'asv';
    }
    else if (widget.version == 'Bishop Version'){
      versionValue = 'bishop';
    }
    else if (widget.version == 'Coverdale Version'){
      versionValue = 'coverdale';
    }
    else if (widget.version == 'Geneva Version'){
      versionValue = 'geneva';
    }
    else if (widget.version == 'King James Version'){
      versionValue = 'kjv';
    }
    else if (widget.version == 'New English Translation Version'){
      versionValue = 'net';
    }
    else if (widget.version == 'Tyndale Version'){
      versionValue = 'tyndale';
    }
    else {
      versionValue = 'web';
    }
    setState(() {



    });

    loadBibleData(versionValue, 1);

  }


  Future loadBibleData (String version, int chapterValue) async {


    // to load data from json file
    final bibleJsonString = await rootBundle.loadString('json/$version.json');
    final jsonData = await json.decode(bibleJsonString);

    //to check if the data that has been decoded contain key = verses
    if (jsonData.containsKey('verses')){
      final booksData = jsonData['verses'];

      // jsonData['verses'] is a List in the json file
      if (booksData is List){

        // this is to loop the booksData
        for( var VerseEntry in booksData){
          // this is to Check if VerseEntry in for loop is a map and it contains key 'book_name'
          if (VerseEntry is Map && VerseEntry.containsKey('book_name') && VerseEntry.containsKey('chapter')){

            if (VerseEntry['book_name'] == widget.bookName){
              //if the condition is true then the setBookname is updated with all the books in the bible
              final bookname = VerseEntry['chapter'];


              chapterSet.add(bookname);

              //then the setBookname is converted to list because we can't access individual file of Set
              Chapter = chapterSet.toList();

               if(VerseEntry['book_name'] == widget.bookName && VerseEntry['chapter'] == selectedChapterIndex + 1) {
                 final chapterVerses = VerseEntry['text'].split('/n');
                 Verses.add(chapterVerses);


              }

            }




          }
        }

      }

    }




  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.bookName),
        actions: [
          Text(widget.version),
          const SizedBox(width: 30,),
        ],
      ),
      body: SafeArea(
        child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Expanded(
                    child: FutureBuilder<void>(
                      future: loadBibleData(versionValue,selectedChapterIndex),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          print(Chapter);
                          return Chapter.isEmpty ?
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('This Book is not Avialable for this Bible Version'),
                            ],
                          ) :
                          ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Chapter.length,
                            itemBuilder: (context, index) {
                              int chapint = index + 1;
                              String chapText = (chapint).toString();
                              return GestureDetector(
                                onTap: (){
                                    setState(() {
                                      selectedIndex = index;
                                      selectedChapterIndex = index;
                                      Verses.clear();
                                      loadBibleData(versionValue, selectedChapterIndex);
                                      print(selectedChapterIndex);

                                    });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.all(3),
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index ? AppColors.primaryColor: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 2,
                                    color: AppColors.primaryColor,
                                    ),
                                  ),// Add background color for better visibility
                                  child: Center(child: Text(
                                    'Chapter: $chapText',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width > 600 ? 20.0 : 10.0,
                                      color: selectedIndex == index ? Colors.white : AppColors.primaryColor ,
                                      // overflow: TextOverflow.ellipsis ,
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
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: Verses.length,
                      itemBuilder: (context, index) {
                        int chapint = index + 1;
                        String chapText = (chapint).toString();
                        // print (Verses);
                        return GestureDetector(
                          // onTap: (){
                          //   setState(() {
                          //     selectedIndex = index;
                          //   });
                          // },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.9,
                            // height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(
                              //   width: 2,
                              //   color: AppColors.primaryColor,
                              // ),
                            ),// Add background color for better visibility
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Verse: $chapText',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width > 600 ? 40.0 : 20.0,
                                    color: AppColors.primaryColor ,
                                    // // overflow: TextOverflow.ellipsis ,
                                  ),
                                ),
                                Text(
                                  Verses[index][0],
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width > 600 ? 40.0 : 20.0,
                                    // color: selectedIndex == index ? Colors.white : AppColors.primaryColor ,
                                    // // overflow: TextOverflow.ellipsis ,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                  ),
                ),
              ],
            ),
        ),

      ),
    );
  }
}

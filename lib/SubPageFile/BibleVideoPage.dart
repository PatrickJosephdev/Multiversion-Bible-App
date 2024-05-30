import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart' as AppColors;
import 'package:multiversion_holy_bible/PagesFiles/BibleVideoPlayer.dart';





class BibleVideoPage extends StatefulWidget {
  String searchString;

  BibleVideoPage(
      {
        super.key,
        required this.searchString,
      });


  @override
  State<BibleVideoPage> createState() => _BibleVideoPageState();
}

class _BibleVideoPageState extends State<BibleVideoPage> {
  String query = '';
  final TextEditingController _controller =
  TextEditingController(text: 'Search More here');
  String initialSearchString = '';


  static String key = "AIzaSyCn19kYeNQckHRpt0yCn1U51kvblcdCutI";
  // static String key = "AIzaSyApQHOT3I9sr_M4bXtCtBUaXmSiWOWB9X0";

  YoutubeAPI youtube = YoutubeAPI(key);
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
     query = widget.searchString;
    videoResult = await youtube.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialSearchString = widget.searchString;
    callAPI();
    print('hello');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
            '${initialSearchString}',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 3,
                color: AppColors.primaryColor,
              )
            ),
            child: AnimatedSearchBar(
                    label: 'Search More on ${widget.searchString}',
                    controller: _controller,
                    labelStyle: const TextStyle(fontSize: 16),
                    searchStyle: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.done,
                    searchDecoration: const InputDecoration(
                      hintText: 'Search More Here',
                      alignLabelWithHint: true,
                      fillColor: Colors.black,
                      focusColor: Colors.grey,
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      debugPrint('value on Change');
                      setState(() {
                        // searchText = value;
                      });
                    },
                    onFieldSubmitted: (value) {
                      debugPrint('value on Field Submitted');
                      setState(() {
                        widget.searchString = _controller.text;
                      });
                      callAPI();

                    },
              searchIcon: const Icon(
                Icons.search,
                key: ValueKey('Search'),
              ),

                    ),

          ),
          IconButton(
            icon: Icon(Icons.search), // Replace with your desired icon
            onPressed: () {
              // Trigger search functionality here
              setState(() {
                widget.searchString = _controller.text; // Get text from controller
              });
              callAPI();
            },
          ),
          Expanded(
            child: ListView(
              children: videoResult.map<Widget>(listItem).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(YouTubeVideo video) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PlayVideoFromNetwork(videoUrl: video.url)));
      },
      child: Card(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          padding: EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.network(
                  video.thumbnail.small.url ?? '',
                  width: 120.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      video.title,
                      softWrap: true,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        video.channelTitle,
                        softWrap: true,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      video.url,
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}














// class BibleVideoPage extends StatefulWidget {
//   String searchString;
//
//   BibleVideoPage(
//       {
//         super.key,
//         required this.searchString,
//       });
//
//   @override
//   State<BibleVideoPage> createState() => _BibleVideoPageState();
// }
//
// class _BibleVideoPageState extends State<BibleVideoPage> {
//   final TextEditingController _controller =
//   TextEditingController(text: 'Initial Text');
//
//
//   static String key = "AIzaSyCn19kYeNQckHRpt0yCn1U51kvblcdCutI";
//
//   YoutubeAPI youtube = YoutubeAPI(key);
//   List<YouTubeVideo> videoResult = [];
//
//
//   Future<void> callAPI() async {
//     String query;
//     query = widget.searchString;
//     videoResult = await youtube.search(
//       query,
//       order: 'relevance',
//       videoDuration: 'any',
//     );
//     videoResult = await youtube.nextPage();
//
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     callAPI();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       appBar: AppBar(
//         title: Text(widget.searchString),
//         actions: [
//           Row(
//             children: [
//               // AnimatedSearchBar(
//               //     label: 'Search More on ${widget.searchString}',
//               //     controller: _controller,
//               //     labelStyle: const TextStyle(fontSize: 16),
//               //     searchStyle: const TextStyle(color: Colors.white),
//               //     cursorColor: Colors.white,
//               //     textInputAction: TextInputAction.done,
//               //     searchDecoration: const InputDecoration(
//               //       hintText: 'Search More Here',
//               //       alignLabelWithHint: true,
//               //       fillColor: Colors.black,
//               //       focusColor: Colors.white,
//               //       hintStyle: TextStyle(color: Colors.white70),
//               //       border: InputBorder.none,
//               //     ),
//               //     onChanged: (value) {
//               //       debugPrint('value on Change');
//               //       setState(() {
//               //         // searchText = value;
//               //       });
//               //     },
//               //     onFieldSubmitted: (value) {
//               //       debugPrint('value on Field Submitted');
//               //       setState(() {
//               //         widget.searchString = value;
//               //       });
//               //     }),
//             ],
//           ),
//         ],
//       ),
//       body: ListView(
//         children: videoResult.map<Widget>(listItem).toList(),
//       ),
//     );
//   }
//
//   Widget listItem(YouTubeVideo video) {
//     return Card(
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 7.0),
//         padding: EdgeInsets.all(12.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(right: 20.0),
//               child: Image.network(
//                 video.thumbnail.small.url ?? '',
//                 width: 120.0,
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     video.title,
//                     softWrap: true,
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 3.0),
//                     child: Text(
//                       video.channelTitle,
//                       softWrap: true,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Text(
//                     video.url,
//                     softWrap: true,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


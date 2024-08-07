import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:multiversion_holy_bible/color file/app_colors.dart'
    as AppColors;
import 'package:multiversion_holy_bible/SubPageFile/BibleVideoPage.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<String> picString = [
    'assets/history.png',
    'assets/preach.png',
    'assets/q&a.png',
    'assets/theo.png',
    'assets/debate.png',
    'assets/lifestyle.png',
    'assets/mission.png',
    'assets/movie.png'
  ];

  List<String> videoOptions = [
    'Bible History',
    'Sermons',
    'Bible Questions and Answer',
    'Theological Discussions on the Bible',
    'Bible Debates',
    'Christian LifeStyle',
    'Missionary Stories',
    'Christian Movies',
  ];

  @override
  void initState() {
    super.initState();
    // callAPI();
    print(videoOptions[2]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Videos',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            // Wrap GridView with Expanded for proper sizing
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 10.0, // Spacing between rows
                crossAxisSpacing: 10.0, // Spacing between columns
              ),
              itemCount: videoOptions.length,
              itemBuilder: (context, index) {
                print(
                    'Image path: ${AssetImage('assets/${picString[index]}').toString()}');
                print(picString[index]);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BibleVideoPage(
                          searchString: videoOptions[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(picString[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.black.withOpacity(
                            0.5), // Semi-transparent black background
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          videoOptions[index],
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                            // White text
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}




// class VideoPage extends StatefulWidget {
//   const VideoPage({super.key});
//
//   @override
//   State<VideoPage> createState() => _VideoPageState();
// }
//
// class _VideoPageState extends State<VideoPage> {
//   static String key = "AIzaSyCn19kYeNQckHRpt0yCn1U51kvblcdCutI";
//
//   YoutubeAPI youtube = YoutubeAPI(key);
//   List<YouTubeVideo> videoResult = [];
//
//   Future<void> callAPI() async {
//     String query = "Flutter GraphQL";
//     videoResult = await youtube.search(
//       query,
//       order: 'relevance',
//       videoDuration: 'any',
//     );
//     videoResult = await youtube.nextPage();
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     callAPI();
//     print('hello');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       appBar: AppBar(
//         title: Text('Youtube API'),
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
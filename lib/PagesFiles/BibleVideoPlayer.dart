import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

class PlayVideoFromNetwork extends StatefulWidget {
  String videoUrl;

  PlayVideoFromNetwork(
      {
        super.key,
        required this.videoUrl,
      });

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;
  bool isBuffering = false;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(
        widget.videoUrl,
      ),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
        isLooping: false,
        videoQualityPriority: [360],
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  void _onBuffering(bool buffering) {
    setState(() {
      isBuffering = buffering;
    });
  }

  Widget _buildProgressBar() {
    return Center(
      child: CircularProgressIndicator(
        value: null, // Indeterminate progress for buffering
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PodVideoPlayer(
            controller: controller,
          ),
          isBuffering ? _buildProgressBar() : SizedBox(), // Show progress bar only when buffering
        ],
      ),
    );
  }
}

















































// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// // class VideoPlayer extends StatefulWidget {
// //   const VideoPlayer({super.key});
// //
// //   @override
// //   State<VideoPlayer> createState() => _VideoPlayerState();
// // }
// //
// // class _VideoPlayerState extends State<            children: [
// // //                   // Some other widgets can be here, like a title or description
// // //                   player,
// // //                 ],
// // //               );
// // //             },
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }VideoPlayer> {
// //
// //   late YoutubePlayerController _ytController;
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     _ytController = YoutubePlayerController(
// //         initialVideoId: 'BBAyRBTfsOU',
// //       flags: YoutubePlayerFlags(
// //         autoPlay: true,
// //         mute: false,
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _ytController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Center(
// //           child: YoutubePlayerBuilder(
// //             player: YoutubePlayer(
// //               controller: _ytController,
// //               showVideoProgressIndicator: true,
// //             ),
// //             builder: (context, player) {
// //               return Column(
// //
//

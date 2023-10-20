import 'package:flutter/material.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerIframe extends StatefulWidget {
  const YoutubePlayerIframe({super.key});

  @override
  State<YoutubePlayerIframe> createState() => _YoutubePlayerIframeState();
}

class _YoutubePlayerIframeState extends State<YoutubePlayerIframe> {
  late YoutubePlayerController _playerController;

  var autoPlay = true;

  @override
  void initState() {
    _playerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        strictRelatedVideos: true,
        loop: false,
        enableJavaScript: true,
        color: 'red',
      ),
    );
    _playerController.loadVideoById(videoId: '-5bIO0GukLI');
    _playerController.stopVideo();
    // _playerController.setSize(
    //   1000,
    //   1000,
    // );

    super.initState();
  }

  @override
  void dispose() {
    _playerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          child: Text(
            'Youtube Player Using Iframe',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          child: YoutubePlayerControllerProvider(
            controller: _playerController,
            child: YoutubePlayer(
              aspectRatio: 16 / 9,
              controller: _playerController,
              enableFullScreenOnVerticalDrag: true,
            ),
          ),
        ),
      ],
    );
  }
}

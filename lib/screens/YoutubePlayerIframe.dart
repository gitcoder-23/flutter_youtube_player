import 'package:flutter/material.dart';

class YoutubePlayerIframe extends StatefulWidget {
  const YoutubePlayerIframe({super.key});

  @override
  State<YoutubePlayerIframe> createState() => _YoutubePlayerIframeState();
}

class _YoutubePlayerIframeState extends State<YoutubePlayerIframe> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: Text(
            'Youtube Player Using Iframe',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

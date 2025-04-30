import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoAnimation extends StatefulWidget {
  const VideoAnimation({super.key});

  @override
  _VideoAnimationState createState() => _VideoAnimationState();
}

class _VideoAnimationState extends State<VideoAnimation> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller
    _controller = VideoPlayerController.asset('assets/video/chopnow_logo.mp4')
      ..initialize().then((_) {
        // Ensure the video starts playing and loops
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? ClipRRect(
              borderRadius: BorderRadius.circular(50.r), // Apply border radius here
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
          : const CircularProgressIndicator(), // Show a loading indicator until the video is ready
    );
  }
}

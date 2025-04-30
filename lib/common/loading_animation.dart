import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
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
          ? Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
                 // Set the background color to red
                borderRadius: BorderRadius.circular(50.r), // Border radius for rounding corners
              ),
            
             
             
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: FittedBox(

                  fit: BoxFit.cover, // Adjust this to control how the video fits
                  child: SizedBox(
                    width: 400.w,//_controller.value.size.width,
                    height: 400.h,//_controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            )
          : Container(), // Show a loading indicator until the video is ready
    );
  }
}

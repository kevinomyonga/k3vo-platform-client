import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class K3voVideoPlayer extends StatefulWidget {
  const K3voVideoPlayer({
    required this.source,
    super.key,
    this.isAsset = false,
    this.autoPlay = false,
    this.volume = 0.0,
    this.loop = false,
    this.showControls = false,
    this.boxFit = BoxFit.contain,
  });

  /// URL or asset path of the video
  final String source;

  /// If true, treat [source] as a local asset; otherwise, it will be treated
  /// as a network URL
  final bool isAsset;

  final bool autoPlay;

  /// The volume of the video.
  final double volume;

  /// Whether the video should loop.
  final bool loop;

  final bool showControls;

  /// The fit property for the FittedBox.
  final BoxFit boxFit;

  @override
  State<K3voVideoPlayer> createState() => _K3voVideoPlayerState();
}

class _K3voVideoPlayerState extends State<K3voVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller = widget.isAsset
        ? VideoPlayerController.asset(widget.source)
        : VideoPlayerController.networkUrl(Uri.parse(widget.source));

    _controller
      ..setVolume(widget.volume)
      ..setLooping(widget.loop)
      ..initialize().then((_) {
        if (widget.autoPlay) _controller.play();
        setState(() => _isInitialized = true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildControls() {
    return IconButton(
      icon: Icon(
        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
        size: 32,
      ),
      onPressed: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        // AspectRatio(
        //   aspectRatio: _controller.value.aspectRatio,
        //   child: VideoPlayer(_controller),
        // ),
        SizedBox.expand(
          child: FittedBox(
            fit: widget.boxFit,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        if (widget.showControls) _buildControls(),
      ],
    );
  }
}

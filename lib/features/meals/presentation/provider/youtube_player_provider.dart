import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerProvider extends ChangeNotifier {
  YoutubePlayerController? _controller;
  bool _isReady = false;
  bool _isPlaying = false;
  String? _error;

  YoutubePlayerController? get controller => _controller;

  bool get isReady => _isReady;

  bool get isPlaying => _isPlaying;

  String? get error => _error;

  void initialize(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId == null) {
      _error = "Invalid YouTube URL";
      notifyListeners();
      return;
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(_onPlayerStateChanged);

    notifyListeners();
  }

  void _onPlayerStateChanged() {
    if (_controller == null) return;

    _isReady = _controller!.value.isReady;
    _isPlaying = _controller!.value.isPlaying;

    notifyListeners();
  }

  void togglePlayPause() {
    if (_controller == null || !_isReady) return;

    if (_isPlaying) {
      _controller!.pause();
    } else {
      _controller!.play();
    }

    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void disposeController() {
    _controller?.dispose();
    _controller = null;
    _isReady = false;
    _isPlaying = false;
    _error = null;
    if (_controller!.value.isPlaying) {
      _controller!.pause();
    }
    notifyListeners();
  }
}

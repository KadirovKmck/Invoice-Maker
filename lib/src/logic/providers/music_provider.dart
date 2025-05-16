import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicProvider with ChangeNotifier, WidgetsBindingObserver {
  bool isMusicPlaying = true;
  final AudioPlayer _player = AudioPlayer();

  MusicProvider() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadMusicSettings();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!isMusicPlaying) return;
    if (state == AppLifecycleState.paused) {
      _pauseMusic();
    } else if (state == AppLifecycleState.resumed) {
      // _playMusic();
      _pauseMusic();
    }
  }

  Future<void> loadMusicSettings() async {
    final prefs = await SharedPreferences.getInstance();
    isMusicPlaying = prefs.getBool('isMusicPlaying') ?? true;
    if (isMusicPlaying) {
      // await _playMusic();
      await _pauseMusic();
    }
    notifyListeners();
  }

  Future<void> toggleMusic() async {
    isMusicPlaying = !isMusicPlaying;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMusicPlaying', isMusicPlaying);

    if (isMusicPlaying) {
      // await _playMusic();
      await _pauseMusic();
    } else {
      await _pauseMusic();
    }
    notifyListeners();
  }

  Future<void> _playMusic() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.setVolume(1.0);
    await _player.play(AssetSource('audio/happy.mp3'));
  }

  Future<void> _pauseMusic() async {
    await _player.pause();
  }

  Future<void> stopMusic() async {
    await _player.stop();
  }
}

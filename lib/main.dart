import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_maker/src/app/app.dart';
import 'package:invoice_maker/src/logic/providers/music_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  final musicrovider = MusicProvider();
  await musicrovider.loadMusicSettings();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => musicrovider)],
      child: const App(),
    ),
  );
}

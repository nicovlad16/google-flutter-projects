import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Phrases',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Basic Phrases'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<AudioTranslation> audioTranslations = audioTranslationsList;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  AudioTranslation _getItem(int index) {
    return audioTranslations[index ~/ 2];
  }

  static bool _isFirstColumn(int index) {
    return index % 2 == 0;
  }

  void _playAudio(String assetPath) {
    audioPlayer.stop();
    audioPlayer.open(Audio(assetPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        itemCount: audioTranslations.length * 2,
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0, childAspectRatio: 1.0),
        itemBuilder: (BuildContext context, int index) {
          return RaisedButton(
            onPressed: () {
              _isFirstColumn(index)
                  ? _playAudio(_getItem(index).romanianAudio)
                  : _playAudio(_getItem(index).translationAudio);
            },
            color: Colors.blue,
            child: Text(
              _isFirstColumn(index)
                  ? _getItem(index).text
                  : _getItem(index).text + ' (' + _getItem(index).language + ')',
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache _audioCache = AudioCache(prefix: 'assets/audios/');
  bool firstExecuting = true;
  double volume = 0.5;

  _executar() async {
    audioPlayer.setVolume(volume);

    if (firstExecuting) {
      audioPlayer = await _audioCache.play("musica.mp3");
      firstExecuting = false;
    } else {
      audioPlayer.resume();
    }

    /*String url =
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3";
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
    }*/
  }

  _pausar() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      // success
    }
  }

  _parar() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      // success
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Executing Sounds"),
      ),
      body: Column(
        children: [
          Slider(
              value: volume,
              min: 0,
              max: 1,
              //divisions: 10,
              onChanged: (novoVolume) {
                setState(() {
                  volume = novoVolume;
                });
                audioPlayer.setVolume(novoVolume);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: () {
                    _executar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: () {
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: () {
                    _parar();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

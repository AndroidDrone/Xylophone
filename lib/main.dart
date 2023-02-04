import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Xylophone());

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  void playSound(int soundNumber) {
    //function to act
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/note$soundNumber.wav"),
      autoStart: true,
      showNotification: false,
    );
  }

  Expanded buildKey({required MaterialColor color, required int soundNumber}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playSound(soundNumber);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // background
          foregroundColor: Colors.black, // foreground
        ),
        child: Text('Click Note $soundNumber'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Xylophone'),
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.blue, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.orange, soundNumber: 5),
              buildKey(color: Colors.teal, soundNumber: 6),
              buildKey(color: Colors.deepPurple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}

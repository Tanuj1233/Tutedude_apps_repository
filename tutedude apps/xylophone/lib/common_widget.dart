import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget {
  final Color color;
  final int audioNumber;
  const CommonWidget({required this.color, required this.audioNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height/7,
        width: MediaQuery.of(context).size.width,
        color: color,
      ),
      onTap: () {
        final player = AudioPlayer();
        player.play(AssetSource('note$audioNumber.wav'));
      },
    );
  }
}
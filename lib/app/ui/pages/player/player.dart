import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/app/ui/helpers/responsive.dart';
import 'package:musicapp/app/ui/widgets/widgets_global.dart';

class PlayerPage extends StatefulWidget {
  //
  final int? index;
  final int cover;
  final String? title;
  final String? artist;
  final String? uri;

  const PlayerPage({
    super.key,
    this.index,
    this.artist,
    this.title,
    this.uri,
    required this.cover,
  });

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final AudioPlayer _player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CaratulaMusic(
            cover: widget.cover,
            border: context.dp(1),
            width: context.dp(1),
          ),
        ],
      ),
    );
  }
}

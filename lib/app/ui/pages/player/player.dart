import 'package:flutter/cupertino.dart';
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
    final double n = context.dp(3.5);
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // CaratulaMusic(
            //   cover: widget.cover,
            //   border: context.dp(1),
            //   width: context.dp(1),
            // ),
            Container(
              width: context.dp(n),
              height: context.dp(n),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(
                  context.dp(4),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                ButtonControllerPlayer(
                  color: Colors.black,
                  dimension: 5,
                  sizeIcon: 2,
                  icon: CupertinoIcons.backward_end,
                ),
                ButtonControllerPlayer(
                  color: Colors.blueAccent,
                ),
                ButtonControllerPlayer(
                  icon: CupertinoIcons.up_arrow,
                  dimension: 5,
                  sizeIcon: 2,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

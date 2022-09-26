import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../widgets/widgets_global.dart';
import '../player/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<int, SongModel> songs = {};
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const NavBarMusic(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PlayerPage(cover: 1),
            ],
          ),
        ),
      ),
    );
  }
}

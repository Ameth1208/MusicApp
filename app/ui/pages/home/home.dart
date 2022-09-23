import 'package:flutter/material.dart';
import 'package:musicapp/app/ui/pages/home/widgets/music_list.dart';

import '../../widgets/widgets_global.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const Text("data"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Appbar(),
              MusicList(),
            ],
          ),
        ),
      ),
    );
  }
}

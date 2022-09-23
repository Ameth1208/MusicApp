import 'package:flutter/material.dart';
import 'package:musicapp/app/ui/pages/home/widgets/constuctor_list.dart';
import 'package:musicapp/app/ui/widgets/widgets_global.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: const TextApp.title1(
              text: "Canciones",
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(
            child: ConstructorList(),
          ),
        ],
      ),
    );
  }
}

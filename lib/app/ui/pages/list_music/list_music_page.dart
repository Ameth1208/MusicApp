import 'package:flutter/material.dart';

class ListSong extends StatelessWidget {
  const ListSong({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, i) {
          return const Text('');
        },
      ),
    );
  }
}

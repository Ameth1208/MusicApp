import 'package:flutter/material.dart';
import 'package:musicapp/app/ui/helpers/helpers_global.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CaratulaMusic extends StatelessWidget {
  final int cover;
  final double border;
  final double width;
  const CaratulaMusic({
    super.key,
    required this.cover,
    required this.border,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      id: cover,
      type: ArtworkType.AUDIO,
      artworkBorder: BorderRadius.circular(
        context.dp(border),
      ),
      artworkWidth: context.dp(width),
      artworkHeight: context.dp(width),
      nullArtworkWidget: Container(
        color: Colors.white24,
      ),
    );
  }
}

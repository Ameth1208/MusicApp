import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CoverSong extends HookConsumerWidget {
  final int cover;
  final double border;
  final double width;

  final ArtworkType type;
  const CoverSong(
      {super.key,
      required this.cover,
      required this.border,
      this.width = 12,
      this.type = ArtworkType.AUDIO});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return QueryArtworkWidget(
      id: cover,
      type: type,
      artworkBorder: BorderRadius.circular(
        context.dp(border),
      ),
      artworkWidth: context.wp(width),
      artworkHeight: context.wp(width),
      nullArtworkWidget: Container(
        color: Colors.white24,
      ),
    );
  }
}

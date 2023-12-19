import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CoverSong extends HookConsumerWidget {
  final int cover;
  final double border;
  final double width;
  const CoverSong({
    super.key,
    required this.cover,
    required this.border,
    required this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

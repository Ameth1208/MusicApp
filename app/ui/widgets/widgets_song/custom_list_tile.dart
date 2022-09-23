import 'package:flutter/material.dart';
import 'package:musicapp/app/ui/helpers/helpers_global.dart';
import 'package:musicapp/app/ui/widgets/widgets_global.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CustomListTile extends StatelessWidget {
  final String title;

  final String artist;

  final String time;
  final Color colorT, colorA;
  final VoidCallback? onTap;
  final int cover;

  const CustomListTile({
    super.key,
    this.title = "Title Song",
    required this.cover,
    this.artist = "",
    this.time = "00:00",
    this.colorT = ColorApp.textColor,
    this.colorA = Colors.grey,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.dp(1)),
        child: Row(
          children: [
            // Container(
            //   width: context.dp(8),
            //   height: context.dp(8),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(
            //       context.dp(2),
            //     ),
            //     image: DecorationImage(
            //       image: AssetImage(cover),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),

            //Caratula Usada desde la libreria
            QueryArtworkWidget(
              id: cover,
              type: ArtworkType.AUDIO,
              artworkBorder: BorderRadius.circular(
                context.dp(2),
              ),
              artworkWidth: context.dp(8),
              artworkHeight: context.dp(8),
            ),
            SizedBox(
              width: context.dp(1),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextApp.title2(
                    text: title,
                    color: colorT,
                    fontWeight: FontWeight.bold,
                  ),
                  TextApp.title3(
                    text: artist,
                    color: colorA,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

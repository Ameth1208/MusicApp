import 'package:flutter/material.dart';
import 'package:musicapp/app/ui/helpers/helpers_global.dart';
import 'package:musicapp/app/ui/widgets/widgets_global.dart';

class CustomListTile extends StatelessWidget {
  final String? title;

  final String? artist;

  final Color colorT, colorA;
  final VoidCallback? onTap;
  final int? cover;

  const CustomListTile({
    super.key,
    this.title = "Title Song",
    this.cover,
    this.artist = "",
    this.colorT = ColorApp.textColor,
    this.colorA = Colors.grey,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.white60,
        padding: EdgeInsets.all(context.dp(1)),
        child: Expanded(
          child: Row(
            children: [
              // Caratula
              CaratulaMusic(
                cover: cover!,
                border: context.dp(0.2),
                width: context.dp(1),
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
                      text: title!,
                      color: colorT,
                      fontWeight: FontWeight.bold,
                    ),
                    TextApp.title3(
                      text: artist!,
                      color: colorA,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

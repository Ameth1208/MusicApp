import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/app/ui/helpers/helpers_global.dart';
import 'package:musicapp/app/ui/widgets/textlabel.dart';

class Appbar extends StatelessWidget {
  final VoidCallback? onTapMenu, onTapText;
  final Color color;
  const Appbar({
    super.key,
    this.onTapMenu,
    this.onTapText,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width),
        color: ColorApp.white,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTapMenu,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: FaIcon(
                IconsApp.menu,
                color: color,
                size: context.dp(2.5),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTapText,
            child: TextApp.title2(
              text: searchMusic,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

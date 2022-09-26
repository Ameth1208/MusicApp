import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/app/ui/helpers/helpers_global.dart';

class ButtonControllerPlayer extends StatelessWidget {
  final IconData icon;
  final double sizeIcon;
  final VoidCallback? onTap;
  final bool state;
  final double dimension;
  final Color color;

  const ButtonControllerPlayer({
    super.key,
    this.dimension = 7,
    this.state = false,
    this.icon = FontAwesomeIcons.play,
    this.sizeIcon = 3,
    this.onTap,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.dp(dimension),
        height: context.dp(dimension),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            context.dp(3),
          ),
        ),
        child: Center(
          child: FaIcon(
            icon,
            color: Colors.white,
            size: context.dp(sizeIcon),
          ),
        ),
      ),
    );
  }
}

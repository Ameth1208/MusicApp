import 'package:flutter_meedu/meedu.dart';
import 'package:musicapp/app/ui/pages/home/controller/home_controller.dart';
import 'player_controller.dart';

final playerControllerProvider = SimpleProvider(
  (_) => {PlayerController(), HomeController()},
);

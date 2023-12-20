import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navigator_controllers.dart';

final navigatorProvider =
    ChangeNotifierProvider((ref) => NavigatorController());

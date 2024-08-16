import 'package:flutter/cupertino.dart';
import 'package:m2p_assignment/res/Resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}

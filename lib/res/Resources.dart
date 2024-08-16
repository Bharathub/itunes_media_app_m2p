import 'package:flutter/material.dart';
import 'color/app_color.dart';
import 'dimension/app_dimension.dart';

class Resources {
  // ignore: unused_field
  final BuildContext _context;

  Resources(this._context);

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  double get screenHeight {
    return MediaQuery.of(_context).size.height;
  }

  double get screenWidth {
    return MediaQuery.of(_context).size.width;
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}

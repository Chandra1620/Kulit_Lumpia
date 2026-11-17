import 'package:flutter/material.dart';

/// Spacing tokens based on 4dp scale
/// Adheres to STYLEGUIDE.md Section 5 & 6
class AppSpacing {
  AppSpacing._();

  static const double space4 = 4.0;
  static const double space8 = 8.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space20 = 20.0;
  static const double space24 = 24.0;
  static const double space32 = 32.0;

  // Corner radius
  static const double radiusSmall = 6.0;
  static const double radiusMedium = 10.0;
  static const double radiusLarge = 14.0;

  // Reusable SizedBox shortcuts
  static const SizedBox vertical4 = SizedBox(height: space4);
  static const SizedBox vertical8 = SizedBox(height: space8);
  static const SizedBox vertical12 = SizedBox(height: space12);
  static const SizedBox vertical16 = SizedBox(height: space16);
  static const SizedBox vertical20 = SizedBox(height: space20);
  static const SizedBox vertical24 = SizedBox(height: space24);
  static const SizedBox vertical32 = SizedBox(height: space32);

  static const SizedBox horizontal4 = SizedBox(width: space4);
  static const SizedBox horizontal8 = SizedBox(width: space8);
  static const SizedBox horizontal12 = SizedBox(width: space12);
  static const SizedBox horizontal16 = SizedBox(width: space16);
  static const SizedBox horizontal20 = SizedBox(width: space20);
  static const SizedBox horizontal24 = SizedBox(width: space24);
  static const SizedBox horizontal32 = SizedBox(width: space32);
}

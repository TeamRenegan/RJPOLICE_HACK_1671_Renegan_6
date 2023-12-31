import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumInterBlack900 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.52),
        fontSize: 13.fSize,
      );
  static get bodyMediumInterBlack90014 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallRegular => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelMediumBlack900 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black900,
      );
  static get labelMediumGray500 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray500,
      );
  // Title text style
  static get titleMediumCyan600c4 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.cyan600C4,
      );
  static get titleMediumDroidSansGray10001 =>
      theme.textTheme.titleMedium!.droidSans.copyWith(
        color: appTheme.gray10001,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallDroidSansGray10001 =>
      theme.textTheme.titleSmall!.droidSans.copyWith(
        color: appTheme.gray10001,
      );
}

extension on TextStyle {
  TextStyle get droidSans {
    return copyWith(
      fontFamily: 'Droid Sans',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get adobeBlank {
    return copyWith(
      fontFamily: 'Adobe Blank',
    );
  }

  TextStyle get dongle {
    return copyWith(
      fontFamily: 'Dongle',
    );
  }
}

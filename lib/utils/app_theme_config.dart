import 'package:data_flow_interview_assessment/constants/dimensions.dart';
import 'package:flutter/material.dart';

class AppThemeConfig {
  static const Color primary = Color(0xFF244B3A);
  static const Color secondary = Color(0xFF41745E);
  static const Color background = Color(0xFFF4F4F4);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF707070);
  static const Color inactive = Color(0xFFCBCBCB);
  static const Color buttonShadow = Color(0x26000000);

  static const AppThemeColors lightColors = AppThemeColors(
    deepGreen: Color(0xFF112F22),
    alternateGreen: Color(0xFF264F3D),
    greenTextAccent: Color(0xFF00894D),
    blueTextAccent: Color(0xFF46A0BF),
  );

  static ThemeData light() {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: primary,
      onPrimary: surface,
      secondary: secondary,
      onSecondary: surface,
      surface: surface,
      onSurface: textPrimary,
      onSurfaceVariant: textSecondary,
      outline: inactive,
    );
    final ThemeData base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: background,
    );
    final TextTheme textTheme = base.textTheme.copyWith(
      bodyMedium: base.textTheme.bodyMedium!.copyWith(fontSize: kFontSize, color: textPrimary),
      bodySmall: base.textTheme.bodySmall!.copyWith(fontSize: 12, color: textSecondary),
      labelSmall: base.textTheme.labelSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
      labelLarge: base.textTheme.labelLarge!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 15 / 14,
        letterSpacing: 0,
      ),
    );
    return base.copyWith(
      textTheme: textTheme,
      extensions: const <AppThemeColors>[lightColors],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondary,
          foregroundColor: surface,
          minimumSize: const Size(48, 50),
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          textStyle: textTheme.labelLarge,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kActionButtonBorderRadius),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: inactive,
        selectedLabelStyle: textTheme.labelSmall,
        unselectedLabelStyle: textTheme.labelSmall,
        selectedIconTheme: const IconThemeData(size: 24),
        unselectedIconTheme: const IconThemeData(size: 24),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color deepGreen;
  final Color alternateGreen;
  final Color greenTextAccent;
  final Color blueTextAccent;

  const AppThemeColors({
    required this.deepGreen,
    required this.alternateGreen,
    required this.greenTextAccent,
    required this.blueTextAccent,
  });

  TextStyle get decorativeTitle => const TextStyle(
    fontFamily: 'Quentin',
    fontSize: 26,
    fontWeight: FontWeight.w400,
  );

  @override
  AppThemeColors copyWith({
    Color? deepGreen,
    Color? alternateGreen,
    Color? greenTextAccent,
    Color? blueTextAccent,
  }) {
    return AppThemeColors(
      deepGreen: deepGreen ?? this.deepGreen,
      alternateGreen: alternateGreen ?? this.alternateGreen,
      greenTextAccent: greenTextAccent ?? this.greenTextAccent,
      blueTextAccent: blueTextAccent ?? this.blueTextAccent,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      deepGreen: Color.lerp(deepGreen, other.deepGreen, t)!,
      alternateGreen: Color.lerp(alternateGreen, other.alternateGreen, t)!,
      greenTextAccent: Color.lerp(greenTextAccent, other.greenTextAccent, t)!,
      blueTextAccent: Color.lerp(blueTextAccent, other.blueTextAccent, t)!,
    );
  }
}

extension AppThemeContext on BuildContext {
  AppThemeColors get appThemeColors =>
      Theme.of(this).extension<AppThemeColors>() ?? AppThemeConfig.lightColors;
}
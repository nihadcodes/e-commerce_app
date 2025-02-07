import 'package:craft_bay/utility/app_colors.dart';
import 'package:craft_bay/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftBay extends StatelessWidget {
  const CraftBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        useMaterial3: false,
        colorSchemeSeed: AppColors.primaryColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor,
        ),
        textTheme: _textTheme(),
        inputDecorationTheme:_inputDecorationTheme(),

      ),
    );
  }

  TextTheme _textTheme() => const TextTheme(
      headlineLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),
      headlineSmall: const TextStyle(
        fontSize: 16,
        color: Colors.blueGrey,
      )

  );


InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
  border: _outlineInputBorder,
  enabledBorder: _outlineInputBorder,
  focusedBorder: _outlineInputBorder,
  errorBorder: _outlineInputBorder.copyWith(
    borderSide: const BorderSide(color: Colors.red),
  ),


  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),



);
final OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.primaryColor),

);

}
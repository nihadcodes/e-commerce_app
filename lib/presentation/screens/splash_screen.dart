import 'package:craft_bay/presentation/screens/email_verification_screen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/app_logo.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => const EmailVerificationScreen(email: '',));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            AppLogo(),
            const Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("Version 1.0.0"),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}


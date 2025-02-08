import 'dart:async';
import 'package:craft_bay/presentation/screens/complete_profile_screen.dart';
import 'package:craft_bay/utility/app_colors.dart';
import 'package:craft_bay/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {


  const OtpVerificationScreen({super.key, required String email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isResendButtonVisible = false;
  late Timer _timer;
  int _remainingTime = 100;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isResendButtonVisible = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                AppLogo(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter OTP Code',
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Enter Your Email Address to Verify',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                _buildPinField(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: () {
                  Get.to(() => const CompleteProfileScreen(email: '',));
                }, child: Text('Next')),
                const SizedBox(
                  height: 24,
                ),
                _buildResendCodeMessage(),
                if (_isResendButtonVisible)
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text(
                      'Resend OTP Code',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResendCodeMessage() {
    return RichText(
      text: TextSpan(
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          children: [
            TextSpan(text: 'This code will expire in '),
            TextSpan(
                text: '${_remainingTime}s',
                style: TextStyle(color: AppColors.primaryColor)),
          ]),
    );
  }

  Widget _buildPinField() {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.transparent,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _otpController,
    );
  }
}

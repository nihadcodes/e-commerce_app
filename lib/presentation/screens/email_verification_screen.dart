import 'package:craft_bay/utility/app_colors.dart';
import 'package:craft_bay/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body:
         Padding(
           padding: const EdgeInsets.all(24.0),
           child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
            children: [
               AppLogo(),
              SizedBox(height: 16,),
              Text('Welcome back', style: textTheme.headlineLarge,),
              SizedBox(height: 14,),
              Text('Enter Your Email Address to Verify', style: textTheme.headlineSmall,),
              SizedBox(height: 16,),
              TextFormField(),
              SizedBox(height: 16,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                    )
                  ),
                  
                  onPressed: () {}, child: Text('Next'))


    ],
         ),
         ),
    );
    }
}


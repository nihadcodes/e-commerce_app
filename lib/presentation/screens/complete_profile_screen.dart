import 'package:craft_bay/widgets/app_logo.dart';
import 'package:flutter/material.dart';


class CompleteProfileScreen extends StatefulWidget {
  final String email;

  const CompleteProfileScreen({super.key, required this.email});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _shippingController.dispose();

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
                  _buildCompleteProfileForm(textTheme),
                ],
              ),

          ),
        ),
      ),
    );
  }

  Widget _buildCompleteProfileForm(TextTheme textTheme) {
    return Form(
      key: _formKey,
      child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    AppLogo(),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Complete Profile',
                      style: textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Get Started with us by providing your details',
                      style: textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(hintText: 'First Name'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(hintText: 'Last Name'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _mobileController,
                      decoration: InputDecoration(hintText: 'Mobile'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(hintText: 'City'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    TextFormField(
                      controller: _shippingController,
                      maxLines: 4,
                      decoration: InputDecoration(hintText: 'Shipping Address'),
                    ),


                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Complete')),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                )
    );
  }
}

import 'package:flutter/material.dart';

import 'Widgets/BottomImage.dart';
import 'Widgets/Header.dart';
import 'Widgets/SignupForm.dart';

// Main Signup Page
class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(),
            SignupForm(),

          ],
        ),
      ),
    );
  }
}
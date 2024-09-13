import 'package:flutter/cupertino.dart';

class BottomImage extends StatelessWidget {
  const BottomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bottomimage2.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

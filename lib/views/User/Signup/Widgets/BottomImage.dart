import 'package:flutter/cupertino.dart';

class BottomImage extends StatelessWidget {
  const BottomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Image.asset(
        'assets/bottomimage.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
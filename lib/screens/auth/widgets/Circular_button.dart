// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CircularImageButton extends StatelessWidget {
  final double size; // Độ lớn của nút
  final String imagePath; // Đường dẫn tới ảnh từ thư mục assets
  final VoidCallback onPressed;

  const CircularImageButton({
    Key? key,
    required this.size,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Hình tròn
        image: DecorationImage(
          image: AssetImage(imagePath), // Ảnh nền từ thư mục assets
          fit: BoxFit.cover, // Ảnh phủ kín nút
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Màu bóng
            blurRadius: 10, // Độ mờ của bóng
            offset: Offset(0, 5), // Vị trí của bóng
            spreadRadius: 1, // Độ lan của bóng
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent, // Nền trong suốt để thấy ảnh
        child: InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: onPressed, // Hành động khi nhấn nút
          splashColor: Colors.white.withOpacity(0.2), // Hiệu ứng khi nhấn
        ),
      ),
    );
  }
}

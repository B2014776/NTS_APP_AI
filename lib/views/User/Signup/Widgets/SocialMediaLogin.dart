import 'package:flutter/material.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          logoPath: 'assets/Facebook.png',
          buttonText: 'Đăng nhập với Facebook',
          buttonColor: Colors.blue,
          textColor: Colors.white,
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        _buildSocialButton(
          logoPath: 'assets/google.png',
          buttonText: 'Đăng nhập với Google',
          buttonColor: Colors.white,
          textColor: Colors.black,
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        _buildSocialButton(
          logoPath: 'assets/apple.png',
          buttonText: 'Đăng nhập với Apple',
          buttonColor: Colors.white,
          textColor: Colors.black,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // TODO: Open terms and conditions
              },
              child: const Text(
                "Các điều khoản",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(" và ",

            ),

            InkWell(
              onTap: () {
                // TODO: Open privacy policy
              },
              child: const Text(
                "chính sách bảo mật",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(" của NTAGRI"),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String logoPath,
    required String buttonText,
    required Color buttonColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        minimumSize: Size(320, 32),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            logoPath,
            height: 28,
            width: 28,
          ),
          const SizedBox(width: 8),
          Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  Widget _buildWeatherButton(String label, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: AutoSizeText(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30), // Adjust the radius as needed
      ),
      child: Container(
        width: double.infinity,
        color: const Color(0xffF5FFFD),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Cần Thơ, Việt Nam',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      AutoSizeText(
                        '35°C',
                        style: TextStyle(
                          fontSize: 57,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/Cloud_and_sun.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildWeatherButton('Hôm nay', Colors.white),
                  const SizedBox(width: 16),
                  _buildWeatherButton('Ngày mai', const Color(0xffffdce3)),
                  const SizedBox(width: 16),
                  _buildWeatherButton('10 ngày', const Color(0xffCCFFCC)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

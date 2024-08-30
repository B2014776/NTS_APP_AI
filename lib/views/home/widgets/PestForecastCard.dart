import 'package:flutter/material.dart';

class PestForecastCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const PestForecastCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: double.infinity, // Set width to be full width
        child: Card(
          color: Colors.white, // Set background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('$description'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

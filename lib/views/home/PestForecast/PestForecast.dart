import 'package:flutter/material.dart';
import 'PestForecastCard.dart';

class PestForecast extends StatelessWidget {
  const PestForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Increased corner radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0), // Increased bottom padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dự báo sâu bệnh hôm nay',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20, // Increased font size
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Add your onPressed functionality here
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Tất cả',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 6), // Increased space between text and icon
                      Icon(
                        Icons.chevron_right,
                        color: Colors.orange,
                        size: 22, // Slightly larger icon
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const PestForecastCard(
            title: 'Bọ ngựa',
            description:
            'Trong môi trường thiếu thốn nguồn thức ăn, chúng thậm chí có thể ăn thịt lẫn nhau.',
            imagePath: 'assets/Sau_benh.png',
          ),
          // Add more PestForecastCard widgets here as needed
        ],
      ),
    );
  }
}

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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // Increased border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0), // Increased padding
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Increased padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, // Increased font size
                          fontWeight: FontWeight.w600), // Increased font weight
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 15, // Increased font size
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

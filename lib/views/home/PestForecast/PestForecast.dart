import 'package:flutter/material.dart';
import 'PestForecastCard.dart';

class PestForecast extends StatelessWidget {
  const PestForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Dự báo sâu bệnh hôm nay',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add your onPressed functionality here
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Tất cả',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          PestForecastCard(
            title: 'Bọ ngựa',
            description:
            'Trong môi trường thiếu thốn nguồn thức ăn, chúng thậm chí có thể ăn thịt lẫn nhau.',
            imagePath: 'assets/Sau_benh.png',
          ),
          // Add more ForecastCard widgets here as needed
        ],
      ),
    );
  }
}

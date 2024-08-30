import 'package:flutter/material.dart';
import 'PlantCard.dart'; // Import PlantCard widget

class Plant extends StatelessWidget {
  const Plant({Key? key}) : super(key: key);

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

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Cây trồng',
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
          const SizedBox(
            height: 160,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PlantCard(
                    imagePath: 'assets/cachua.png',
                    plantName: 'Cây cà chua',
                    plantType: 'cây ăn quả',
                    plantingMethod: 'gieo trồng, tưới nước...',
                  ),
                  SizedBox(width: 1),
                  PlantCard(
                    imagePath: 'assets/cachua.png',
                    plantName: 'Cây cà chua',
                    plantType: 'cây ăn quả',
                    plantingMethod: 'gieo trồng, tưới nước...',
                  ),
                  SizedBox(width: 1),
                  PlantCard(
                    imagePath: 'assets/cachua.png',
                    plantName: 'Cây cà chua',
                    plantType: 'cây ăn quả',
                    plantingMethod: 'gieo trồng, tưới nước...',
                  ),
                  // Add more PlantCard widgets as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}

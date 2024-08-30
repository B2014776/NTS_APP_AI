import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final String imagePath;
  final String plantName;
  final String plantType;
  final String plantingMethod;

  const PlantCard({
    Key? key,
    required this.imagePath,
    required this.plantName,
    required this.plantType,
    required this.plantingMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Card(
        color: Colors.white,
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
                    plantName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text('Loại cây trồng: $plantType'),
              Text('Cách trồng: $plantingMethod'),
            ],
          ),
        ),
      ),
    );
  }
}

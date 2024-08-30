import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
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
    return SizedBox(
      width: 250,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // More rounded corners
          side: BorderSide(color: Colors.grey.shade300, width: 1), // Border color and width
        ),
        elevation: 0, // Increased elevation for better shadow
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Increased padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Rounded image corners
                    child: Image.asset(
                      imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover, // Ensures image covers the entire area
                    ),
                  ),
                  const SizedBox(width: 10), // Space between image and text
                  Expanded(
                    child: AutoSizeText(
                      plantName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600), // Larger font size
                      overflow: TextOverflow.ellipsis, // Handle long plant names
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8), // Space below the row
              DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 6.0, // Longer dashes
                dashColor: Colors.blueGrey,
                dashGradient: const [Colors.blueGrey, Colors.blue],
                dashRadius: 0.0,
                dashGapLength: 6.0, // Increased gap length
                dashGapColor: Colors.transparent,
              ),
              const SizedBox(height: 8), // Space below the dotted line
              Text(
                'Loại cây trồng: $plantType',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700, // Slightly lighter color for subtext
                ),
              ),
              Text(
                'Cách trồng: $plantingMethod',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700, // Slightly lighter color for subtext
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

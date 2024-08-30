import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menuitems extends StatelessWidget {
  const Menuitems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(6, (index) {
          return ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.star_fill,
                  // Use a filled icon for better visibility
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Text(
                  'Chức năng ${index + 1}', // Example label
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold, // Bold text for better readability
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

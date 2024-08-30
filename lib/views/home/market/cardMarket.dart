import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class CardMarket extends StatefulWidget {
  const CardMarket({super.key});

  @override
  State<CardMarket> createState() => _CardMarketState();
}

class _CardMarketState extends State<CardMarket> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(12), // Increased padding for better spacing
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // Slightly more rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/thanhlong.png',
                width: 40, // Slightly larger image for better visibility
                height: 40,
                fit: BoxFit.cover, // Ensure image maintains aspect ratio
              ),
              const SizedBox(width: 8), // Space between image and text
              const Expanded(
                child: Text(
                  'Thanh long',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis, // Handle long text
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Increased space below the image-row
          DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 6.0,
            // Longer dashes
            dashColor: Colors.blueGrey,
            dashGradient: const [Colors.blueGrey, Colors.blue],
            dashRadius: 0.0,
            dashGapLength: 6.0,
            // Increased gap length
            dashGapColor: Colors.transparent,
          ),
          const SizedBox(height: 10), // Space between dotted line and content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '500,000 VNĐ/kg',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.orange,
                      size: 24,
                    ),
                    SizedBox(width: 4), // Reduced space for tighter look
                    Text(
                      '0',
                      style: TextStyle(fontSize: 16, color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // Space between rows
          const Text(
            'Xoài cát chu',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 4), // Space between text elements
          const Text(
            'Vĩnh Long',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

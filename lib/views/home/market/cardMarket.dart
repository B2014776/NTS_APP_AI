import 'package:auto_size_text/auto_size_text.dart';
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300, // Border color
          width: 1, // Border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/thanhlong.png',
                width: 45, // Larger image for better visibility
                height: 45,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12), // Increased space between image and text
              const Expanded(
                child: AutoSizeText(
                  'Thanh long',
                  style: TextStyle(
                    fontSize: 18, // Slightly larger text
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12), // Increased space below the image-row
          const DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 1.2, // Slightly thicker line
            dashLength: 5.0,
            dashColor: Colors.blueGrey,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
          ),
          const SizedBox(height: 12), // Space between dotted line and content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AutoSizeText(
                '500,000 VNĐ/kg',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                maxLines: 1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100, // Softer background color
                  borderRadius: BorderRadius.circular(10), // More rounded corners
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.redAccent, // Color adjustment
                      size: 24,
                    ),
                    SizedBox(width: 4),
                    AutoSizeText(
                      '0',
                      style: TextStyle(fontSize: 16, color: Colors.redAccent),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Space between rows
          const AutoSizeText(
            'Xoài cát chu',
            style: TextStyle(
              fontSize: 17, // Slightly larger font size
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 6), // Space between text elements
          const AutoSizeText(
            'Vĩnh Long',
            style: TextStyle(
              fontSize: 15, // Slightly larger font size
              fontWeight: FontWeight.w600, // Slightly bolder font
              color: Colors.black54,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

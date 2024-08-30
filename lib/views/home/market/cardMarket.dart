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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/thanhlong.png',
                width: 30,
                height: 30,
              ),
              const Text(
                'Thanh long',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: Colors.black,
            dashGradient: const [Colors.red, Colors.blue],
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapGradient: const [Colors.red, Colors.blue],
            dashGapRadius: 0.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 6,
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      '500,000 VNĐ/kg',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(222, 239, 239, 239),
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
                        SizedBox(width: 8),
                        Text(
                          '0',
                          style: TextStyle(fontSize: 14, color: Colors.orange),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Xoài cát chu',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '-',
                    style: TextStyle(fontSize: 14, color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Vĩnh Long',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    'Vĩnh Long',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cardMarket.dart';

class cardMarketList extends StatefulWidget {
  const cardMarketList({super.key});

  @override
  State<cardMarketList> createState() => _cardMarketListState();
}

class _cardMarketListState extends State<cardMarketList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Giá cả thị trường',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {},
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
                  )
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                ...List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 10,left: 5),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      transform: Matrix4.identity()
                        ..scale(1.02)
                        ..translate(0.0, 0.0),
                      child: const CardMarket(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class marketCard extends StatefulWidget {
  const marketCard({super.key});

  @override
  State<marketCard> createState() => _marketCardState();
}

class _marketCardState extends State<marketCard> {
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
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Giá cả thị trường',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
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
                  ))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                  height: 20,
                ),
                Container(
                  height: 110,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/raucu.png'),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cải thìa',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text('20.000 VND/Kg')
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 110, // Chiều cao của Container
                  width: 200, // Chiều rộng của Container
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // Nền màu trắng cho container
                    borderRadius: BorderRadius.circular(5),
                    // Bo góc Container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        // Màu đổ bóng với độ mờ
                        spreadRadius: 2,
                        // Bán kính lan rộng của bóng
                        blurRadius: 5,
                        // Độ mờ của bóng
                        offset: const Offset(0,
                            3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/raucu.png'),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cải thìa',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text('20.000 VND/Kg')
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 110, // Chiều cao của Container
                  width: 200, // Chiều rộng của Container
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // Nền màu trắng cho container
                    borderRadius: BorderRadius.circular(5),
                    // Bo góc Container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        // Màu đổ bóng với độ mờ
                        spreadRadius: 2,
                        // Bán kính lan rộng của bóng
                        blurRadius: 5,
                        // Độ mờ của bóng
                        offset: const Offset(0,
                            3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/raucu.png'),
                      const SizedBox(width: 20),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cải thìa',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text('20.000 VND/Kg')
                        ],
                      ),
                    ],
                  ),
                ),
                //container khac
              ],
            ),
          ),
        ],
      ),
    );
  }
}

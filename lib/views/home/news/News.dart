import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../models/CategoryModel.dart';
import '../../../models/NewsModel.dart';

class NewsPage extends StatefulWidget {
  final RxList dataCategoryNews;

  NewsPage({required this.dataCategoryNews});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String selectedCategoryId = '1';

  @override
  Widget build(BuildContext context) {
    List<DanhMuc> categories =
        widget.dataCategoryNews.map((item) => DanhMuc.fromJson(item)).toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AutoSizeText(
                'Danh mục',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ).animate().fade().scale(),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'Tất cả',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 14,
                                ),

                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.orange,
                                size: 18,
                              )
                            ],
                          )
                      )
                    ],
                  ))
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      selectedCategoryId = category.id;
                    }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: category.id == selectedCategoryId
                          ? Colors.green
                          : Colors.white,
                      foregroundColor: category.id == selectedCategoryId
                          ? Colors.white
                          : Colors.grey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: category.id == selectedCategoryId
                              ? Colors.green
                              : Colors.grey.shade300,
                        ),
                      ),
                      elevation: category.id == selectedCategoryId ? 5 : 2,
                    ),
                    child: Text(category.tenDanhMuc),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../models/CategoryModel.dart';
import '../../../models/NewsModel.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String selectedCategoryId = '1';

  List<DanhMuc> categories = [
    DanhMuc(id: '1', tenDanhMuc: 'Nhà nông làm giàu'),
    DanhMuc(id: '2', tenDanhMuc: 'Tin khởi nghiệp'),
    DanhMuc(id: '3', tenDanhMuc: 'Mùa vụ trong năm'),
    DanhMuc(id: '4', tenDanhMuc: 'Phòng trừ sâu bệnh'),
  ];

  List<TinTuc> news = [
    TinTuc(
        id: '1',
        tieuDe: 'Trồng ổi Đài Loan kiếm ngay tiền tỷ',
        noiDung: 'Trồng 170 ha ổi Đài loan, thu ngay 800 triệu /ha/năm',
        img: 'cay-oi.jpg',
        danhMucID: '1'),
    TinTuc(
        id: '2',
        tieuDe: 'Trồng ổi Đài Loan kiếm ngay tiền tỷ',
        noiDung: 'Trồng 170 ha ổi Đài loan, thu ngay 800 triệu /ha/năm',
        img: 'cay-oi.jpg',
        danhMucID: '1'),
    TinTuc(
        id: '3',
        tieuDe: 'Trồng ổi Đài Loan kiếm ngay tiền tỷ',
        noiDung: 'Trồng 170 ha ổi Đài loan, thu ngay 800 triệu /ha/năm',
        img: 'cay-oi.jpg',
        danhMucID: '2'),
    TinTuc(
        id: '4',
        tieuDe: 'Trồng ổi Đài Loan kiếm ngay tiền tỷ',
        noiDung: 'Trồng 170 ha ổi Đài loan, thu ngay 800 triệu /ha/năm',
        img: 'cay-oi.jpg',
        danhMucID: '3'),
  ];

  void onCategorySelected(String categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TinTuc> filteredNews =
        news.where((n) => n.danhMucID == selectedCategoryId).toList();

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
                'Tin tức',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ).animate().fade().scale(),
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
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ElevatedButton(
                    onPressed: () => onCategorySelected(category.id),
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
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: filteredNews.map((newsItem) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  child: SizedBox(
                    width: 280, // Adjust width as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 140,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10.0)),
                                child: Image.asset(
                                  'assets/${newsItem.img}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10.0)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                newsItem.tieuDe,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6.0),
                              AutoSizeText(
                                newsItem.noiDung,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

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
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tin tức',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
                          horizontal: 16.0, vertical: 6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text(category.tenDanhMuc),
                  ),
                );
              }).toList(),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: filteredNews.map((newsItem) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: SizedBox(
                    width: 300, // Adjust width as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                            child: Image.asset(
                              'assets/${newsItem.img}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newsItem.tieuDe,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                newsItem.noiDung,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.grey[600]),
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

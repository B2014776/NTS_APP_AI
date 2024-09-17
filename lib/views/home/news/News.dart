import 'package:apptestai/views/home/news/widgets/CategoryButtons.dart';
import 'package:apptestai/views/home/news/widgets/NewsCard.dart';
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
        tieuDe: 'Trồng ổi đài loan, kiếm ngay tiền tỉ mỗi năm',
        noiDung:
            'Nông dân tại Vĩnh Long, trồng 170 ha ổi Đài loan, thu ngay 800 triệu /ha/năm nhờ trồng 170 ha ổi Đài loan',
        img: 'cay-oi.jpg',
        danhMucID: '1'),
    TinTuc(
        id: '2',
        tieuDe:
            'Loại cây ngoại nhập, thân to như cột đình, ông nông dân Đắk Nông trồng thành công, có lương 300 triệu/năm',
        noiDung:
            'Gia đình ông nông dân Vũ Bá Chiến, thôn 7, xã Tâm Thắng, huyện Cư Jút (tỉnh Đắk Nông) đã chuyển đổi 2ha đất trồng hoa màu sang trồng chuối Thái Lan và mang lại hiệu quả kinh tế cao.',
        img: 'chuoi_cay.png',
        danhMucID: '1'),
    TinTuc(
        id: '3',
        tieuDe:
            'Ở một xã của Vĩnh Long, đang giàu lên nhờ trồng thứ cây cao vút, "xước tí da" có mùi thơm',
        noiDung:
            'Nhiều hộ dân xã Phú Nhuận, huyện Bảo Thắng, tỉnh Lào Cai đã lựa chọn đưa cây quế vào trồng để cung cấp dược liệu, gỗ ra thị trường, góp phần nâng cao thu nhập, giảm nghèo bền vững.',
        img: 'que_cay.png',
        danhMucID: '1'),
    TinTuc(
        id: '4',
        tieuDe: 'Sóng khởi nghiệp nông nghiệp lan rộng tại TP.Cần Thơ',
        noiDung:
            'Bên cạnh khởi nghiệp công nghệ, xu hướng khởi nghiệp nông nghiệp đang bắt đầu được nhiều người trẻ tại TP HCM quan tâm hơn.',
        img: 'tin_khoi_nghiẹp_1.jpg',
        danhMucID: '2'),
    TinTuc(
        id: '5',
        tieuDe: 'Kiếm triệu đô từ chuỗi nông trại trên sân thượng',
        noiDung:
            'Là công ty khởi nghiệp nông nghiệp hiếm hoi tại Singapore, Edible Garden City chuyên trồng rau củ trên các sân thượng cao ốc với lợi nhuận năm sau dự kiến đạt 1 triệu đôla. ',
        img: 'tin_khoi_nghiẹp_2.jpg',
        danhMucID: '2'),
    TinTuc(
        id: '6',
        tieuDe: 'Vụ Mùa Chiêm Xuân',
        noiDung:
            'Vụ lúa chiêm xuân là vụ mà xuống mạ trong mùa khô nên người dân cần có nước tưới chủ động. Đối với vụ mùa này thì đầu và giữa vụ sẽ gặp rét mạnh, cuối vụ nóng và có mưa nên cần dùng giống lúa có khả năng chịu rét. Lúa chiêm xuân thường được gieo cấy vào cuối tháng 10 hoặc đầu tháng 11 và  thu hoạch vào cuối tháng 5.',
        img: 'cac_vu_mua_lua_gao.jpg',
        danhMucID: '3'),
    TinTuc(
        id: '7',
        tieuDe: 'Vụ Mùa Đông Xuân',
        noiDung:
            'Vụ Mùa được gieo cấy đầu mùa mưa vào tháng 5,6 và thu hoạch vào tháng 11. Đây là vụ mùa sử dụng các loại giống dài ngày, thích hợp ở mực nước sâu.',
        img: 'vu_mua_lua_gao_cuu_long.jpg',
        danhMucID: '3'),
    TinTuc(
        id: '8',
        tieuDe: 'Vụ Mùa Hè Thua',
        noiDung:
            'Vụ Hè Thu thường được bắt đầu từ đầu tháng 4 và thu hoạch khoảng cuối tháng 8. Vụ Hè Thu sử dụng các loại giống ngắn ngày để gieo trồng.',
        img: 'vu-mua-lua-dbscl.jpg',
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Colors.orange,
                      )
                    ],
                  )),
            ],
          ),
          CategoryButtons(
            categories: categories,
            selectedCategoryId: selectedCategoryId,
            onCategorySelected: onCategorySelected,
          ),
          NewsCards(news: filteredNews),
        ],
      ),
    );
  }
}

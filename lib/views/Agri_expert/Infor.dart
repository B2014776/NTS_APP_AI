import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class InforExpert extends StatefulWidget {


  @override
  _InforExpertState createState() => _InforExpertState();
}

class _InforExpertState extends State<InforExpert> {
  String Phone = '0794938888';
  String Email = 'HTThuy@gmail.com';
  String Categories = 'Cây ăn quả';
  String Experience = '20 năm';
  String School = 'Tiến sĩ';
  String Name = 'Hoàng Trọng Thủy';
  final String ImageUrl = 'https://i.pinimg.com/564x/5f/40/6a/5f406ab25e8942cbe0da6485afd26b71.jpg';
  String Infor = 'Những tháng đầu năm 2020, nông nghiệp nước ta khó khăn chồng lên khó khăn. Những trận mưa đá tại miền núi phía Bắc; Hạn hán, xâm nhập mặn ở Đồng bằng sông Cửu Long đã làm hàng nghìn héc-ta cây ăn quả bị thất thu. Dịch cúm trên gia cầm, và đặc biệt là dịch Covid -19, đã làm đứt gãy chuỗi cung ứng, lưu thông hàng hóa, các mặt hàng nông sản xuất khẩu bị “đông cứng” và giảm sút nghiêm trọng. Đặc biệt, giá trị xuất khẩu nông lâm thủy sản sang thị trường số 1 của Việt Nam là Trung Quốc trong quý I/2020 sụt giảm đến 6,9%.hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 148,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 350, 30, 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/TreeIcon2.png', width: 47, height: 50,),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Nhóm hỗ trợ:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          Text(Categories, style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('Quá trình công tác', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                          child:
                          Column(
                            children: [
                              SizedBox(height: 5,),
                              Text(Infor, style: TextStyle(fontSize:18,) ,),
                            ],
                          ),

                      ),
                    ],
                  ),
                ],
              ),

            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 120, 40, 530),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white, // Nền màu trắng cho container
                borderRadius: BorderRadius.circular(5), // Bo góc Container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Màu đổ bóng với độ mờ
                    spreadRadius: 1, // Bán kính lan rộng của bóng
                    blurRadius: 3, // Độ mờ của bóng
                    offset: Offset(0, 3), // Vị trí của bóng
                  ),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: 0,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(ImageUrl,),
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  Column(
                    children: [
                      Text('Chuyên gia', style: TextStyle(fontSize: 20, color: Colors.green),),
                      Text(Name, style: TextStyle(fontSize: 18),),
                      Row(
                        children: [
                          Icon(Icons.school_outlined, size: 30,),
                          SizedBox(width: 5,),
                          Text('Trình độ chuyên môn:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                          SizedBox(width: 7,),
                          Text(School, style: TextStyle(fontSize: 18),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.credit_card_outlined, size: 28,),
                          SizedBox(width: 7,),
                          Text('Kinh nghiệm làm việc:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                          SizedBox(width: 7,),
                          Text(Experience, style: TextStyle(fontSize: 18),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.mail_outline_outlined, size: 28,),
                          SizedBox(width: 7,),
                          Text(Email, style: TextStyle(fontSize: 18),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone_in_talk_outlined, size: 28,),
                          SizedBox(width: 7,),
                          Text(Phone, style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 68,
              color: Color(0xffCFEBF7),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: ui.Size(150, 40), // Sử dụng Size từ dart:ui
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      icon: Icon(Icons.chat, color: Colors.black),
                      label: Text('Nhắn tin', style: TextStyle(color: Colors.black, fontSize: 17)),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: ui.Size(150, 40), // Sử dụng Size từ dart:ui
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      icon: Icon(Icons.phone, color: Colors.black),
                      label: Text('Gọi điện', style: TextStyle(color: Colors.black, fontSize: 17)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

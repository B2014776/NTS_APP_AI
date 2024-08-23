import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Custom_drawer.dart'; // Đảm bảo nhập đúng đường dẫn của file CustomDrawer

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Gán GlobalKey cho Scaffold để điều khiển Drawer
      drawer: CustomDrawer(), // Đặt CustomDrawer ở đây

      body: Center(
        child: Stack(
          children: [
            Column(
              children: [

                Container(
                  width: double.infinity,
                  height: 148,
                  color: Colors.green,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer(); // Mở Drawer khi nhấn vào menu
                        },
                        icon: Icon(Icons.menu_outlined, size: 30, color: Colors.white,),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/iconNTLogo.svg',
                        width: 65,
                        height: 65,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,

                          color: Color(0xffF5FFFD),
                          child: Column(
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(

                                    children: [
                                      SizedBox(height: 35,),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.black45,
                                            size: 30,
                                          ),
                                          SizedBox(width: 8,),
                                          Text(
                                            'Cần Thơ, Việt Nam',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '35°C',
                                        style: TextStyle(fontSize: 57),
                                      ),//cho de nhiet do
                                    ],
                                  ),
                                  SizedBox(height: 30,),
                                  Image.asset('assets/Cloud_and_sun.png'),//anhmattroi
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: (){},
                                          child:
                                            Text('Hôm nay', style: TextStyle(fontSize: 16, color: Colors.black),),
                                          style: TextButton.styleFrom(backgroundColor: Colors.white,minimumSize: Size(150, 50), ),
                                      ),
                                      SizedBox(width: 17,),
                                      TextButton(
                                        onPressed: (){},
                                        child:
                                        Text('Ngày mai', style: TextStyle(fontSize: 16, color: Colors.black),),
                                        style: TextButton.styleFrom(backgroundColor: Color(0xffffdce3),minimumSize: Size(150, 50), ),
                                      ),
                                      SizedBox(width: 17,),
                                      TextButton(
                                        onPressed: (){},
                                        child:
                                        Text('10 ngày', style: TextStyle(fontSize: 16, color: Colors.black),),
                                        style: TextButton.styleFrom(backgroundColor: Color(0xffCCFFCC),minimumSize: Size(150, 50), ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              //homnay, ngaymai,...
                            ],
                          ),
                        ),
                        SizedBox(height: 0,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white, // Nền màu trắng cho container
                            borderRadius: BorderRadius.circular(5), // Bo góc Container
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // Màu đổ bóng với độ mờ
                                spreadRadius: 1, // Bán kính lan rộng của bóng
                                blurRadius: 3, // Độ mờ của bóng
                                offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                              ),
                            ],
                          ),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text('Dự báo sâu bệnh hôm nay', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    Image.asset('assets/Sau_benh.png'),
                                    Expanded(
                                      child: Container(
                                        height: 120, // Đặt chiều cao cụ thể cho khung chứa văn bản
                                        child: SingleChildScrollView(
                                          child: Text(
                                            'Hãy cẩn thận với bọ ngựa, Chúng có thân dài, mảnh, với đầu hình tam giác có thể xoay được và đôi mắt lớn giúp bọ ngựa quan sát con mồi từ nhiều góc độ khác nhau.',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white, // Nền màu trắng cho container
                            borderRadius: BorderRadius.circular(5), // Bo góc Container
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // Màu đổ bóng với độ mờ
                                spreadRadius: 2, // Bán kính lan rộng của bóng
                                blurRadius: 5, // Độ mờ của bóng
                                offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                              ),
                            ],
                          ),
                          child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Giá cả thị trường', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                                SizedBox(height: 20,),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 8, height: 20,),
                                      Container(
                                        height: 110, // Chiều cao của Container
                                        width: 200,  // Chiều rộng của Container
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Nền màu trắng cho container
                                          borderRadius: BorderRadius.circular(5), // Bo góc Container
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5), // Màu đổ bóng với độ mờ
                                              spreadRadius: 2, // Bán kính lan rộng của bóng
                                              blurRadius: 5, // Độ mờ của bóng
                                              offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                                            ),
                                          ],
                                        ),
                                        child:
                                          Row(
                                            children: [
                                              Image.asset('assets/raucu.png'),
                                              SizedBox(width: 20,),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [

                                                  Text('Cải thìa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                                  Text('20.000 VND/Kg')
                                                ],
                                              ),
                                            ],
                                          ),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        height: 110, // Chiều cao của Container
                                        width: 200,  // Chiều rộng của Container
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Nền màu trắng cho container
                                          borderRadius: BorderRadius.circular(5), // Bo góc Container
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5), // Màu đổ bóng với độ mờ
                                              spreadRadius: 2, // Bán kính lan rộng của bóng
                                              blurRadius: 5, // Độ mờ của bóng
                                              offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                                            ),
                                          ],
                                        ),
                                        child:
                                        Row(
                                          children: [
                                            Image.asset('assets/raucu.png'),
                                            SizedBox(width: 20,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Text('Cải thìa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                                Text('20.000 VND/Kg')
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        height: 110, // Chiều cao của Container
                                        width: 200,  // Chiều rộng của Container
                                        decoration: BoxDecoration(
                                          color: Colors.white, // Nền màu trắng cho container
                                          borderRadius: BorderRadius.circular(5), // Bo góc Container
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5), // Màu đổ bóng với độ mờ
                                              spreadRadius: 2, // Bán kính lan rộng của bóng
                                              blurRadius: 5, // Độ mờ của bóng
                                              offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                                            ),
                                          ],
                                        ),
                                        child:
                                        Row(
                                          children: [
                                            Image.asset('assets/raucu.png'),
                                            SizedBox(width: 20,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Text('Cải thìa', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
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
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration:
                            BoxDecoration(
                              color: Colors.white,
                            ),
                          child:
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child:
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Nền màu trắng cho container
                                      borderRadius: BorderRadius.circular(5), // Bo góc Container
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5), // Màu đổ bóng với độ mờ
                                          spreadRadius: 2, // Bán kính lan rộng của bóng
                                          blurRadius: 5, // Độ mờ của bóng
                                          offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                                        ),
                                      ],
                                    ),
                                    child:
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/cachua.png'),
                                            SizedBox(width: 7,),
                                            Column(
                                              children: [
                                                Text('Cà chua', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                                Text('Loại cây: cây ăn quả'),
                                                Text('Cách trồng: Gieo hạt, tưới nước,...'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Nền màu trắng cho container
                                      borderRadius: BorderRadius.circular(5), // Bo góc Container
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5), // Màu đổ bóng với độ mờ
                                          spreadRadius: 2, // Bán kính lan rộng của bóng
                                          blurRadius: 5, // Độ mờ của bóng
                                          offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                                        ),
                                      ],
                                    ),
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/cachua.png'),
                                          SizedBox(width: 7,),
                                          Column(
                                            children: [
                                              Text('Cà chua', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                              Text('Loại cây: cây ăn quả'),
                                              Text('Cách trồng: Gieo hạt, tưới nước,...'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Nền màu trắng cho container
                                      borderRadius: BorderRadius.circular(5), // Bo góc Container
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5), // Màu đổ bóng với độ mờ
                                          spreadRadius: 2, // Bán kính lan rộng của bóng
                                          blurRadius: 5, // Độ mờ của bóng
                                          offset: Offset(0, 3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                                        ),
                                      ],
                                    ),
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/cachua.png'),
                                          SizedBox(width: 7,),
                                          Column(
                                            children: [
                                              Text('Cà chua', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                              Text('Loại cây: cây ăn quả'),
                                              Text('Cách trồng: Gieo hạt, tưới nước,...'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],

                              ),


                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Cộng đồng',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green, // Màu xanh đậm của nút trung tâm
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
            ),
            label: '', // Nút giữa không có nhãn
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset_mic),
            label: 'Chuyên gia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

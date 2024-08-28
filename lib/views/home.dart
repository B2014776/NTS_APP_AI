import 'package:apptestai/ultils/CustomBottomNavigationBar.dart';
import 'package:apptestai/ultils/CustomTextField.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../ultils/Custom_drawer.dart';
import 'camera.dart'; // Đảm bảo nhập đúng đường dẫn của file CustomDrawer

class HomePage extends StatefulWidget {
  // final CameraDescription camera;
  // const HomePage({required this.camera});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController search = TextEditingController();

  // Biến trạng thái có thể khai báo ở đây
  int _currentIndex = 0; // Giả sử Community là chỉ mục 1

  // Dummy CameraDescription để truyền vào CustomBottomNavigationBar
  final CameraDescription camera = const CameraDescription(
    name: 'camera',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 0,
  );

  void _onTap(int index) {
    // Thực hiện các hành động khi một mục được nhấn
    // Ví dụ: cập nhật chỉ mục hiện tại
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Gán GlobalKey cho Scaffold để điều khiển Drawer
      drawer: CustomDrawer(),
      // Đặt CustomDrawer ở đây
      floatingActionButton: SizedBox(
        width: 129.0,
        height: 46.0,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Row(
              children: [
                Image.asset('assets/Thongminh.png'),
                const Expanded(
                    child: Text(
                  'Trợ lý nhà nông',
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
        ),
      ),
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
                          _scaffoldKey.currentState
                              ?.openDrawer(); // Mở Drawer khi nhấn vào menu
                        },
                        icon: const Icon(
                          Icons.menu_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    children: [
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.black45,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Cần Thơ, Việt Nam',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '35°C',
                                        style: TextStyle(fontSize: 57),
                                      ), //cho de nhiet do
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Image.asset('assets/Cloud_and_sun.png'),
                                  //anhmattroi
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(150, 50),
                                        ),
                                        child: const Text(
                                          'Hôm nay',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 17,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xffffdce3),
                                          minimumSize: Size(150, 50),
                                        ),
                                        child: const Text(
                                          'Ngày mai',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 17,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          backgroundColor: Color(0xffCCFFCC),
                                          minimumSize: Size(150, 50),
                                        ),
                                        child: const Text(
                                          '10 ngày',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //homnay, ngaymai,...
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // Nền màu trắng cho container
                            borderRadius: BorderRadius.circular(5),
                            // Bo góc Container
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                // Màu đổ bóng với độ mờ
                                spreadRadius: 1,
                                // Bán kính lan rộng của bóng
                                blurRadius: 3,
                                // Độ mờ của bóng
                                offset: const Offset(0,
                                    3), // Vị trí của bóng (0 theo chiều ngang, 3 theo chiều dọc)
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Dự báo sâu bệnh hôm nay',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    Image.asset('assets/Sau_benh.png'),
                                    Expanded(
                                      child: Container(
                                        height: 120,
                                        // Đặt chiều cao cụ thể cho khung chứa văn bản
                                        child: const SingleChildScrollView(
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
                        const SizedBox(
                          height: 1,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // Nền màu trắng cho container
                            borderRadius: BorderRadius.circular(5),
                            // Bo góc Container
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Giá cả thị trường',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Cải thìa',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Cải thìa',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Cải thìa',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 168,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/cachua.png'),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              'Cà chua',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('Loại cây: cây ăn quả'),
                                            Text(
                                                'Cách trồng: Gieo hạt, tưới nước,...'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/cachua.png'),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              'Cà chua',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('Loại cây: cây ăn quả'),
                                            Text(
                                                'Cách trồng: Gieo hạt, tưới nước,...'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/cachua.png'),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              'Cà chua',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('Loại cây: cây ăn quả'),
                                            Text(
                                                'Cách trồng: Gieo hạt, tưới nước,...'),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Các loại sâu bệnh',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/Saubo2.png'),
                                              // Đường dẫn đến ảnh
                                              fit: BoxFit
                                                  .cover, // Tùy chọn hiển thị ảnh (cover, contain, etc.)
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Rầy nâu',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/Saubo3.png'),
                                              // Đường dẫn đến ảnh
                                              fit: BoxFit
                                                  .cover, // Tùy chọn hiển thị ảnh (cover, contain, etc.)
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Rầy nâu',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/Saubo4.png'),
                                              // Đường dẫn đến ảnh
                                              fit: BoxFit
                                                  .cover, // Tùy chọn hiển thị ảnh (cover, contain, etc.)
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Rầy nâu',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/Saubo5.png'),
                                              // Đường dẫn đến ảnh
                                              fit: BoxFit
                                                  .cover, // Tùy chọn hiển thị ảnh (cover, contain, etc.)
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Rầy nâu',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: 120,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/Saubo6.png'),
                                              // Đường dẫn đến ảnh
                                              fit: BoxFit
                                                  .cover, // Tùy chọn hiển thị ảnh (cover, contain, etc.)
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Rầy nâu',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Tìm kiếm",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: Icon(CupertinoIcons.search),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                  validator: (value) {
                    // Validation logic
                  },
                  // controller: controller,
                  // onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        camera: camera,
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

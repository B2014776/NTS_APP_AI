import 'package:apptestai/ultils/CustomBottomNavigationBar.dart';
import 'package:apptestai/ultils/CustomTextField.dart';
import 'package:apptestai/views/detection/widgets/market.dart';
import 'package:apptestai/views/home/market/cardMarketList.dart';

import 'package:apptestai/views/home/plant/Plant.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../ultils/Custom_drawer.dart';
import '../camera.dart';
import 'PestForecast/PestForecast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController search = TextEditingController();

  int _currentIndex = 0;

  // Dummy CameraDescription để truyền vào CustomBottomNavigationBar
  final CameraDescription camera = const CameraDescription(
    name: 'camera',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 0,
  );

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                          _scaffoldKey.currentState?.openDrawer();
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
                                          backgroundColor:
                                              const Color(0xffCCFFCC),
                                          minimumSize: const Size(150, 50),
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
                        PestForecast(),
                        const SizedBox(
                          height: 10,
                        ),
                        const cardMarketList(),
                        const SizedBox(
                          height: 10,
                        ),
                        Plant(),
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
                    labelText: "Nhập từ khóa ...",
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

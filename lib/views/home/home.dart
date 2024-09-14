import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import '../../ultils/CustomBottomNavigationBar.dart';
import '../../ultils/Custom_drawer.dart';
import 'MenuItems/Menuitems.dart';
import 'map/map.dart';
import 'market/cardMarketList.dart';
import 'news/News.dart';
import 'plant/Plant.dart';
import 'weather/weather.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController searchController = TextEditingController();
  int _currentIndex = 0;

  final CameraDescription camera = const CameraDescription(
    name: 'camera',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 0,
  );

  final ImagePicker _picker = ImagePicker();

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      print('Image path: ${image.path}');
    }
  }

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      print('Image path: ${image.path}');
    }
  }

  Future<void> login() async {
    Dio dio = Dio();
    Map<String, dynamic> data = {
      "username": "batungx271@gmail.com",
      "password": "12345678"
    };

    try {
      Response response = await dio.post(
        'https://api-ai-1-6b81.onrender.com/auth/signin',
        data: data,
      );

      print('Response data: ${response.data}');
    } catch (e) {
      // In ra lỗi nếu có
      print('Error: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: login,
            backgroundColor: Colors.green,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _openGallery,
            backgroundColor: Colors.blue,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Icon(Icons.photo_library, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.green, Colors.teal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      'assets/logo_ver2.png',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    Stack(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          right: 9,
                          top: 5,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: const Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Weather(),
                      const SizedBox(height: 16),
                      const Menuitems(),
                      const SizedBox(height: 16),
                      const CardMarketList(),
                      const SizedBox(height: 16),
                      const Plant(),
                      const SizedBox(height: 16),
                      NewsPage(),
                      // DiseaseMapPage()
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: "Nhập từ khóa ...",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(CupertinoIcons.search),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        camera: camera,
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

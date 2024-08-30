import 'package:apptestai/views/home/plant/Plant.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../ultils/CustomBottomNavigationBar.dart';
import '../../ultils/Custom_drawer.dart';
import 'PestForecast/PestForecast.dart';
import 'market/cardMarketList.dart';
import 'weather/weather.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController searchController = TextEditingController();

  int _currentIndex = 0;

  // Dummy CameraDescription to pass to CustomBottomNavigationBar
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
      floatingActionButton: SizedBox(
        // width: 130.0,
        // height: 50.0,
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.white,
          // elevation: 4,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15.0), // Softer corners
          //   side: const BorderSide(color: Colors.black26), // Lighter border
          // ),
          icon: Image.asset('assets/Thongminh.png'),
          label: const Text(
            '',
            // style: TextStyle(
            //   color: Colors.black,
            //   fontWeight: FontWeight.bold,
            //   fontSize: 14,
            // ),
          ),
        ),
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
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/iconNTLogo.svg',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Weather(),
                      SizedBox(height: 16),
                      PestForecast(),
                      SizedBox(height: 16),
                      CardMarketList(),
                      SizedBox(height: 16),
                      Plant(),
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
                borderRadius: BorderRadius.circular(30), // Softer rounded corners
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

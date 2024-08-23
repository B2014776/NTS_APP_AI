import 'package:flutter/material.dart';
import 'package:apptestai/controllers/profile/AccountController.dart';
import 'package:apptestai/views/profile/widgets/AccountInfoCard.dart';
import '../../ultils/CustomBottomNavigationBar.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final UserController _controller = UserController();
  bool _isLoading = true;
  String _userName = '';
  String _email = '';
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    await _controller.fetchUserFromAPI();
    setState(() {
      _userName = _controller.user?.name ?? 'N/A';
      _email = _controller.user?.email ?? 'N/A';
      _phoneNumber = _controller.user?.phoneNumber ?? 'N/A';
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // AppBar background
          Container(
            height: 150,
            color: Colors.green,
          ),

          // Positioned AccountInfoCard
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : AccountInfoCard(
              userName: _userName,
              email: _email,
              phoneNumber: _phoneNumber,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4, // Tài khoản là mục thứ 5
        onTap: (index) {
          // Xử lý chuyển trang khi bấm vào các mục khác của bottom navigation
        },
      ),
    );
  }
}

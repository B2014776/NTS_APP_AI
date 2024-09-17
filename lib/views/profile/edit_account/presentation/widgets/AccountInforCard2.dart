import 'package:apptestai/models/UserModel.dart';
import 'package:apptestai/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'function.dart';

class AccountInfoCard2 extends StatefulWidget {
  User user = User(
    name: 'Ba Tung',
    email: 'Tung@Tung.com',
    phoneNumber: '0123456789',
    avatarUrl: 'assets/avatar.jpg',
    dateOfBirth: '1990-01-01', // Ngày sinh giả
    gender: 'Nam', // Giới tính giả
  );

  AccountInfoCard2({required this.user});

  @override
  _AccountInfoCard2State createState() => _AccountInfoCard2State();
}

class _AccountInfoCard2State extends State<AccountInfoCard2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    'assets/${widget.user.avatarUrl}',
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chào ${widget.user.name}', style: const TextStyle(fontSize: 16),),
                    Text('${widget.user.phoneNumber}', style: const TextStyle(fontSize: 12, color: Colors.green),),
                    Text('${widget.user.email}', style: const TextStyle(fontSize: 12, color: Colors.green),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15,),

            // Use a Container to wrap the ListView and define its height
            CustomMenuItem(
              icon: Icons.edit_calendar,
              functionName: 'Thông tin cá nhân',
              nextIcon: Icons.arrow_forward_ios,
              onTap: () {
                Get.toNamed(Routes.editAccount);
              },
            ),
            CustomMenuItem(
              icon: Icons.lock_outline_rounded,
              functionName: 'Đổi mật khẩu',
              nextIcon: Icons.arrow_forward_ios,
              onTap: () {
                // Handle tap action
              },
            ),
          ],
        ),
      ),
    );
  }
}

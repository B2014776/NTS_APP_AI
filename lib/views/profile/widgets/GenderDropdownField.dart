import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/EditAccountController.dart';

class GenderDropdownField extends StatelessWidget {
  final EditAccountController controller;

  GenderDropdownField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: Row(
        children: [
          Icon(Icons.transgender_outlined, color: Colors.green, size: 20),
          SizedBox(width: 15),
          Expanded(
            child: Obx(() {
              return Text(
                controller.gender.value.isNotEmpty ? controller.gender.value : 'Giới tính',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              );
            }),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.arrow_drop_down, color: Colors.green, size: 30),
            onSelected: (String value) {
              controller.gender.value = value;
              controller.validateForm();
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Nam',
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Nam', style: TextStyle(fontSize: 16)),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Nữ',
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Nữ', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}

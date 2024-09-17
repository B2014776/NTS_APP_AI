import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/EditAccountController.dart';

class UsernameField extends StatefulWidget {
  final EditAccountController controller;

  UsernameField({required this.controller});

  @override
  _UsernameFieldState createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Obx(() {
            return TextField(
              controller: TextEditingController(text: widget.controller.username.value),
              onChanged: (value) {
                widget.controller.username.value = value;
                widget.controller.validateForm();
              },
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                hintText: 'Tên tài khoản',
                hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.green,
                  size: 20,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            );
          }),
        ),
        Obx(() {
          if (widget.controller.username.value.isNotEmpty &&
              !widget.controller.isUsernameValid.value) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: Text(
                'Tên tài khoản không hợp lệ',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        }),
      ],
    );
  }
}

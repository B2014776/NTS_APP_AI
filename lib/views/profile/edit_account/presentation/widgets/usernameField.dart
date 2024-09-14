import 'package:apptestai/views/profile/edit_account/presentation/controller/edit_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              controller: TextEditingController(text: widget.controller.userName.value.text),
              onChanged: (value) {
                widget.controller.userName.value.text = value;
                widget.controller.validateForm();
              },
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
              cursorColor: Colors.black45,
              decoration: const InputDecoration(
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
          if (widget.controller.userName.value.text.isNotEmpty &&
              !widget.controller.isUsernameValid.value) {
            return const Padding(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: Text(
                'Tên tài khoản không hợp lệ',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ],
    );
  }
}

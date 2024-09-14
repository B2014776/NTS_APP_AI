import 'package:apptestai/views/profile/edit_account/presentation/controller/edit_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailField extends StatefulWidget {
  final EditAccountController controller;

  EmailField({required this.controller});

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
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
              controller: TextEditingController(text: widget.controller.emailInput.value.text),
              onChanged: (value) {
                widget.controller.emailInput.value.text = value;
                widget.controller.validateForm();
              },
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
              cursorColor: Colors.black45,
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.mail_outline,
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
          if (!widget.controller.isEmailValid.value && widget.controller.emailInput.value.text.isNotEmpty) {
            return const Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: const Text(
                'Email không hợp lệ',
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

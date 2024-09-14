import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/EditAccountController.dart';

class PhoneField extends StatelessWidget {
  final EditAccountController controller;

  PhoneField({required this.controller});

  @override
  Widget build(BuildContext context) {
    // Tạo TextEditingController và đồng bộ với giá trị từ controller
    TextEditingController textController = TextEditingController(text: controller.phone.value);

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
            // Cập nhật text controller với giá trị mới từ controller.phone
            textController.value = TextEditingValue(
              text: controller.phone.value,
              selection: TextSelection.fromPosition(
                TextPosition(offset: controller.phone.value.length),
              ),
            );

            return TextField(
              controller: textController,  // Đồng bộ hóa với controller
              keyboardType: TextInputType.number,
              onChanged: (value) {
                controller.phone.value = value;
                controller.validateForm();  // Gọi validate form khi giá trị thay đổi
              },
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                hintText: 'Số điện thoại',
                hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.phone_in_talk,
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
          if (!controller.isPhoneValid.value && controller.phone.value.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: Text(
                'Số điện thoại không hợp lệ',
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

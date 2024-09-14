import 'package:apptestai/views/profile/edit_account/presentation/controller/edit_account_controller.dart';
import 'package:flutter/material.dart';

// Đảm bảo đường dẫn chính xác

class BirthdayPicker extends StatefulWidget {
  final EditAccountController controller;

  BirthdayPicker({required this.controller});

  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  void _selectBirthday(BuildContext context) async {
    // Show a DatePicker to select the date
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.controller.birthday.value.isNotEmpty
          ? DateTime.parse(widget.controller.birthday.value)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        widget.controller.birthday.value = '${selectedDate.toLocal()}'.split(' ')[0]; // Format date as yyyy-mm-dd
        widget.controller.validateForm();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: GestureDetector(
        onTap: () => _selectBirthday(context),
        child: Row(
          children: [
            const Icon(Icons.calendar_today_outlined, color: Colors.green, size: 20),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                widget.controller.birthday.value.isEmpty
                    ? 'Chọn ngày sinh'
                    : widget.controller.birthday.value,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

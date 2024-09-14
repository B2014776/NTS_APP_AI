import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/auth/EditAccountController.dart';

class LocationInput extends StatefulWidget {
  final EditAccountController controller;

  LocationInput({required this.controller});

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController(text: widget.controller.location.value);
    widget.controller.location.listen((value) {
      if (_locationController.text != value) {
        _locationController.text = value;
      }
    });
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        controller: _locationController,
        onChanged: (value) {
          widget.controller.location.value = value;
          widget.controller.validateForm();
        },
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey[800],
        ),
        cursorColor: Colors.black45,
        decoration: InputDecoration(
          hintText: 'Địa chỉ',
          hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
          prefixIcon: const Icon(
            Icons.location_on,
            color: Colors.green,
            size: 20,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}


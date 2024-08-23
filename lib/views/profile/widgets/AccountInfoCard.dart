import 'package:flutter/material.dart';

class AccountInfoCard extends StatelessWidget {
  final String userName;
  final String email;
  final String phoneNumber;

  AccountInfoCard({required this.userName, required this.email, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $userName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone number: $phoneNumber',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

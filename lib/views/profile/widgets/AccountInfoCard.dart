import 'package:flutter/material.dart';
import '../../../models/UserModel.dart';

class AccountInfoCard extends StatefulWidget {
  final User user;

  AccountInfoCard({required this.user});

  @override
  _AccountInfoCardState createState() => _AccountInfoCardState();
}

class _AccountInfoCardState extends State<AccountInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,0.0, 0.0, 0.0 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.user.name}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.grey),
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,0.0, 0.0, 0.0 ),
                    child: Text(
                      '${widget.user.email}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,0.0, 0.0, 0.0 ),
                    child: Text(
                      '${widget.user.phoneNumber}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
          Positioned(
            top: -35,
            left: MediaQuery.of(context).size.width / 2 - 175,
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                'assets/${widget.user.avatarUrl}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

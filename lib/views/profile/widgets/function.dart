import 'package:flutter/material.dart';

class CustomMenuItem extends StatelessWidget {
  final IconData icon;
  final String functionName;
  final IconData nextIcon;
  final VoidCallback onTap;

  CustomMenuItem({
    required this.icon,
    required this.functionName,
    required this.nextIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.grey),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 20.0, color: Colors.green,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    functionName,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              Icon(nextIcon, size: 15.0, color: Colors.grey,),
            ],
          ),
        ),
      ),
    );
  }
}

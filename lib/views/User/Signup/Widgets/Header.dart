import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(80, 50, 80, 20),
            color: const Color(0xff1ECC44),
            height: 120,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/iconNTLogo.svg',
                  width: 65,
                  height: 65,
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Text(
                    'NTAGRI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

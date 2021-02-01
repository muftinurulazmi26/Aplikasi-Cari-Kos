import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const BottomNavBar({Key key, this.imageUrl, this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : Container()
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Ⓒ 2024 MovieTMDBWeb all rights reserved',
          style: TextStyle(
              color: Colors.white, fontSize: 8, fontWeight: FontWeight.w100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ), // 사진넣기
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('About Us',
                  style: TextStyle(color: Colors.white, fontSize: 5)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('privacy Policy',
                  style: TextStyle(color: Colors.white, fontSize: 5)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Terms of Service',
                  style: TextStyle(color: Colors.white, fontSize: 5)),
            )
          ],
        )
      ],
    ));
  }
}

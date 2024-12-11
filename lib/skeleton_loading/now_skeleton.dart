import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NowSkeleton extends StatelessWidget {
  const NowSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
          shrinkWrap: true,
          physics:
              const AlwaysScrollableScrollPhysics(), // 리스트가 꽉차지 않아도 항상 스크롤 가능하게함
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              // 자동으로 가능한 너비 설정
              leading: Container(
                color: Colors.grey[800],
                width: 80,
                height: 120,
              ),
              title: Container(
                height: 20,
                color: Colors.grey[800],
              ),
              subtitle: Container(
                color: Colors.grey[800],
                height: 40,
              ),
            );
          }),
    );
  }
}

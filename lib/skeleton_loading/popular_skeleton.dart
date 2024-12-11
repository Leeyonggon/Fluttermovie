import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularSkeleton extends StatelessWidget {
  const PopularSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, //1개행에 보여줄 item개수
              childAspectRatio: 0.8,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Expanded(
                      // Container가 모든 공간 차지
                      child: Container(color: Colors.grey[800]),
                    )
                  ],
                ),
              );
            }));
  }
}

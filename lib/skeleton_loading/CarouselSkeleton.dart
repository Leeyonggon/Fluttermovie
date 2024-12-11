import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarouselSkeleton extends StatelessWidget {
  const CarouselSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: CarouselSlider(
            items: List.generate(5, (index) {
              return Container(
                color: Colors.grey[800],
              );
            }),
            options: CarouselOptions(
                height: 400,
                autoPlay: true,
                aspectRatio: 16 / 9, //슬라이더 가로세로 비율 기본값
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1), // 재생주기
                enableInfiniteScroll: true, //무한 스크롤
                pageSnapping: true, // 스와핑
                enlargeCenterPage: true,
                viewportFraction: 1.0 //슬라이드 화면 너비 설정
                )));
  }
}

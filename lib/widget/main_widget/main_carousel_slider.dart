import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fmoviepage/model/movie_model.dart';

class MainCarouselSlider extends StatelessWidget {
  final List<MovieModel> topratedMovies;
  const MainCarouselSlider({super.key, required this.topratedMovies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: topratedMovies.map((m) {
          return GestureDetector(
            onTap: () {},
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${m.backdropPath}',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          );
        }).toList(),
        options: CarouselOptions(
            height: 400,
            autoPlay: true,
            aspectRatio: 16 / 9, //슬라이더 가로세로 비율 기본값
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1), // 재생주기
            enableInfiniteScroll: true, //무한 스크롤
            pageSnapping: true, // 스와핑
            enlargeCenterPage: true,
            viewportFraction: 1.0));
  }
}

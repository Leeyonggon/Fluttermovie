import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fmoviepage/data/movie_data.dart';
import 'package:fmoviepage/footer/footer.dart';
import 'package:fmoviepage/model/movie_model.dart';
import 'package:fmoviepage/skeleton_loading/carouselSkeleton.dart';
import 'package:fmoviepage/skeleton_loading/now_skeleton.dart';
import 'package:fmoviepage/skeleton_loading/popular_skeleton.dart';
import 'package:fmoviepage/widget/icon_searchbar.dart';
import 'package:fmoviepage/widget/main_drawer.dart';
import 'package:fmoviepage/widget/main_widget/main_carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> _topratedMovie = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //스켈레톤 UI가 먼저 랜더링되고 data 로딩하고 실행하는 코드
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMovieData();
    });
  }

  getMovieData() async {
    var data = MovieData();
    _topratedMovie = await data.fetchTopRatedMovie();
    setState(() {
      isLoading = false;
    });
    print(_topratedMovie[0].originalTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconSearchbar(),
      drawer: const Maindrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Top rated movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: isLoading
                        ? const CarouselSkeleton()
                        : MainCarouselSlider(topratedMovies: _topratedMovie),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Now Playing",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      NowSkeleton(),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Explore popular movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(builder: (context, constraints) {
                // layoutbuilder를 사용하면 부모크기에 따라 다른 layout을 선택적으로 나오게 할 수 있음
                double GridviewHeight = (constraints.maxWidth / 5) *
                    1.3 *
                    4; // 화면의 최대 넓이를 5로 나눔(5개씩 배열)/ *1을 하면 정사각형(점차 커지면 직사각형)/ *4 는 그리드 뷰가 4줄이라 가정하고 전체 gridview의 높이 계산하기 위함
                return SizedBox(
                  height: GridviewHeight,
                  child: const PopularSkeleton(),
                );
              }),
            ),
            const Footer()
          ],
        ),
      ),
    );
  }
}

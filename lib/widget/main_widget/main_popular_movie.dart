import 'package:flutter/material.dart';
import 'package:fmoviepage/model/movie_model.dart';

class MovieGridView extends StatefulWidget {
  final List<MovieModel> popularMovie;
  const MovieGridView({super.key, required this.popularMovie});

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  int? hoverIndex;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 0.8),
        itemCount: widget.popularMovie
            .length, //popularMovie 객체가 statefull위젯의 속성으로 생성되어있으므로 widget속성을 사용하여 접근
        itemBuilder: (context, index) {
          final movie = widget.popularMovie[index];
          return MouseRegion(
              onEnter: (event) {},
              onExit: (event) {},
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                transform: hoverIndex == index
                    ? (Matrix4.identity()
                          ..scale(1.05, 1.05)
                          ..translate(0, -10) //스케일링,회전, 이동및 기울이기등 기하하적 변화 표시함
                        )
                    : Matrix4.identity(),
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      elevation: hoverIndex == index ? 20 : 4, //입체감을 주기 위함
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200,
                                )),
                          ),
                          Expanded(
                              child: ListView(
                            padding: const EdgeInsets.all(8),
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(movie.voteAverage.toString()),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Language: ${movie.originalLanguage}'),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text('Adult: ${movie.adult ? 'Yes' : 'No'}')
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}

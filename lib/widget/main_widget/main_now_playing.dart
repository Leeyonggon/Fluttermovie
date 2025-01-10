import 'package:flutter/material.dart';
import 'package:fmoviepage/model/movie_model.dart';

class NowPlayingMovie extends StatelessWidget {
  final List<MovieModel> nowPlayingmovie;
  const NowPlayingMovie({super.key, required this.nowPlayingmovie});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: nowPlayingmovie.length,
        itemBuilder: (context, index) {
          final movie = nowPlayingmovie[index];
          return ListTile(
            onTap: () {},
            leading: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                width: 80,
                height: 120,
                fit: BoxFit.cover),
            title: Text(
              movie.title,
              style: const TextStyle(color: Colors.amber),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              movie.overview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        });
  }
}

import 'dart:convert';

import 'package:fmoviepage/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieData {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  final String bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZjY4MmY2M2MyM2RmZjMzMGRiYTk2Y2E3MWJjYTBiYSIsIm5iZiI6MTczMzg3NTY1MS4zMTksInN1YiI6IjY3NThkN2MzMGIxNWJkYjllYzFmMmM3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KCmuV6NoxTE6OZzzoA0d3C3Ws-nmW_2OGRuJmUvmbaM';

  Future<List<MovieModel>> fetchTopRatedMovie() async {
    final response = await http.get(
      Uri.parse('$baseUrl/top_rated?language=en-US&page=1'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ((jsonDecode(response.body)['result'])
              as List) //List타입으로 캐스팅 => list에서 제공하는 map메소드를 사용하여 다른 메소드 호출
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load movie data");
    }
  }
}

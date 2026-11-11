import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure_data/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure_data/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDb movieDb) => Movie(
    adult: movieDb.adult,
    backdropPath: movieDb.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
        : 'https://mmpizzeria.com/wp-content/uploads/2020/05/keep-calm-i-m-not-available-34297_600x675.png',
    genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath: movieDb.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
        : 'no-poster',
    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );

  static Movie movieDetailsToEntity(MovieDetails movieDetails) => Movie(
    adult: movieDetails.adult,
    backdropPath: movieDetails.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}'
        : 'https://mmpizzeria.com/wp-content/uploads/2020/05/keep-calm-i-m-not-available-34297_600x675.png',
    genreIds: movieDetails.genres.map((e) => e.name.toString()).toList(),
    id: movieDetails.id,
    originalLanguage: movieDetails.originalLanguage,
    originalTitle: movieDetails.originalTitle,
    overview: movieDetails.overview,
    popularity: movieDetails.popularity,
    posterPath: movieDetails.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}'
        : 'no-poster',
    releaseDate: movieDetails.releaseDate,
    title: movieDetails.title,
    video: movieDetails.video,
    voteAverage: movieDetails.voteAverage,
    voteCount: movieDetails.voteCount,
  );
}

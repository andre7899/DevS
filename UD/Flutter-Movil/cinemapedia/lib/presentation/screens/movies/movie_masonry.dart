import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movieList;
  final Future<List<Movie>> Function()? loadNextPage;
  const MovieMasonry({super.key, required this.movieList, this.loadNextPage});

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {
  bool isLastPage = false;
  bool isLoading = false;
  final scrollcontroller = ScrollController();

  @override
  void initState() {
    scrollcontroller.addListener(() {
      // if(widget.loadNextPage ==null)return;
      if (scrollcontroller.position.pixels >=
          scrollcontroller.position.maxScrollExtent - 200) {
        loadNextPageMovies();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void loadNextPageMovies() async {
    if (isLoading || isLastPage) return;
    if (widget.loadNextPage == null) return;
    isLoading = true;
    final movies = await widget.loadNextPage!();
    isLoading = false;
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const .symmetric(horizontal: 10),
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      controller: scrollcontroller,
      itemCount: widget.movieList.length,
      itemBuilder: (context, index) {
        final movie = widget.movieList[index];
        final child = MoviePosterLink(movie: movie);
        if (index == 1) {
          return Padding(padding: const .only(top: 20), child: child);
        }
        return child;
      },
    );
  }
}

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/movie/${movie.id}'),
      child: ClipRRect(
        borderRadius: .circular(20),
        child: Image.network(movie.posterPath),
      ),
    );
  }
}

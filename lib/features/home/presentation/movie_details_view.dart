import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/home/data/models/movies_dto.dart';

class MovieDetailsView extends StatelessWidget {
  final Results movie;
  const MovieDetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MovieDetailsBody(movie: movie));
  }
}

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
    required this.movie,
  });

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.0),
              ],
              stops: [0.0, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.dstIn,
          child: CachedNetworkImage(
            imageUrl: "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
            fit: BoxFit.fill,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
              fit: BoxFit.fill,
              width: 100,
              height: 150,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        )
      ],
    );
  }
}

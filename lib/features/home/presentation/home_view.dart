import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/home/data/models/movies_dto.dart';
import 'package:flutter_application_2/features/home/domain/repo/moveis_repository.dart';
import 'package:flutter_application_2/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_2/features/home/presentation/movie_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});

  final PagingController<int, Results> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit(GetIt.I.get<Moviesrepository>());

        _pagingController.addPageRequestListener((pageKey) {
          cubit.fetchMovies(pageKey);
        });

        return cubit;
      },
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          return PagedGridView<int, Results>(
              padding: const EdgeInsets.all(8),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, item, index) =>
                      MovieCard(movie: item)),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 200,
              ));
        },
        listener: (contex, state) {
          if (state is HomeStateSuccess) {
            final isLastPage = state.movies.length < 19;

            if (isLastPage) {
              _pagingController.appendLastPage(state.movies);
            } else {
              final nextPageKey = _pagingController.nextPageKey! + 1;
              _pagingController.appendPage(state.movies, nextPageKey);
            }
          } else if (state is HomeStateFailure) {
            _pagingController.error = state.errMessage;
          }
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Results movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => MovieDetailsView(movie: movie)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

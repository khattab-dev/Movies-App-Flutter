import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/home/domain/repo/moveis_repository.dart';
import 'package:flutter_application_2/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => HomeCubit(GetIt.I.get<Moviesrepository>()),
      child: const HomeViewBody(),
    ));
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().fetchMovies();

    return Center(child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeStateSuccess) {
          return ListView.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              final movie = state.movies[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          );
        } else {
          return const Text("");
        }
      },
    ));
  }
}

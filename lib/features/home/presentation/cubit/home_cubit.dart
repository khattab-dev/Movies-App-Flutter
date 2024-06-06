import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/features/home/data/models/movies_dto.dart';
import 'package:flutter_application_2/features/home/domain/repo/moveis_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Moviesrepository repo;
  HomeCubit(this.repo) : super(HomeStateInitial());

  Future<void> fetchMovies(int pageKey) async {
    emit(HomeStateLoading());
    var result = await repo.fetchMovies(pageKey);
    result.fold((failure) {
      emit(HomeStateFailure(failure.errMessage));
    }, (movies) {
      emit(HomeStateSuccess(movies.results));
    });
  }
}

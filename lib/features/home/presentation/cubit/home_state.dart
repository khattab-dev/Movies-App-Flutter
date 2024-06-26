part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeStateInitial extends HomeState {}

final class HomeStateLoading extends HomeState {}

final class HomeStateFailure extends HomeState {
  final String errMessage;

  HomeStateFailure(this.errMessage);
}

final class HomeStateSuccess extends HomeState {
  final List<Results> movies;

  HomeStateSuccess(this.movies);
}

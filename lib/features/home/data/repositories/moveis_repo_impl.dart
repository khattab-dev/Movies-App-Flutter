import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/api_service.dart';
import 'package:flutter_application_2/core/services/failure.dart';
import 'package:flutter_application_2/features/home/data/models/movies_dto.dart';
import 'package:flutter_application_2/features/home/domain/repo/moveis_repository.dart';

class MoveisRepoImpl extends Moviesrepository {
  final ApiService apiService;

  MoveisRepoImpl(this.apiService);

  @override
  Future<Either<Failure, MoviesDTO>> fetchMovies() async {
    try {
      var data = await apiService.get(endPoint: 'discover/movie');
      MoviesDTO moviesDTO = MoviesDTO.fromJson(data);
      return right(moviesDTO);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

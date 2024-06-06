import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/services/failure.dart';
import 'package:flutter_application_2/features/home/data/models/movies_dto.dart';

abstract class Moviesrepository {
  Future<Either<Failure, MoviesDTO>> fetchMovies();
}

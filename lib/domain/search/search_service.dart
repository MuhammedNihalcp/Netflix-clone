import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/faliures/main_faliures.dart';

import 'model/search_repo/search_repo/search_repo.dart';

abstract class SearchService {
  Future<Either<MainFaliures, SearchRepo>> searchMovies({
    required String movieQuery,
  });
}

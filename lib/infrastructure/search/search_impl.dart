import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/api_ends_points.dart';
import 'package:netflix_clone/domain/search/model/search_repo/search_repo/search_repo.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/core/faliures/main_faliures.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFaliures, SearchRepo>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': movieQuery});

      //  log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchRepo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFaliures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFaliures.clientFailure());
    }
  }
}

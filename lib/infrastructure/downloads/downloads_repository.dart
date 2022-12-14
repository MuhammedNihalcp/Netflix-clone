import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_ends_points.dart';
import 'package:netflix_clone/domain/core/faliures/main_faliures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFaliures, List<Downloads>>> getDownloadImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        // print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left( MainFaliures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFaliures.clientFailure());
    }
  }
}
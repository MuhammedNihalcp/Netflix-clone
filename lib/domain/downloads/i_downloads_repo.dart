import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/faliures/main_faliures.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo{
  Future<Either<MainFaliures, List<Downloads>>> getDownloadImages();
}
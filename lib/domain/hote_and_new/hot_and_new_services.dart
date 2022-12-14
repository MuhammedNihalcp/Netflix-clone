import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/faliures/main_faliures.dart';
import 'package:netflix_clone/domain/hote_and_new/hotand_new_resp/hotand_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFaliures, HotandNewResp>> getHotAndNewMovieData();

  Future<Either<MainFaliures, HotandNewResp>> getHotAndNewTvData();
}

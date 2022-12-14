// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/faliures/main_faliures.dart';
import 'package:netflix_clone/domain/hote_and_new/hot_and_new_services.dart';
import 'package:netflix_clone/domain/hote_and_new/hotand_new_resp/hotand_new_resp.dart';


part 'homepage_event.dart';
part 'homepage_state.dart';
part 'homepage_bloc.freezed.dart';

@injectable
class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final HotAndNewService _homeService;

  HomepageBloc(this._homeService) : super(HomepageState.initial()) {
    //get  homeScreen  data
    on<GetHomeScreenData>((event, emit) async {
      //send loading to ui

      emit(state.copyWith(isLoading: true, hasError: false));

      //get data
      final movieResult = await _homeService.getHotAndNewMovieData();
      final tvResult = await _homeService.getHotAndNewTvData();

      //transform data to state

      final state1 = movieResult.fold((MainFaliures failure) {
        return HomepageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            treandingNowList: [],
            tensDramasMovieList: [],
            southIndianMovieList: [],
            trendingtvList: [],
            isLoading: false,
            hasError: true);
      }, (HotandNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;
        final dramas = resp.results;
        final southindian = resp.results;

        pastYear.shuffle();
        trending.shuffle();
        dramas.shuffle();
        southindian.shuffle();
        return HomepageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            treandingNowList: trending,
            tensDramasMovieList: dramas,
            southIndianMovieList: southindian,
            trendingtvList: state.trendingtvList,
            isLoading: false,
            hasError: false);
      });
      emit(state1);

      final state2 = tvResult.fold((MainFaliures failure) {
        return HomepageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            treandingNowList: [],
            tensDramasMovieList: [],
            southIndianMovieList: [],
            trendingtvList: [],
            isLoading: false,
            hasError: true);
      }, (HotandNewResp resp) {
        final top10List = resp.results;
        return HomepageState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            treandingNowList: state.treandingNowList,
            tensDramasMovieList: state.tensDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingtvList: top10List,
            isLoading: false,
            hasError: false);
      });

      //send data to ui
      emit(state2);
    });
  }
}

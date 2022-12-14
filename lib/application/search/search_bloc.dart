import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/model/search_repo/search_repo/search_repo.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/core/faliures/main_faliures.dart';


part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
//idle State
    on<Initialize>((event, emit) async {
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      // get trending movies
      final result = await _downloadsService.getDownloadImages();
      final state = result.fold((MainFaliures f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      //show to ui
      emit(state);
    });

//searching State
    on<SearchMovie>(((event, emit) async {
      //call search movie
      log('Searchig for ${event.movieQuery}');
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final state = result.fold((MainFaliures l) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchRepo r) {
        return SearchState(
            searchResultList: r.results!,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      emit(state);
    }));
  }
}

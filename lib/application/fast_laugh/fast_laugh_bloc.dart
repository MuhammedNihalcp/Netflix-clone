// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';


part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideosUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4'
];

ValueNotifier<Set<int>> likedVideosNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(const FastLaughState(
        //sending loading to ui
        videosList: [],
        isLoading: true,
        isError: false,
      ));
      // get trending videos
      final result = await downloadService.getDownloadImages();
      final state = result.fold((l) {
        return const FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        );
      }, (resp) {
        return FastLaughState(
          videosList: resp,
          isLoading: false,
          isError: false,
        );
      });

      //send to ui

      emit(state);
    });

    on<LikeVideo>((event, emit) async {
      likedVideosNotifier.value.add(event.videoId);
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      likedVideosNotifier.notifyListeners();
    });
    on<UnLikeVedio>((event, emit) async {
      likedVideosNotifier.value.remove(event.videoId);
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      likedVideosNotifier.notifyListeners();
    });
  }
}

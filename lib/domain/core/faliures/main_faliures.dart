// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_faliures.freezed.dart';

@freezed
class MainFaliures with _$MainFaliures {
  const factory MainFaliures.clientFailure() = _ClientFailure;
  const factory MainFaliures.serverFailure() = _serverFailure;
}


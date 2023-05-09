import 'dart:io';

import 'package:clean_line/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class CameraState with _$CameraState {

  const factory CameraState.initial() = Initial;

  const factory CameraState.loading() = Loading;

  const factory CameraState.photo({required File? image}) = Photo;

  const factory CameraState.empty() = Empty;

  const factory CameraState.error(Failure failure) = Error;
}
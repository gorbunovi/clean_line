
import 'package:clean_line/core/error/failure.dart';
import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.catalog({required List<ImageModel> imagesList}) = Catalog;

  const factory HomeState.photo({required ImageModel image}) = Photo;

  const factory HomeState.empty() = Empty;

  const factory HomeState.error(Failure failure) = Error;
}
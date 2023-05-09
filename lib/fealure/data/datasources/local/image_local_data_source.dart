import 'dart:convert';
import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/core.dart';

abstract class ImageLocalDataSourse{
  Future<List<ImageModel>> getLocalImagesList();
  Future<void> setLocalImagesList(List<ImageModel> imagesList);
}


class ImagesLocalDataSourceImpl implements ImageLocalDataSourse{
  final SharedPreferences sharedPreferences;

  ImagesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ImageModel>> getLocalImagesList() async{
    final jsonImagesList = sharedPreferences.getStringList(LocalDataSource.IMAGES_LIST);
    if(jsonImagesList != null){
      return Future.value(jsonImagesList.map((image) => ImageModel.fromJson(json.decode(image))).toList());
    }else{
      return [];
      }
  }

  @override
  Future<void> setLocalImagesList(List<ImageModel> imagesList) async {
    final List<String> jsonImagesList =
      imagesList.map((image) =>
      json.encode(image.toJson())).toList();
    sharedPreferences.setStringList(LocalDataSource.IMAGES_LIST, jsonImagesList);
  }
}
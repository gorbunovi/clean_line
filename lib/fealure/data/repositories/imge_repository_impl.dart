import 'dart:io';

import 'package:clean_line/core/error/exception.dart';
import 'package:clean_line/core/error/failure.dart';
import 'package:clean_line/fealure/data/datasources/local/image_local_data_source.dart';
import 'package:clean_line/fealure/data/datasources/remote/image_remote_data_source.dart';
import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:clean_line/fealure/domain/repositories/image_repository.dart';
import 'package:dartz/dartz.dart';

class ImageRepositoryImpl implements ImageRepository{
  ImageRepositoryImpl({
    required this.imageLocalDataSourse,
    required this.imageRemoteDataSourse
  });

  final ImageLocalDataSourse imageLocalDataSourse;
  final ImageRemoteDataSourse imageRemoteDataSourse;


  @override
  Future<Either<Failure, List<ImageModel>>> getImagesList() async{
    try {
      final imagesList = await imageLocalDataSourse.getLocalImagesList();
      return Right(imagesList);
    } on CacheException {
      return Left(CacheFailure(''));
    }
  }

  @override
  Future<Either<Failure, void>> uploadImage(File image) async{
    try {
      final imagesModel = await imageRemoteDataSourse.uploadRemoteImage(image);
      if(imagesModel != null){
        final imagesList = await imageLocalDataSourse.getLocalImagesList();
        imagesList.add(imagesModel);
        await imageLocalDataSourse.setLocalImagesList(imagesList);
      }
      return Right(true);
    } on CacheException {
      return Left(CacheFailure(''));
    }
  }
}
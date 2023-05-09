

import 'dart:io';

import 'package:clean_line/core/error/failure.dart';
import 'package:clean_line/core/usecase/usecase.dart';
import 'package:clean_line/fealure/domain/repositories/image_repository.dart';
import 'package:dartz/dartz.dart';


class UploadImage extends UseCaseNoType<File>{
  UploadImage({required this.imageRepository});

  final ImageRepository imageRepository;

  @override
  Future<Either<Failure, void>> call(File image) async {
    try{
      return imageRepository.uploadImage(image);
    } catch(e){
      return Left(CacheFailure(e.toString()));
    }
  }
}
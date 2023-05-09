import 'dart:io';
import 'package:clean_line/core/error/failure.dart';
import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:dartz/dartz.dart';

abstract class ImageRepository{
  Future<Either<Failure,List<ImageModel>>> getImagesList();
  Future<Either<Failure, void>> uploadImage(File image);
}
import 'package:clean_line/core/error/failure.dart';
import 'package:clean_line/core/usecase/usecase.dart';
import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:clean_line/fealure/domain/repositories/image_repository.dart';
import 'package:dartz/dartz.dart';

class GetImagesList extends UseCaseNoParams<List<ImageModel>>{
  GetImagesList({required this.imageRepository});

  final ImageRepository imageRepository;

  @override
  Future<Either<Failure, List<ImageModel>>> call() async {
    try{
      return imageRepository.getImagesList();
    } catch(e){
      return Left(CacheFailure(e.toString()));
    }
  }
}
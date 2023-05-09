
import 'package:clean_line/fealure/data/models/Image_model.dart';
import 'package:clean_line/fealure/domain/usecases/get_imeges_list.dart';
import 'package:clean_line/fealure/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'index.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({
    required this.getImagesList,
  }) : super(const Initial());

  GetImagesList getImagesList;
  late List<ImageModel> _imagesList;

  Future<void> init() async{
    emit(const Loading());
    final failureOrimagesList = await getImagesList();

    failureOrimagesList.fold(
      (error) => emit(Error(error)),
      (imagesList) {
        _imagesList = imagesList;
        emit(Catalog(imagesList: _imagesList));
      }
    );
  }

  void addPhoto() {
    Get.toNamed(Routes.CAMERA);
  }

  void toImage({required ImageModel image}) {
    emit(Photo(image: image));
  }

  void toCatalog() {
    emit(Catalog(imagesList: _imagesList));
  }
}

import 'package:clean_line/fealure/data/datasources/local/image_local_data_source.dart';
import 'package:clean_line/fealure/data/datasources/remote/image_remote_data_source.dart';
import 'package:clean_line/fealure/data/repositories/imge_repository_impl.dart';
import 'package:clean_line/fealure/domain/repositories/image_repository.dart';
import 'package:clean_line/fealure/domain/usecases/upload_image.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'core/core.dart';
import 'fealure/domain/usecases/get_imeges_list.dart';
import 'fealure/presentation/camera/controller/index.dart';
import 'fealure/presentation/home/controller/index.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => HomeController(getImagesList: sl()));
  sl.registerFactory(() => CameraController(uploadImage: sl()));


  //UseCases
  sl.registerLazySingleton(() => GetImagesList(imageRepository:  sl()));
  sl.registerLazySingleton(() => UploadImage(imageRepository:  sl()));

  //Repository
  sl.registerLazySingleton<ImageRepository>(
        () => ImageRepositoryImpl(
          imageLocalDataSourse: sl(),
          imageRemoteDataSourse: sl(),
    ),
  );

  // DataSorce

  sl.registerLazySingleton<ImageLocalDataSourse>(
        () => ImagesLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<ImageRemoteDataSourse>(
        () => ImageRemoteDataSourseImpl(),
  );

  //Core
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(sl()),
  );

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
